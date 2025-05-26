import 'package:civic_server/src/endpoints/post_endpoint.dart';
import 'package:civic_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

/// An endpoint for handling project-related API requests.
///
/// This class extends [Endpoint] and provides methods to manage
/// project resources, such as:
/// Creating, updating, retrieving, and deleting projects.
/// Creating, updating, retrieving, and deleting project reviews.
/// Creating, updating, retrieving, and deleting project vettings.
/// Reacting to projects, project reviews, and project vettings.
/// Bookmarking and reposting a project.
class ProjectEndpoint extends Endpoint {
  /// Retrieves a [Project] by its [projectId] from the database, including its owner and associated user info.
  ///
  /// Throws a [PostException] if the project cannot be found, possibly due to deletion.
  ///
  /// Parameters:
  /// - [projectId]: The unique identifier of the project to retrieve.
  ///
  /// Returns the [Project] if found, otherwise throws an exception.
  Future<Project> getProject(Session session, int projectId) async {
    final result = await Project.db.findById(
      session,
      projectId,
      include: Project.include(
        owner: UserRecord.include(
          userInfo: UserInfo.include(),
        ),
      ),
    );
    if (result == null) {
      throw PostException(
          message:
              'This project cannot be found. It may have been permanently deleted.');
    }
    return result;
  }

  /// Retrieves the [ProjectReview] for a given project and the authenticated user.
  ///
  /// Throws a [PostException] if:
  /// - The project has been deleted by its owner.
  /// - The authenticated user is the owner of the project (owners cannot review their own projects).
  ///
  /// Parameters:
  /// - [projectId]: The ID of the project to retrieve the review for.
  ///
  /// Returns the [ProjectReview] if found, otherwise returns `null`.
  Future<ProjectReview?> getProjectReview(
    Session session,
    int projectId,
  ) async {
    final user = await authUser(
      session,
    );
    final project = await Project.db.findById(
      session,
      projectId,
    );

    if (project != null) {
      if (project.isDeleted!) {
        throw PostException(
          message:
              'This project has been deleted by its owner. Reviews are not allowed.',
        );
      }
      if (user.userInfoId == project.ownerId) {
        throw PostException(
          message:
              'Projects you create can only be reviewed by your constituents. Try sharing this project.',
          action: 'share',
        );
      }
    }

    final result = await ProjectReview.db.findFirstRow(
      session,
      where: (row) =>
          row.projectId.equals(projectId) &
          row.ownerId.equals(
            user.userInfoId,
          ),
      include: ProjectReview.include(
        project: Project.include(),
      ),
    );
    return result;
  }

  /// Saves a [Project] to the database.
  ///
  /// If the [project] has an `id`, it updates the existing project after validating
  /// that the current user owns the project. The `updatedAt` field is set to the current time.
  ///
  /// If the [project] does not have an `id`, it creates a new project with the current user
  /// as the owner and initializes various list fields (e.g., `likedBy`, `repostedBy`) as empty.
  ///
  /// Logs and throws a [PostException] if an error occurs during the process.
  ///
  /// Parameters:
  /// - [project]: The project to save or update.
  ///
  /// Returns the saved or updated [Project].
  Future<Project> saveProject(
    Session session,
    Project project,
  ) async {
    try {
      final user = await authUser(
        session,
      );

      if (project.id != null) {
        await validateProjectOwnership(
          session,
          project.id!,
          user,
        );

        final updatedProject = project.copyWith(
          updatedAt: DateTime.now(),
        );
        await updateProject(
          session,
          updatedProject,
        );
        return updatedProject;
      } else {
        return await Project.db.insertRow(
          session,
          project.copyWith(
            ownerId: user.id,
            owner: user,
            dateCreated: DateTime.now(),
            likedBy: [],
            reviewedBy: [],
            verifiedBy: [],
            bookmarkedBy: [],
            vettedBy: [],
            quotedBy: [],
          ),
        );
      }
    } catch (e, stackTrace) {
      session.log(
        'Error in saveProject: $e',
        level: LogLevel.error,
        exception: e,
        stackTrace: stackTrace,
      );
      throw PostException(message: e.toString());
    }
  }

