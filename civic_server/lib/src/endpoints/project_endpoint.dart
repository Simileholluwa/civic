import 'package:civic_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

class ProjectEndpoint extends Endpoint {
  Future<Project?> getProject(Session session, int id) async {
    final result = await Project.db.findFirstRow(
      session,
      where: (row) => row.id.equals(id),
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
          row.projectId.equals(projectId) & row.ownerId.equals(user.userInfoId),
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
        return await Project.db.updateRow(
          session,
          project.copyWith(
            updatedAt: DateTime.now(),
          ),
        );
      } else {
        return await Project.db.insertRow(
          session,
          project.copyWith(
            ownerId: user.id,
            owner: user,
            dateCreated: DateTime.now(),
            commentBy: [],
            likedBy: [],
            repostBy: [],
            numberOfReviews: 0,
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
    try {
      final user = await authUser(
        session,
      );

      Project? project =
          await Project.db.findById(session, projectReview.projectId);
      if (project == null) {
        throw PostException(message: 'Project not found');
      }

      if (projectReview.id != null) {
        final existingReview = await ProjectReview.db.findById(
          session,
          projectReview.id!,
        );
        if (existingReview == null) {
          throw Exception('Review not found');
        }
        await validateProjectReviewOwnership(
          session,
          projectReview.id!,
          user,
        );

        if (project.numberOfReviews != null &&
            (project.numberOfReviews ?? 1) > 0) {
          final count = project.numberOfReviews ?? 1;

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
          );
          await Project.db.updateRow(session, project);
        }

        return await ProjectReview.db.updateRow(
          session,
          projectReview.copyWith(
            updatedAt: DateTime.now(),
            ownerId: user.id,
          ),
        );
      } else {
        final oldCount = project.numberOfReviews ?? 0;
        final newCount = oldCount + 1;

        final newOverallLocation =
            ((project.overallLocationRating ?? 0) * oldCount +
                    (projectReview.locationRating ?? 0)) /
                newCount;
        final newOverallDescription =
            ((project.overallDescriptionRating ?? 0) * oldCount +
                    (projectReview.descriptionRating ?? 0)) /
                newCount;
        final newOverallDates = ((project.overallDatesRating ?? 0) * oldCount +
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
          numberOfReviews: newCount,
          overallLocationRating: newOverallLocation,
          overallDescriptionRating: newOverallDescription,
          overallDatesRating: newOverallDates,
          overallAttachmentsRating: newOverallAttachments,
          overAllCategoryRating: newOverallCategory,
          overallFundingRating: newOverallFunding,
        );

        await Project.db.updateRow(session, project);
        return await ProjectReview.db.insertRow(
          session,
          projectReview.copyWith(
            ownerId: user.id,
            owner: user,
            dateCreated: DateTime.now(),
            likes: 0,
            dislikes: 0,
            likedBy: [],
            dislikedBy: [],
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
    int limit = 10,
    int page = 1,
  }) async {
    if (limit <= 0 || page <= 0) {
      throw UserException(
        message: 'Invalid pagination parameters',
      );
    }

    final count = await Project.db.count(session);
    final results = await Project.db.find(
      session,
      limit: limit,
      offset: (page - 1) * limit,
      include: Project.include(
        owner: UserRecord.include(
          userInfo: UserInfo.include(),
        ),
      ),
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
    int limit = 10,
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

  Future<ProjectReviewResponse?> reactToReview(
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
          throw UserException(message: 'Review not found');
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
                ? review!.likes = (review!.likes ?? 0) + 1
                : review!.dislikes = (review!.dislikes ?? 0) + 1;
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
                ? review!.likes = (review!.likes ?? 0) - 1
                : review!.dislikes = (review!.dislikes ?? 0) - 1;
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
              review!.likes = (review!.likes ?? 0) + 1;
              review!.likedBy?.add(user.id!);
              review!.dislikedBy?.remove(user.id);
              review!.dislikes = (review!.dislikes ?? 0) - 1;
            } else {
              review!.likes = (review!.likes ?? 0) - 1;
              review!.likedBy?.remove(user.id);
              review!.dislikedBy?.add(user.id!);
              review!.dislikes = (review!.dislikes ?? 0) + 1;
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
              ? review!.likes = (review!.likes ?? 0) + 1
              : review!.dislikes = (review!.dislikes ?? 0) + 1;
          isLike
              ? review!.likedBy?.add(user.id!)
              : review!.dislikedBy?.add(user.id!);
        }

        // Update the like/dislike count on the review
        await ProjectReview.db.updateRow(
          session,
          review!,
          transaction: transaction,
        );
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
    return ProjectReviewResponse(
      likes: review!.likes ?? 0,
      dislikes: review!.dislikes ?? 0,
      isLiked: review!.likedBy!.contains(user.id!),
      isDisliked: review!.dislikedBy!.contains(user.id!),
      isDeleted: existingReaction?.isDeleted ?? newReaction?.isDeleted ?? false,
    );
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

    await Project.db.deleteRow(
      session,
      Project(
        id: id,
        ownerId: user.userInfoId,
      ),
    );
  }

  Future<void> updateCount(
    Session session,
    int projectId,
    int userId,
    String field,
    bool isAdding,
  ) async {
    final project = await Project.db.findById(
      session,
      projectId,
    );
    if (project == null) {
      throw PostException(
        message: "Project not found",
      );
    }

    final Map<String, Function()> updateField = {
      'likes': () {
        isAdding
            ? project.likedBy?.add(userId)
            : project.likedBy?.remove(userId);
      },
      'comments': () {
        isAdding
            ? project.commentBy?.add(userId)
            : project.commentBy?.remove(userId);
      },
      'repost': () {
        isAdding
            ? project.repostBy?.add(userId)
            : project.repostBy?.remove(userId);
      },
    };

    if (!updateField.containsKey(field)) {
      throw Exception(
        "Invalid field for count update",
      );
    }
    updateField[field]!();

    await Project.db.updateRow(
      session,
      project,
    );
  }

  Future<ProjectToggleLikeResponse> toggleLike(
    Session session,
    int projectId,
  ) async {
    Project? project;
    final user = await authUser(session);
    await session.db.transaction((transaction) async {
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
      await Project.db.updateRow(
        session,
        project!,
        transaction: transaction,
      );
    });
    return ProjectToggleLikeResponse(
      likedByUser: project!.likedBy?.contains(
            user.id!,
          ) ??
          false,
      likes: project!.likedBy?.length ?? 0,
    );
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
}
