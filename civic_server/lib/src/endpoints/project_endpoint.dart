import 'package:civic_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

class ProjectEndpoint extends Endpoint {
  Future<Project?> getProject(Session session, int id) async {
    final result = await Project.db.findById(
      session,
      id,
      include: Project.include(
        owner: UserRecord.include(
          userInfo: UserInfo.include(),
        ),
      ),
    );
    return result;
  }

  Future<ProjectReview?> getProjectReview(
    Session session,
    int projectId,
  ) async {
    final user = await authUser(
      session,
    );
    final result = await ProjectReview.db.findFirstRow(
      session,
      where: (row) =>
          row.projectId.equals(projectId) &
          row.ownerId.equals(
            user.userInfoId,
          ),
    );
    return result;
  }

  Future<Project?> saveProject(
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
            repostedBy: [],
            reviewedBy: [],
            verifiedBy: [],
            bookmarkedBy: [],
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
      return null;
    }
  }

  Future<ProjectReview?> saveProjectReview(
    Session session,
    ProjectReview projectReview,
  ) async {
    return await session.db.transaction((transaction) async {
      try {
        final user = await authUser(
          session,
        );

        Project? project = await Project.db.findById(
          session,
          projectReview.projectId,
          transaction: transaction,
        );
        if (project == null) {
          throw PostException(message: 'Project not found');
        }

        if (projectReview.id != null) {
          final existingReview = await ProjectReview.db.findById(
            session,
            projectReview.id!,
            transaction: transaction,
          );
          if (existingReview == null) {
            throw PostException(message: 'Review not found');
          }
          await validateProjectReviewOwnership(
            session,
            projectReview.id!,
            user,
          );

          if ((project.reviewedBy?.length ?? 1) > 0) {
            final count = project.reviewedBy?.length ?? 1;

            final newOverallLocation = (project.overallLocationRating ??
                    1 * count -
                        (existingReview.locationRating ?? 0) +
                        (projectReview.locationRating ?? 0)) /
                count;
            final newOverallDescription = (project.overallDescriptionRating ??
                    1 * count -
                        (existingReview.descriptionRating ?? 0) +
                        (projectReview.descriptionRating ?? 0)) /
                count;
            final newOverallDates = (project.overallDatesRating ??
                    1 * count -
                        (existingReview.datesRating ?? 0) +
                        (projectReview.datesRating ?? 0)) /
                count;
            final newOverallAttachments = (project.overallAttachmentsRating ??
                    1 * count -
                        (existingReview.attachmentsRating ?? 0) +
                        (projectReview.attachmentsRating ?? 0)) /
                count;
            final newOverallCategory = (project.overAllCategoryRating ??
                    1 * count -
                        (existingReview.categoryRating ?? 0) +
                        (projectReview.categoryRating ?? 0)) /
                count;
            final newOverallFunding = (project.overallFundingRating ??
                    1 * count -
                        (existingReview.fundingRating ?? 0) +
                        (projectReview.fundingRating ?? 0)) /
                count;

            project = project.copyWith(
              overallLocationRating: newOverallLocation,
              overallDescriptionRating: newOverallDescription,
              overallDatesRating: newOverallDates,
              overallAttachmentsRating: newOverallAttachments,
              overAllCategoryRating: newOverallCategory,
              overallFundingRating: newOverallFunding,
              reviewedBy: <int>{...project.reviewedBy ?? [], user.id!}.toList(),
            );
            await updateProject(session, project);
          }
          await updateProjectReview(session, projectReview);
          return projectReview;
        } else {
          final oldCount = project.reviewedBy?.length ?? 0;
          final newCount = oldCount + 1;

          final newOverallLocation =
              ((project.overallLocationRating ?? 0) * oldCount +
                      (projectReview.locationRating ?? 0)) /
                  newCount;
          final newOverallDescription =
              ((project.overallDescriptionRating ?? 0) * oldCount +
                      (projectReview.descriptionRating ?? 0)) /
                  newCount;
          final newOverallDates =
              ((project.overallDatesRating ?? 0) * oldCount +
                      (projectReview.datesRating ?? 0)) /
                  newCount;
          final newOverallAttachments =
              ((project.overallAttachmentsRating ?? 0) * oldCount +
                      (projectReview.attachmentsRating ?? 0)) /
                  newCount;
          final newOverallCategory =
              ((project.overAllCategoryRating ?? 0) * oldCount +
                      (projectReview.categoryRating ?? 0)) /
                  newCount;
          final newOverallFunding =
              ((project.overallFundingRating ?? 0) * oldCount +
                      (projectReview.fundingRating ?? 0)) /
                  newCount;

          project = project.copyWith(
            overallLocationRating: newOverallLocation,
            overallDescriptionRating: newOverallDescription,
            overallDatesRating: newOverallDates,
            overallAttachmentsRating: newOverallAttachments,
            overAllCategoryRating: newOverallCategory,
            overallFundingRating: newOverallFunding,
            reviewedBy: <int>{...project.reviewedBy ?? [], user.id!}.toList(),
          );

          await updateProject(session, project);
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
      } catch (e, stackTrace) {
        session.log(
          'Error in saveProject: $e',
          level: LogLevel.error,
          exception: e,
          stackTrace: stackTrace,
        );
        return null;
      }
    });
  }

  Future<void> undoRepost(
    Session session,
    int projectId,
  ) async {
    return await session.db.transaction((transaction) async {
      try {
        final user = await authUser(session);
        final repost = await ProjectRepost.db.findFirstRow(
          session,
          where: (t) =>
              t.ownerId.equals(
                user.userInfoId,
              ) &
              t.projectId.equals(
                projectId,
              ),
          transaction: transaction,
        );

        if (repost == null) {
          throw PostException(
            message: 'Repost not found',
          );
        }
        final project = await Project.db.findById(
          session,
          projectId,
          transaction: transaction,
        );

        if (project == null) {
          throw PostException(
            message: 'Project not found',
          );
        }

        await ProjectRepost.db.deleteRow(
          session,
          repost,
          transaction: transaction,
        );

        final post = await Post.db.findFirstRow(
          session,
          where: (t) => t.id.equals(
            repost.postId,
          ),
          transaction: transaction,
        );

        if (post == null) {
          throw PostException(
            message: 'Post not found',
          );
        }

        await Post.db.deleteRow(
          session,
          post,
          transaction: transaction,
        );

        project.repostedBy?.remove(user.id!);
        await updateProject(session, project);
      } catch (e, stackTrace) {
        session.log(
          'Error in undoRepost: $e',
          level: LogLevel.error,
          exception: e,
          stackTrace: stackTrace,
        );
      }
    });
  }

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

  Future<ProjectList> getProjects(
    Session session, {
    int limit = 50,
    int page = 1,
  }) async {
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
  }

  Future<ProjectReviewList> getProjectReviews(
    Session session,
    int projectId, {
    int limit = 50,
    int page = 1,
    double? rating,
    String? cardinal,
  }) async {
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
  }

  Future<void> reactToReview(
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
          throw PostException(message: 'Review not found');
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
        return null;
      }
    });
  }

  Future<void> deleteProject(
    Session session,
    int id,
  ) async {
    final user = await authUser(
      session,
    );
    await validateProjectOwnership(
      session,
      id,
      user,
    );

    final project = await Project.db.findById(session, id);

    if (project == null) {
      throw PostException(message: 'Project not found');
    }

    final newProject = project.copyWith(
      isDeleted: true,
    );

    await updateProject(session, newProject);
  }

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
      yield projectUpdate;
    }
  }

  Future<void> updateProject(Session session, Project project) async {
    // Update the project in the database
    await Project.db.updateRow(session, project);

    // Send an update to all clients subscribed to this project
    session.messages.postMessage(
      'project_${project.id}',
      project,
    );
  }

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
      yield projectReviewUpdate;
    }
  }

  Future<void> updateProjectReview(
      Session session, ProjectReview projectReview) async {
    // Update the project in the database
    await ProjectReview.db.updateRow(session, projectReview);

    // Send an update to all clients subscribed to this project
    session.messages.postMessage(
      'review_${projectReview.id}',
      projectReview,
    );
  }
}