  /// Saves a [ProjectReview] for a given project. This method handles both creating a new review
  /// and updating an existing one within a database transaction. It performs the following steps:
  ///
  /// 1. Authenticates the user from the session.
  /// 2. Verifies that the project to be reviewed exists.
  /// 3. If updating an existing review:
  ///    - Validates review ownership.
  ///    - Updates the project's overall ratings by recalculating them based on the new review values.
  ///    - Updates the review record with new values and timestamps.
  /// 4. If creating a new review:
  ///    - Updates the project's overall ratings by including the new review.
  ///    - Adds the user to the list of reviewers.
  ///    - Inserts the new review record with initial values and timestamps.
  /// 5. Handles and logs exceptions, rethrowing known `PostException` errors.
  ///
  /// Throws a [PostException] if the project or review cannot be found, or if any other error occurs.
  ///
  /// Returns the saved [ProjectReview] object (either newly created or updated).
  ///
  /// Parameters:
  /// - [projectReview]: The review to be saved or updated.
  Future<ProjectReview> saveProjectReview(
    Session session,
    ProjectReview projectReview,
  ) async {
    return session.db.transaction((transaction) async {
      try {
        // Get authenticated user
        final user = await authUser(session);

        // Verify project exists
        final project = await Project.db.findById(
          session,
          projectReview.projectId,
          transaction: transaction,
        );
        if (project == null) {
          throw PostException(
              message:
                  'This project cannot be found. It may have been permanently deleted.');
        }

        // Helper function for rating calculations
        double calculateNewOverallRating({
          required double? currentOverall,
          required double? existingRating,
          required double? newRating,
          required int count,
        }) {
          final current = currentOverall ?? 0;
          final existing = existingRating ?? 0;
          final updated = newRating ?? 0;

          return (current * count - existing + updated) / count;
        }

        if (projectReview.id != null) {
          // Update existing review
          final existingReview = await ProjectReview.db.findById(
            session,
            projectReview.id!,
            transaction: transaction,
          );
          if (existingReview == null) {
            throw PostException(message: 'Review not found');
          }

          await validateProjectReviewOwnership(
              session, projectReview.id!, user);

          if (project.reviewedBy?.isNotEmpty ?? false) {
            final count = project.reviewedBy!.length;

            final updatedProject = project.copyWith(
              overallLocationRating: calculateNewOverallRating(
                currentOverall: project.overallLocationRating,
                existingRating: existingReview.locationRating,
                newRating: projectReview.locationRating,
                count: count,
              ),
              overallDescriptionRating: calculateNewOverallRating(
                currentOverall: project.overallDescriptionRating,
                existingRating: existingReview.descriptionRating,
                newRating: projectReview.descriptionRating,
                count: count,
              ),
              overallDatesRating: calculateNewOverallRating(
                currentOverall: project.overallDatesRating,
                existingRating: existingReview.datesRating,
                newRating: projectReview.datesRating,
                count: count,
              ),
              overallAttachmentsRating: calculateNewOverallRating(
                currentOverall: project.overallAttachmentsRating,
                existingRating: existingReview.attachmentsRating,
                newRating: projectReview.attachmentsRating,
                count: count,
              ),
              overAllCategoryRating: calculateNewOverallRating(
                currentOverall: project.overAllCategoryRating,
                existingRating: existingReview.categoryRating,
                newRating: projectReview.categoryRating,
                count: count,
              ),
              overallFundingRating: calculateNewOverallRating(
                currentOverall: project.overallFundingRating,
                existingRating: existingReview.fundingRating,
                newRating: projectReview.fundingRating,
                count: count,
              ),
              reviewedBy: project.reviewedBy,
            );

            await updateProject(session, updatedProject);
          }

          final updatedReview = projectReview.copyWith(
            likedBy: existingReview.likedBy,
            dislikedBy: existingReview.dislikedBy,
            dateCreated: existingReview.dateCreated,
            updatedAt: DateTime.now(),
          );
          await updateProjectReview(session, updatedReview);
          return updatedReview;
        } else {
          final oldCount = project.reviewedBy?.length ?? 0;

          final updatedProject = project.copyWith(
            overallLocationRating: _calculateNewAverage(
              current: project.overallLocationRating,
              currentCount: oldCount,
              newValue: projectReview.locationRating,
            ),
            overallDescriptionRating: _calculateNewAverage(
              current: project.overallDescriptionRating,
              currentCount: oldCount,
              newValue: projectReview.descriptionRating,
            ),
            overallDatesRating: _calculateNewAverage(
              current: project.overallDatesRating,
              currentCount: oldCount,
              newValue: projectReview.datesRating,
            ),
            overallAttachmentsRating: _calculateNewAverage(
              current: project.overallAttachmentsRating,
              currentCount: oldCount,
              newValue: projectReview.attachmentsRating,
            ),
            overAllCategoryRating: _calculateNewAverage(
              current: project.overAllCategoryRating,
              currentCount: oldCount,
              newValue: projectReview.categoryRating,
            ),
            overallFundingRating: _calculateNewAverage(
              current: project.overallFundingRating,
              currentCount: oldCount,
              newValue: projectReview.fundingRating,
            ),
            reviewedBy: [...project.reviewedBy ?? [], user.id!],
          );

          await updateProject(session, updatedProject);

          return await ProjectReview.db.insertRow(
            session,
            projectReview.copyWith(
              ownerId: user.id,
              owner: user,
              dateCreated: DateTime.now(),
              likedBy: [],
              dislikedBy: [],
            ),
            transaction: transaction,
          );
        }
      } on PostException {
        rethrow;
      } catch (e, stackTrace) {
        session.log(
          'Error in saveProjectReview: $e',
          level: LogLevel.error,
          exception: e,
          stackTrace: stackTrace,
        );
        throw PostException(message: e.toString());
      }
    });
  }

  /// Deletes a [ProjectReview] by its [reviewId] for the authenticated user.
  ///
  /// This method performs the following steps within a database transaction:
  /// 1. Authenticates the user from the [session].
  /// 2. Finds the review by [reviewId]. Throws a [PostException] if not found.
  /// 3. Checks if the authenticated user is the owner of the review. Throws a [PostException] if unauthorized.
  /// 4. Retrieves the associated project. Throws a [PostException] if the project is not found.
  /// 5. Updates the project's overall ratings and `reviewedBy` list:
  ///    - If this is the only review, resets all ratings and clears the `reviewedBy` list.
  ///    - Otherwise, recalculates each rating by removing the deleted review's contribution and updates the `reviewedBy` list.
  /// 6. Deletes the review from the database.
  ///
  /// Throws a [PostException] on any error, including database or authorization failures.
  ///
  /// Parameters:
  /// - [reviewId]: The id of the review to be deleted.
  Future<void> deleteProjectReview(Session session, int reviewId) async {
    return await session.db.transaction((transaction) async {
      try {
        final user = await authUser(session);

        final existingReview = await ProjectReview.db.findById(
          session,
          reviewId,
          transaction: transaction,
        );

        if (existingReview == null) {
          throw PostException(
              message:
                  'This review cannot be found. It may have been permanently deleted.');
        }

        if (existingReview.ownerId != user.id) {
          throw PostException(message: 'Unauthorized to delete this review');
        }

        final project = await Project.db.findById(
          session,
          existingReview.projectId,
          transaction: transaction,
        );

        if (project == null) {
          throw PostException(message: 'Associated project not found');
        }

        final reviewedBy = project.reviewedBy ?? [];
        final currentCount = reviewedBy.length;

        if (currentCount <= 1) {
          // If only one review existed, reset ratings
          final updatedProject = project.copyWith(
            overallLocationRating: 0,
            overallDescriptionRating: 0,
            overallDatesRating: 0,
            overallAttachmentsRating: 0,
            overAllCategoryRating: null,
            overallFundingRating: 0,
            reviewedBy: [],
          );
          await updateProject(session, updatedProject);
        } else {
          final newCount = currentCount - 1;

          double recalcRating(double? currentAvg, double? removedRating) {
            return ((currentAvg ?? 0) * currentCount - (removedRating ?? 0)) /
                newCount;
          }

          final updatedProject = project.copyWith(
            overallLocationRating: recalcRating(
              project.overallLocationRating,
              existingReview.locationRating,
            ),
            overallDescriptionRating: recalcRating(
              project.overallDescriptionRating,
              existingReview.descriptionRating,
            ),
            overallDatesRating: recalcRating(
              project.overallDatesRating,
              existingReview.datesRating,
            ),
            overallAttachmentsRating: recalcRating(
              project.overallAttachmentsRating,
              existingReview.attachmentsRating,
            ),
            overAllCategoryRating: recalcRating(
              project.overAllCategoryRating,
              existingReview.categoryRating,
            ),
            overallFundingRating: recalcRating(
              project.overallFundingRating,
              existingReview.fundingRating,
            ),
            reviewedBy: reviewedBy.where((id) => id != user.id).toList(),
          );

          await updateProject(session, updatedProject);
        }

        await ProjectReview.db.deleteRow(
          session,
          existingReview,
          transaction: transaction,
        );
      } catch (e, stackTrace) {
        session.log(
          'Error deleting project review: $e',
          level: LogLevel.error,
          exception: e,
          stackTrace: stackTrace,
        );
        throw PostException(message: e.toString());
      }
    });
  }

  /// Deletes a [ProjectVetting] entry by its [vettingId].
  ///
  /// This method performs the following steps within a database transaction:
  /// 1. Authenticates the current user.
  /// 2. Finds the vetting entry by [vettingId]. Throws a [PostException] if not found.
  /// 3. Checks that the authenticated user is the owner of the vetting entry.
  ///    -  Throws a [PostException] if unauthorized.
  /// 4. Retrieves the associated project. Throws a [PostException] if not found.
  /// 5. Updates the project's `vettedBy` list to remove the user's ID.
  /// 6. Deletes the vetting entry from the database.
  ///
  /// If any error occurs during the process, logs the error and throws a [PostException].
  ///
  /// Throws a [PostException] for not found, unauthorized, or other errors.
  ///
  /// Parameters:
  /// - [vettingId]: The id of the vetting to be deleted.
  Future<void> deleteProjectVetting(Session session, int vettingId) async {
    return await session.db.transaction((transaction) async {
      try {
        final user = await authUser(session);

        final existingVetting = await ProjectVetting.db.findById(
          session,
          vettingId,
          transaction: transaction,
        );

        if (existingVetting == null) {
          throw PostException(
              message:
                  'This vetting cannot be found. It may have been permanently deleted.');
        }

        if (existingVetting.ownerId != user.id) {
          throw PostException(message: 'Unauthorized to delete this vetting');
        }

        final project = await Project.db.findById(
          session,
          existingVetting.projectId,
          transaction: transaction,
        );

        if (project == null) {
          throw PostException(message: 'Associated project not found');
        }

        final updatedProject = project.copyWith(
          vettedBy: project.vettedBy?.where((id) => id != user.id).toList(),
        );
        await updateProject(session, updatedProject);

        await ProjectVetting.db.deleteRow(
          session,
          existingVetting,
          transaction: transaction,
        );
      } catch (e, stackTrace) {
        session.log(
          'Error deleting project vetting: $e',
          level: LogLevel.error,
          exception: e,
          stackTrace: stackTrace,
        );
        throw PostException(message: e.toString());
      }
    });
  }

  /// Undoes a repost action for a given project.
  ///
  /// Calls the [PostEndpoint.repostOrQuote] method with the provided [session] and [projectId],
  /// effectively reversing a previous repost operation.
  ///
  /// [session] - The current user session.
  /// [projectId] - The ID of the project to undo the repost for.
  ///
  /// Throws an exception if the operation fails.  
  Future<void> undoRepost(
    Session session,
    int projectId,
  ) async {
    await PostEndpoint().repostOrQuote(
      session,
      projectId,
      null,
    );
  }

  /// Schedules a future call to handle the specified [project] at the given [dateTime].
  ///
  /// Uses the [session]'s serverpod to schedule a future call named 'scheduleProjectFutureCall'.
  ///
  /// Parameters:
  /// [project] - The project to be scheduled.
  /// [dateTime] - The date and time when the future call should be executed.
  Future<void> scheduleProject(
    Session session,
    Project project,
    DateTime dateTime,
  ) async {
    await session.serverpod.futureCallAtTime(
      'scheduleProjectFutureCall',
      project,
      dateTime,
    );
  }

  /// Retrieves a paginated list of projects, excluding those the authenticated user has marked as "not interested".
  ///
  /// Throws a [UserException] if the pagination parameters [limit] or [page] are invalid (less than or equal to zero).
  ///
  /// The returned [ProjectList] contains:
  /// - [count]: Total number of projects available (excluding ignored).
  /// - [limit]: The maximum number of projects per page.
  /// - [page]: The current page number.
  /// - [results]: The list of [Project]s for the current page, including their owners and user info.
  /// - [numPages]: The total number of pages.
  /// - [canLoadMore]: Whether there are more projects to load.
  ///
  /// Logs and throws a [PostException] if an error occurs during fetching.
  ///
  /// Parameters:
  /// - [limit]: Maximum number of projects to return per page (default: 50).
  /// - [page]: The page number to retrieve (default: 1).
  Future<ProjectList> getProjects(
    Session session, {
    int limit = 50,
    int page = 1,
  }) async {
    try {
      if (limit <= 0 || page <= 0) {
        throw UserException(
          message: 'Invalid pagination parameters',
        );
      }
      final user = await authUser(session);
      final ignored = await ProjectNotInterested.db.find(
        session,
        where: (t) => t.userId.equals(user.id!),
      );
      final ignoredIds = ignored.map((e) => e.projectId).toSet();

      final count = await Project.db.count(
        session,
        where: (t) => t.id.notInSet(ignoredIds),
      );
      final results = await Project.db.find(
        session,
        limit: limit,
        offset: (page - 1) * limit,
        include: Project.include(
          owner: UserRecord.include(
            userInfo: UserInfo.include(),
          ),
        ),
        where: (t) => t.id.notInSet(ignoredIds),
        orderBy: (t) => t.dateCreated,
        orderDescending: true,
      );

      return ProjectList(
        count: count,
        limit: limit,
        page: page,
        results: results,
        numPages: (count / limit).ceil(),
        canLoadMore: page * limit < count,
      );
    } catch (e, stackTrace) {
      session.log(
        'Error in getProjects: $e',
        level: LogLevel.error,
        exception: e,
        stackTrace: stackTrace,
      );
      throw PostException(
        message: 'Error fetching projects',
      );
    }
  }

  /// Retrieves a paginated list of project reviews for a specific project.
  ///
  /// Parameters
  /// [projectId]: The ID of the project to fetch reviews for.
  /// [limit]: The maximum number of reviews to return per page (default is 50).
  /// [page]: The page number to retrieve (default is 1).
  /// [rating]: An optional rating value to filter reviews by a specific rating category.
  /// [cardinal]: The rating category to filter by (e.g., 'Location', 'Description', etc.).
  ///
  /// Returns a [ProjectReviewList] containing the reviews, pagination info, and total count.
  ///
  /// Throws a [UserException] if pagination parameters are invalid or if an invalid
  /// rating category is provided.
  /// Throws a [PostException] if an error occurs while fetching reviews.
  Future<ProjectReviewList> getProjectReviews(
    Session session,
    int projectId, {
    int limit = 50,
    int page = 1,
    double? rating,
    String? cardinal,
  }) async {
    try {
      if (limit <= 0 || page <= 0) {
        throw UserException(
          message: 'Invalid pagination parameters',
        );
      }

      // Initialize filters
      List<Expression> filters = [ProjectReview.t.projectId.equals(projectId)];

      // Apply rating filter
      if (rating != null && cardinal != null) {
        final ratingMap = {
          'Location': ProjectReview.t.locationRating,
          'Description': ProjectReview.t.descriptionRating,
          'Dates': ProjectReview.t.datesRating,
          'Attachments': ProjectReview.t.attachmentsRating,
          'Category': ProjectReview.t.categoryRating,
          'Funding': ProjectReview.t.fundingRating,
        };

        if (!ratingMap.containsKey(cardinal)) {
          throw UserException(
            message: 'Invalid cardinal parameter',
          );
        }

        filters.add(
          ratingMap[cardinal]!.equals(rating),
        );
      }

      // Construct final where clause
      whereClause(t) => filters.reduce((a, b) => a & b);

      // Get count with filters applied
      final count = await ProjectReview.db.count(
        session,
        where: whereClause,
      );

      // Fetch results with filters
      final results = await ProjectReview.db.find(
        session,
        limit: limit,
        offset: (page - 1) * limit,
        include: ProjectReview.include(
          owner: UserRecord.include(
            userInfo: UserInfo.include(),
          ),
        ),
        where: whereClause,
        orderBy: (t) => t.dateCreated,
        orderDescending: true,
      );

      return ProjectReviewList(
        count: count,
        limit: limit,
        page: page,
        results: results,
        numPages: (count / limit).ceil(),
        canLoadMore: page * limit < count,
      );
    } catch (e, stackTrace) {
      session.log(
        'Error in getProjectReviews: $e',
        level: LogLevel.error,
        exception: e,
        stackTrace: stackTrace,
      );
      throw PostException(
        message: 'Error fetching project reviews',
      );
    }
  }

  /// Handles user reactions (like/dislike) to a project review.
  ///
  /// This method allows an authenticated user to like or dislike a specific project review.
  /// It manages the following scenarios within a database transaction:
  /// - If the review does not exist, throws a [PostException].
  /// - If the user has previously reacted and the reaction was soft-deleted, it reactivates the reaction.
  /// - If the user repeats the same reaction, it soft-deletes the reaction (removes the like/dislike).
  /// - If the user switches between like and dislike, it updates the reaction accordingly.
  /// - If the user has not reacted before, it creates a new reaction.
  /// The method also updates the `likedBy` and `dislikedBy` lists on the review and persists the changes.
  ///
  /// Throws a [PostException] if the review cannot be found or if any error occurs during the process.
  ///
  /// Parameters:
  /// - [reviewId]: The ID of the review to react to.
  /// - [isLike]: `true` for a like, `false` for a dislike.
  ///
  /// Returns the updated [ProjectReview] object.
  Future<ProjectReview> reactToReview(
    Session session,
    int reviewId,
    bool isLike,
  ) async {
    ProjectReview? review;
    ProjectReviewReaction? existingReaction;
    ProjectReviewReaction? newReaction;
    final user = await authUser(session);
    await session.db.transaction((transaction) async {
      try {
        // Fetch the review
        review = await ProjectReview.db.findById(
          session,
          reviewId,
          transaction: transaction,
        );
        if (review == null) {
          throw PostException(
              message:
                  'This review cannot be found. It may have been permanently deleted.');
        }

        // Check for an existing reaction
        existingReaction = await ProjectReviewReaction.db.findFirstRow(
          session,
          where: (r) => r.reviewId.equals(reviewId) & r.ownerId.equals(user.id),
          transaction: transaction,
        );

        if (existingReaction != null) {
          if (existingReaction!.isDeleted ?? false) {
            // Reactivate a soft-deleted reaction
            existingReaction!.isLike = isLike;
            existingReaction!.isDeleted = false;
            await ProjectReviewReaction.db.updateRow(
              session,
              existingReaction!,
              transaction: transaction,
            );
            isLike
                ? review!.likedBy?.add(user.id!)
                : review!.dislikedBy?.add(user.id!);
          } else if (existingReaction!.isLike == isLike) {
            existingReaction!.isDeleted = true;
            await ProjectReviewReaction.db.updateRow(
              session,
              existingReaction!,
              transaction: transaction,
            );
            isLike
                ? review!.likedBy?.remove(user.id!)
                : review!.dislikedBy?.remove(user.id!);
          } else {
            // Switch between like and dislike
            existingReaction!.isLike = isLike;
            await ProjectReviewReaction.db.updateRow(
              session,
              existingReaction!,
              transaction: transaction,
            );
            if (isLike) {
              review!.likedBy?.add(user.id!);
              review!.dislikedBy?.remove(user.id);
            } else {
              review!.likedBy?.remove(user.id);
              review!.dislikedBy?.add(user.id!);
            }
          }
        } else {
          // Create a new reaction
          newReaction = ProjectReviewReaction(
            ownerId: user.id!,
            reviewId: reviewId,
            isLike: isLike,
            isDeleted: false,
          );
          await ProjectReviewReaction.db.insertRow(
            session,
            newReaction!,
            transaction: transaction,
          );
          isLike
              ? review!.likedBy?.add(user.id!)
              : review!.dislikedBy?.add(user.id!);
        }

        // Update the like/dislike count on the review
        await updateProjectReview(session, review!);
      } catch (e, stackTrace) {
        session.log(
          'Error in reactToReview: $e',
          level: LogLevel.error,
          exception: e,
          stackTrace: stackTrace,
        );
        throw PostException(message: e.toString());
      }
    });
    return review!;
  }

  /// Handles user reactions (like or dislike) to a project vetting.
  ///
  /// This method allows an authenticated user to like or dislike a specific project vetting.
  /// It manages the following scenarios within a database transaction:
  /// - If the vetting does not exist, throws a [PostException].
  /// - If the user has previously reacted and the reaction was soft-deleted, it reactivates the reaction.
  /// - If the user repeats the same reaction, it soft-deletes the reaction (removes the like/dislike).
  /// - If the user switches between like and dislike, it updates the reaction accordingly.
  /// - If the user has not reacted before, it creates a new reaction.
  /// The method also updates the `likedBy` and `dislikedBy` lists on the vetting and persists the changes.
  ///
  /// Throws a [PostException] if any error occurs during the process.
  ///
  /// Returns the updated [ProjectVetting] object.
  ///
  /// Parameters:
  /// - [vettingId]: The ID of the vetting to react to.
  /// - [isLike]: `true` for a like, `false` for a dislike.
  Future<ProjectVetting> reactToVetting(
    Session session,
    int vettingId,
    bool isLike,
  ) async {
    ProjectVetting? vetting;
    ProjectVettingReaction? existingReaction;
    ProjectVettingReaction? newReaction;
    final user = await authUser(session);
    await session.db.transaction((transaction) async {
      try {
        // Fetch the review
        vetting = await ProjectVetting.db.findById(
          session,
          vettingId,
          transaction: transaction,
        );
        if (vetting == null) {
          throw PostException(
              message:
                  'This review cannot be found. It may have been permanently deleted.');
        }

        // Check for an existing reaction
        existingReaction = await ProjectVettingReaction.db.findFirstRow(
          session,
          where: (r) =>
              r.vettingId.equals(vettingId) & r.ownerId.equals(user.id),
          transaction: transaction,
        );

        if (existingReaction != null) {
          if (existingReaction!.isDeleted ?? false) {
            // Reactivate a soft-deleted reaction
            existingReaction!.isLike = isLike;
            existingReaction!.isDeleted = false;
            await ProjectVettingReaction.db.updateRow(
              session,
              existingReaction!,
              transaction: transaction,
            );
            isLike
                ? vetting!.likedBy?.add(user.id!)
                : vetting!.dislikedBy?.add(user.id!);
          } else if (existingReaction!.isLike == isLike) {
            existingReaction!.isDeleted = true;
            await ProjectVettingReaction.db.updateRow(
              session,
              existingReaction!,
              transaction: transaction,
            );
            isLike
                ? vetting!.likedBy?.remove(user.id!)
                : vetting!.dislikedBy?.remove(user.id!);
          } else {
            // Switch between like and dislike
            existingReaction!.isLike = isLike;
            await ProjectVettingReaction.db.updateRow(
              session,
              existingReaction!,
              transaction: transaction,
            );
            if (isLike) {
              vetting!.likedBy?.add(user.id!);
              vetting!.dislikedBy?.remove(user.id);
            } else {
              vetting!.likedBy?.remove(user.id);
              vetting!.dislikedBy?.add(user.id!);
            }
          }
        } else {
          // Create a new reaction
          newReaction = ProjectVettingReaction(
            ownerId: user.id!,
            vettingId: vettingId,
            isLike: isLike,
            isDeleted: false,
          );
          await ProjectVettingReaction.db.insertRow(
            session,
            newReaction!,
            transaction: transaction,
          );
          isLike
              ? vetting!.likedBy?.add(user.id!)
              : vetting!.dislikedBy?.add(user.id!);
        }

        // Update the like/dislike count on the vetting
        await updateProjectVetting(session, vetting!);
      } catch (e, stackTrace) {
        session.log(
          'Error in reactToReview: $e',
          level: LogLevel.error,
          exception: e,
          stackTrace: stackTrace,
        );
        throw PostException(message: e.toString());
      }
    });
    return vetting!;
  }

  /// Deletes a project by marking it as deleted.
  ///
  /// This method performs the following steps:
  /// 1. Authenticates the user from the session.
  /// 2. Validates that the authenticated user owns the project with the given [projectId].
  /// 3. Retrieves the project from the database.
  /// 4. If the project does not exist, throws a [PostException].
  /// 5. Marks the project as deleted by setting its `isDeleted` property to `true`.
  /// 6. Updates the project in the database.
  ///
  /// Throws a [PostException] if the project is not found.
  ///
  /// Parameters:
  /// [projectId] - The ID of the project to delete.
  Future<void> deleteProject(
    Session session,
    int projectId,
  ) async {
    final user = await authUser(
      session,
    );
    await validateProjectOwnership(
      session,
      projectId,
      user,
    );

    final project = await Project.db.findById(session, projectId);

    if (project == null) {
      throw PostException(message: 'Project not found');
    }

    final newProject = project.copyWith(
      isDeleted: true,
    );

    await updateProject(session, newProject);
  }

  /// Toggles the bookmark status of a project for the authenticated user.
  ///
  /// - If the user has already bookmarked the project, this method removes the bookmark.
  /// - Otherwise, it adds a new bookmark for the project.
  /// - The operation is performed within a database transaction to ensure consistency.
  /// - Updates the `bookmarkedBy` field of the project accordingly.
  ///
  /// Throws a [PostException] if the project is not found.
  ///
  /// Logs any errors encountered during the process.
  ///
  /// Parameters:
  /// - [projectId]: The ID of the project to toggle the bookmark for.
  Future<void> toggleBookmark(
    Session session,
    int projectId,
  ) async {
    Project? project;
    final user = await authUser(session);

    await session.db.transaction((transaction) async {
      try {
        project = await Project.db.findById(
          session,
          projectId,
          transaction: transaction,
        );
        if (project == null) {
          throw PostException(
            message: "Project not found",
          );
        }

        final existingBookmark = await ProjectBookmarks.db.findFirstRow(
          session,
          where: (t) =>
              t.projectId.equals(
                projectId,
              ) &
              t.ownerId.equals(
                user.userInfoId,
              ),
          transaction: transaction,
        );

        if (existingBookmark != null) {
          await ProjectBookmarks.db.deleteRow(
            session,
            existingBookmark,
            transaction: transaction,
          );
          project!.bookmarkedBy?.remove(user.id!);
        } else {
          await ProjectBookmarks.db.insertRow(
            session,
            ProjectBookmarks(
              projectId: projectId,
              ownerId: user.userInfoId,
            ),
            transaction: transaction,
          );
          project!.bookmarkedBy?.add(user.id!);
        }
        await updateProject(session, project!);
      } catch (e, stackTrace) {
        session.log(
          'Error in toggleBookmark: $e',
          level: LogLevel.error,
          exception: e,
          stackTrace: stackTrace,
        );
      }
    });
  }

  /// Toggles the like status for a project by the authenticated user.
  ///
  /// - If the user has already liked the project, this method will remove the like.
  /// - If the user has not liked the project yet, this method will add a like.
  /// - The operation is performed within a database transaction to ensure consistency.
  ///
  /// Throws a [PostException] if the project is not found.
  ///
  /// Logs any errors encountered during the operation.
  ///
  /// Parameters:
  /// - [projectId]: The ID of the project to like or unlike.
  Future<void> toggleLike(
    Session session,
    int projectId,
  ) async {
    Project? project;
    final user = await authUser(session);
    await session.db.transaction((transaction) async {
      try {
        project = await Project.db.findById(
          session,
          projectId,
          transaction: transaction,
        );
        if (project == null) {
          throw PostException(
            message: "Project not found",
          );
        }

        final existingLike = await ProjectLikes.db.findFirstRow(
          session,
          where: (t) =>
              t.projectId.equals(
                projectId,
              ) &
              t.ownerId.equals(
                user.userInfoId,
              ),
          transaction: transaction,
        );

        if (existingLike != null) {
          await ProjectLikes.db.deleteRow(
            session,
            existingLike,
            transaction: transaction,
          );
          project!.likedBy?.remove(user.id!);
        } else {
          await ProjectLikes.db.insertRow(
            session,
            ProjectLikes(
              projectId: projectId,
              ownerId: user.userInfoId,
              dateCreated: DateTime.now(),
            ),
            transaction: transaction,
          );
          project!.likedBy?.add(user.id!);
        }
        await updateProject(session, project!);
      } catch (e, stackTrace) {
        session.log(
          'Error in toggleLike: $e',
          level: LogLevel.error,
          exception: e,
          stackTrace: stackTrace,
        );
      }
    });
  }

  /// Marks a project as "not interested" for the authenticated user.
  ///
  /// This method retrieves the authenticated user from the [session] and creates
  /// a [ProjectNotInterested] entry associating the user with the specified [projectId].
  /// The entry is then inserted into the database. If an error occurs during the process,
  /// it is logged with error level, including the exception and stack trace.
  ///
  /// Parameters:
  /// [projectId] - The ID of the project to mark as not interested.
  ///
  /// Throws an exception if the operation fails.
  Future<void> markNotInterested(
    Session session,
    int projectId,
  ) async {
    try {
      final user = await authUser(session);
      final entry = ProjectNotInterested(
        userId: user.id!,
        projectId: projectId,
      );

      await ProjectNotInterested.db.insertRow(
        session,
        entry,
      );
    } catch (e, stackTrace) {
      session.log(
        'Error in markNotInterested: $e',
        level: LogLevel.error,
        exception: e,
        stackTrace: stackTrace,
      );
    }
  }

  /// Vets a project by either updating an existing vetting record or creating a new one.
  ///
  /// This method performs the following steps within a database transaction:
  /// - Authenticates the user from the session.
  /// - Checks if the project with the given [projectVetting.projectId] exists.
  ///   - Throws a [PostException] if the project cannot be found.
  /// - Checks if the user has already vetted the project.
  ///   - If an existing vetting record is found, updates its `updatedAt` timestamp and returns the updated record.
  ///   - If no vetting record exists, adds the user's ID to the project's `vettedBy` list,
  ///     creates a new vetting record with empty `likedBy` and `dislikedBy` lists, and returns it.
  /// - Logs and rethrows any [PostException], or wraps other exceptions in a [PostException].
  ///
  /// Throws a [PostException] if the project does not exist or if an unexpected error occurs.
  ///
  /// Returns the updated or newly created [ProjectVetting] record.
  ///
  /// Parameters:
  /// - [projectVetting]: The project vetting object to be processed.
  Future<ProjectVetting> vetProject(
    Session session,
    ProjectVetting projectVetting,
  ) async {
    final user = await authUser(session);
    return await session.db.transaction((transaction) async {
      try {
        final project = await Project.db.findById(
          session,
          projectVetting.projectId,
          transaction: transaction,
        );
        if (project == null) {
          throw PostException(
              message:
                  'This project cannot be found. It may have been permanently deleted.');
        }
        final existingVet = await ProjectVetting.db.findFirstRow(
          session,
          where: (t) =>
              t.projectId.equals(projectVetting.projectId) &
              t.ownerId.equals(
                user.id,
              ),
          transaction: transaction,
        );

        if (existingVet != null) {
          final updatedVet = projectVetting.copyWith(
            updatedAt: DateTime.now(),
            createdAt: existingVet.createdAt,
          );
          await updateProjectVetting(session, updatedVet);
          return updatedVet;
        } else {
          final newProject = project.copyWith(
            vettedBy: [...project.vettedBy ?? [], user.id!],
          );
          await updateProject(session, newProject);
          return await ProjectVetting.db.insertRow(
            session,
            projectVetting.copyWith(
              likedBy: [],
              dislikedBy: [],
            ),
            transaction: transaction,
          );
        }
      } on PostException {
        rethrow;
      } catch (e, stackTrace) {
        session.log(
          'Error in vetProject: $e',
          level: LogLevel.error,
          exception: e,
          stackTrace: stackTrace,
        );
        throw PostException(message: e.toString());
      }
    });
  }

  /// Retrieves the vetted project for the authenticated user and specified project ID.
  ///
  /// This method first authenticates the user from the provided [session], then attempts to find
  /// the project with the given [projectId]. If the project does not exist, a [PostException] is thrown.
  /// If the project exists, it searches for a [ProjectVetting] record associated with both the project
  /// and the authenticated user. The related [Project] is also included in the result.
  ///
  /// Returns a [ProjectVetting] instance if found, or `null` if no matching record exists.
  ///
  /// Throws a [PostException] if the project does not exist.
  ///
  /// Parameters:
  /// - [projectId]: The ID of the project to retrieve.
  Future<ProjectVetting?> getVettedProject(
    Session session,
    int projectId,
  ) async {
    final user = await authUser(
      session,
    );

    final project = await Project.db.findById(
      session,
      projectId,
    );

    if (project == null) {
      throw PostException(
        message:
            'This project does not exist. It may have been permanently deleted.',
      );
    }

    final result = await ProjectVetting.db.findFirstRow(
      session,
      where: (row) =>
          row.projectId.equals(projectId) &
          row.ownerId.equals(
            user.userInfoId,
          ),
      include: ProjectVetting.include(
        project: Project.include(),
      ),
    );
    return result;
  }

  /// Retrieves a paginated list of vetted projects.
  ///
  /// Throws a [UserException] if the provided [limit] or [page] parameters are invalid (less than or equal to zero).
  ///
  /// Parameters:
  /// - [limit]: The maximum number of projects to return per page (default is 50).
  /// - [page]: The page number to retrieve (default is 1).
  ///
  /// Returns a [ProjectVetList] containing:
  /// - The total count of vetted projects.
  /// - The current page and limit.
  /// - The list of vetted project results for the requested page.
  /// - The total number of pages.
  /// - Whether more pages can be loaded.
  Future<ProjectVetList> getVettedProjects(
    Session session, {
    int limit = 50,
    int page = 1,
  }) async {
    if (limit <= 0 || page <= 0) {
      throw UserException(
        message: 'Invalid pagination parameters',
      );
    }

    final count = await ProjectVetting.db.count(
      session,
    );
    final results = await ProjectVetting.db.find(
      session,
      limit: limit,
      offset: (page - 1) * limit,
      include: ProjectVetting.include(
        owner: UserRecord.include(
          userInfo: UserInfo.include(),
        ),
      ),
      orderBy: (t) => t.createdAt,
      orderDescending: true,
    );

    return ProjectVetList(
      count: count,
      limit: limit,
      page: page,
      results: results,
      numPages: (count / limit).ceil(),
      canLoadMore: page * limit < count,
    );
  }

  /// Authenticates the current user based on the provided [session].
  ///
  /// Retrieves authentication information from the [session]. If the user is not
  /// authenticated, a [UserException] is thrown with an appropriate message.
  /// If authenticated, attempts to find the corresponding [UserRecord] in the database,
  /// including related [UserInfo]. If the user record is not found, another [UserException]
  /// is thrown. Otherwise, returns the authenticated [UserRecord].
  ///
  /// Throws:
  ///   - [UserException] if the user is not logged in or the user record is not found.
  ///
  /// Returns:
  ///   - The authenticated [UserRecord] with included [UserInfo].
  Future<UserRecord> authUser(
    Session session,
  ) async {
    final authInfo = await session.authenticated;
    if (authInfo == null) {
      throw UserException(
        message: 'You must be logged in',
      );
    }

    final user = await UserRecord.db.findFirstRow(
      session,
      where: (row) => row.userInfoId.equals(
        authInfo.userId,
      ),
      include: UserRecord.include(
        userInfo: UserInfo.include(),
      ),
    );

    if (user == null) {
      throw UserException(
        message: 'User not found',
      );
    }

    return user;
  }

  /// Validates that the given [user] is the owner of the project with the specified [projectId].
  ///
  /// Throws a [PostException] if the project does not exist or if the user is not the owner.
  ///
  /// Parameters:
  /// [projectId] - The ID of the project to validate ownership for.
  /// [user] - The user attempting the operation.
  Future<void> validateProjectOwnership(
    Session session,
    int projectId,
    UserRecord user,
  ) async {
    final project = await Project.db.findById(
      session,
      projectId,
    );
    if (project == null) {
      throw PostException(
        message: 'Project not found',
      );
    }
    if (project.ownerId != user.userInfoId) {
      throw PostException(
        message: 'Unauthorised operation',
      );
    }
  }

  /// Validates that the given [user] is the owner of the project review with the specified [projectReviewId].
  ///
  /// Throws a [PostException] if the project review is not found or if the user is not the owner.
  ///
  /// Parameters:
  /// [projectReviewId] - The ID of the project review to validate.
  /// [user] - The user attempting the operation.
  Future<void> validateProjectReviewOwnership(
    Session session,
    int projectReviewId,
    UserRecord user,
  ) async {
    final projectReview = await ProjectReview.db.findById(
      session,
      projectReviewId,
    );
    if (projectReview == null) {
      throw PostException(
        message: 'Project review not found',
      );
    }
    if (projectReview.ownerId != user.userInfoId) {
      throw PostException(
        message: 'Unauthorised operation',
      );
    }
  }

  /// Returns a stream of [Project] updates for the specified [projectId].
  ///
  /// When a client subscribes, this method first yields the latest project details,
  /// including the owner and their user info. It then listens for further updates
  /// to the project via a message stream and yields updated [Project] instances
  /// as they occur. Each update preserves the original owner information.
  ///
  /// - [session]: The current session context.
  /// - [projectId]: The ID of the project to subscribe to updates for.
  ///
  /// Yields:
  ///   - The initial [Project] details.
  ///   - Subsequent [Project] updates as they occur.
  Stream<Project> projectUpdates(Session session, int projectId) async* {
    // Create a message stream for this project
    var updateStream =
        session.messages.createStream<Project>('project_$projectId');

    // Yield the latest project details when the client subscribes
    var project = await Project.db.findById(
      session,
      projectId,
      include: Project.include(
        owner: UserRecord.include(
          userInfo: UserInfo.include(),
        ),
      ),
    );
    if (project != null) {
      yield project;
    }

    // Send updates when changes occur
    await for (var projectUpdate in updateStream) {
      yield projectUpdate.copyWith(
        owner: project!.owner,
      );
    }
  }

  /// Updates the given [project] in the database and notifies all clients
  /// subscribed to this project by sending an update message.
  ///
  /// Parameters:
  /// - [project]: The project instance to be updated.
  ///
  /// This method first updates the project in the database, then posts a message
  /// to all clients subscribed to the project's channel to notify them of the update.
  Future<void> updateProject(Session session, Project project) async {
    // Update the project in the database
    await Project.db.updateRow(session, project);

    // Send an update to all clients subscribed to this project
    session.messages.postMessage(
      'project_${project.id}',
      project,
    );
  }

  /// Returns a stream of [ProjectReview] updates for the specified [reviewId].
  ///
  /// When a client subscribes, this method first yields the latest [ProjectReview]
  /// from the database, including its [owner] and associated [UserInfo].
  /// Then, it listens for real-time updates on the review via the session's message stream,
  /// yielding each update as it occurs. The [owner] information is preserved in each update.
  ///
  /// - [session]: The current user session.
  /// - [reviewId]: The ID of the project review to subscribe to.
  ///
  /// Yields:
  ///   - The initial [ProjectReview] object (if found).
  ///   - Subsequent updates to the [ProjectReview] as they occur.
  Stream<ProjectReview> projectReviewUpdates(
    Session session,
    int reviewId,
  ) async* {
    // Create a message stream for this project
    var updateStream =
        session.messages.createStream<ProjectReview>('review_$reviewId');

    // Yield the latest project details when the client subscribes
    var projectReview = await ProjectReview.db.findById(
      session,
      reviewId,
      include: ProjectReview.include(
        owner: UserRecord.include(
          userInfo: UserInfo.include(),
        ),
      ),
    );
    if (projectReview != null) {
      yield projectReview;
    }

    // Send updates when changes occur
    await for (var projectReviewUpdate in updateStream) {
      yield projectReviewUpdate.copyWith(
        owner: projectReview!.owner,
      );
    }
  }

  /// Updates a [ProjectReview] in the database and notifies all clients subscribed to this review.
  ///
  /// This method performs the following actions:
  /// - Updates the specified [projectReview] in the database using the provided [session].
  /// - Sends a message to all clients subscribed to the review channel identified by `'review_${projectReview.id}'`,
  ///   containing the updated [projectReview] data.
  ///
  /// [session]: The current database session.
  /// [projectReview]: The project review object to update.
  Future<void> updateProjectReview(
      Session session, ProjectReview projectReview) async {
    await ProjectReview.db.updateRow(session, projectReview);

    // Send an update to all clients subscribed to this project
    session.messages.postMessage(
      'review_${projectReview.id}',
      projectReview,
    );
  }

  /// Returns a stream of [ProjectVetting] updates for the specified [vettingId].
  ///
  /// When a client subscribes, the latest [ProjectVetting] details are yielded first,
  /// including the owner and related user information. Subsequent updates are streamed
  /// as they occur, ensuring the owner information remains consistent with the initial fetch.
  ///
  /// - [session]: The current [Session] context.
  /// - [vettingId]: The ID of the project vetting to subscribe to.
  ///
  /// Yields:
  ///   - The initial [ProjectVetting] object if found.
  ///   - Any subsequent updates to the [ProjectVetting] object.
  Stream<ProjectVetting> projectVettingUpdates(
    Session session,
    int vettingId,
  ) async* {
    // Create a message stream for this project
    var updateStream =
        session.messages.createStream<ProjectVetting>('review_$vettingId');

    // Yield the latest project details when the client subscribes
    var projectVetting = await ProjectVetting.db.findById(
      session,
      vettingId,
      include: ProjectVetting.include(
        owner: UserRecord.include(
          userInfo: UserInfo.include(),
        ),
      ),
    );
    if (projectVetting != null) {
      yield projectVetting;
    }

    // Send updates when changes occur
    await for (var projectVettingUpdate in updateStream) {
      yield projectVettingUpdate.copyWith(
        owner: projectVetting!.owner,
      );
    }
  }

  /// Updates the given [projectVetting] in the database and notifies all clients
  /// subscribed to updates for this project.
  ///
  /// This method performs the following actions:
  /// - Updates the [ProjectVetting] record in the database using the provided [session].
  /// - Posts a message to all clients subscribed to the review channel for the specific project,
  ///   notifying them of the update.
  ///
  /// Parameters:
  /// [projectVetting]: The project vetting object to update.
  Future<void> updateProjectVetting(
      Session session, ProjectVetting projectVetting) async {
    // Update the project in the database
    await ProjectVetting.db.updateRow(session, projectVetting);

    // Send an update to all clients subscribed to this project
    session.messages.postMessage(
      'review_${projectVetting.id}',
      projectVetting,
    );
  }

  double _calculateNewAverage({
    required double? current,
    required int currentCount,
    required double? newValue,
  }) {
    final effectiveCurrent = current ?? 0;
    final effectiveNew = newValue ?? 0;
    return (effectiveCurrent * currentCount + effectiveNew) /
        (currentCount + 1);
  }
}
