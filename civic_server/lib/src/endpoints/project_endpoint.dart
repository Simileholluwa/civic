import 'dart:async';

import 'package:civic_server/src/endpoints/notification_endpoint.dart';
import 'package:civic_server/src/generated/endpoints.dart';
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
  /// Throws a [ServerSideException] if the project cannot be found, possibly due to deletion.
  ///
  /// Parameters:
  /// - [projectId]: The unique identifier of the project to retrieve.
  ///
  /// Returns the [Project] if found, otherwise throws an exception.
  Future<ProjectWithUserState> getProject(
    Session session,
    int projectId,
  ) async {
    final result = await Project.db.findById(
      session,
      projectId,
      include: Project.include(
        owner: UserRecord.include(userInfo: UserInfo.include()),
        projectMediaAssets: MediaAsset.includeList(),
      ),
    );

    if (result == null) {
      throw ServerSideException(
        message:
            'This project cannot be found. It may have been permanently deleted.',
      );
    }

    final user = await authUser(session);

    final like = await ProjectLikes.db.findFirstRow(
      session,
      where: (t) =>
          t.projectId.equals(projectId) & t.ownerId.equals(user.userInfoId),
    );
    final bookmark = await ProjectBookmarks.db.findFirstRow(
      session,
      where: (t) =>
          t.projectId.equals(projectId) & t.ownerId.equals(user.userInfoId),
    );
    final reposted = await Post.db.findFirstRow(
      session,
      where: (t) =>
          t.projectId.equals(projectId) & t.ownerId.equals(user.userInfoId),
    );
    final subscription = await ProjectSubscription.db.findFirstRow(
      session,
      where: (t) => t.projectId.equals(projectId) & t.userId.equals(user.id!),
    );
    final review = await ProjectReview.db.findFirstRow(
      session,
      where: (t) =>
          t.projectId.equals(projectId) & t.ownerId.equals(user.userInfoId),
    );
    final vetting = await ProjectVetting.db.findFirstRow(
      session,
      where: (t) =>
          t.projectId.equals(projectId) & t.ownerId.equals(user.userInfoId),
    );

    bool isFollower = false;
    final followRow = await UserFollow.db.findFirstRow(
      session,
      where: (t) =>
          t.followerId.equals(user.id!) & t.followeeId.equals(result.ownerId),
    );
    isFollower = followRow != null;

    return ProjectWithUserState(
      project: result,
      hasLiked: like != null,
      hasBookmarked: bookmark != null,
      hasReviewed: review != null,
      hasVetted: vetting != null,
      isSubscribed: subscription != null,
      hasReposted: reposted != null,
      isFollower: isFollower,
    );
  }

  /// Synchronizes media assets for a given project.
  ///
  @doNotGenerate
  Future<void> _syncMediaAssetsForProject(
    Session session, {
    required UserRecord user,
    required Project existingProject,
    required List<MediaAsset>? incoming,
    Transaction? transaction,
  }) async {
    final existing = await MediaAsset.db.find(
      session,
      where: (t) => t.projectId.equals(existingProject.id!),
      transaction: transaction,
    );
    final existingByKey = {for (final e in existing) e.objectKey: e};
    final incomingList = incoming ?? const <MediaAsset>[];
    final incomingKeys = <String>{};
    final inserts = <MediaAsset>[];
    final updates = <MediaAsset>[];

    for (final a in incomingList) {
      final key = a.objectKey;
      if (key.isEmpty || incomingKeys.contains(key)) continue;
      incomingKeys.add(key);
      final current = existingByKey[key];
      if (current == null) {
        inserts.add(
          a.copyWith(ownerId: user.id!, projectId: existingProject.id!),
        );
        continue;
      }
      final changed =
          (current.publicUrl != a.publicUrl) ||
          (current.contentType != a.contentType) ||
          (current.size != a.size) ||
          (current.width != a.width) ||
          (current.height != a.height) ||
          (current.durationMs != a.durationMs) ||
          (current.kind != a.kind);
      if (changed) {
        updates.add(
          current.copyWith(
            publicUrl: a.publicUrl,
            contentType: a.contentType,
            size: a.size,
            width: a.width,
            height: a.height,
            durationMs: a.durationMs,
            kind: a.kind,
          ),
        );
      }
    }

    final staleKeys = existingByKey.keys
        .where((k) => !incomingKeys.contains(k))
        .toSet();
    if (staleKeys.isNotEmpty) {
      await MediaAsset.db.deleteWhere(
        session,
        where: (t) =>
            t.projectId.equals(existingProject.id!) &
            t.objectKey.inSet(staleKeys),
        transaction: transaction,
      );
      for (final key in staleKeys) {
        unawaited(session.storage.deleteFile(storageId: 'public', path: key));
      }
    }

    if (updates.isNotEmpty) {
      for (final u in updates) {
        await MediaAsset.db.updateRow(session, u, transaction: transaction);
      }
    }

    if (inserts.isNotEmpty) {
      await MediaAsset.db.insert(session, inserts, transaction: transaction);
    }
  }

  /// Retrieves the [ProjectReview] for a given project and the authenticated user.
  ///
  /// Throws a [ServerSideException] if:
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
    final user = await authUser(session);
    final project = await Project.db.findById(session, projectId);

    if (project != null) {
      if (project.isDeleted!) {
        throw ServerSideException(
          message:
              'This project has been deleted by its owner. Reviews are not allowed.',
        );
      }
      if (user.userInfoId == project.ownerId) {
        throw ServerSideException(
          message:
              'Projects you create can only be reviewed by your constituents. Try sharing this project.',
          action: 'share',
        );
      }
    }

    final result = await ProjectReview.db.findFirstRow(
      session,
      where: (row) =>
          row.projectId.equals(projectId) & row.ownerId.equals(user.userInfoId),
      include: ProjectReview.include(project: Project.include()),
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
  /// Logs and throws a [ServerSideException] if an error occurs during the process.
  ///
  /// Parameters:
  /// - [project]: The project to save or update.
  ///
  /// Returns the saved or updated [Project].
  Future<Project> saveProject(Session session, Project project) async {
    return session.db.transaction((transaction) async {
      try {
        final user = await authUser(session, transaction: transaction);

        if (project.id != null) {
          await validateProjectOwnership(
            session,
            project.id!,
            user,
            transaction: transaction,
          );

          final existingProject = await Project.db.findById(
            session,
            project.id!,
            transaction: transaction,
          );

          if (existingProject == null) {
            throw ServerSideException(message: 'Project not found');
          }

          await _syncMediaAssetsForProject(
            session,
            user: user,
            existingProject: existingProject,
            incoming: project.projectMediaAssets,
            transaction: transaction,
          );

          final updatedProject = project.copyWith(
            updatedAt: DateTime.now(),
            dateCreated: existingProject.dateCreated,
            ownerId: existingProject.ownerId,
            owner: user,
            isDeleted: existingProject.isDeleted,
            overallRating: existingProject.overallRating,
            overallLocationRating: existingProject.overallLocationRating,
            overallDescriptionRating: existingProject.overallDescriptionRating,
            overallDatesRating: existingProject.overallDatesRating,
            overallAttachmentsRating: existingProject.overallAttachmentsRating,
            overAllCategoryRating: existingProject.overAllCategoryRating,
            overallFundingRating: existingProject.overallFundingRating,
            quotesCount: existingProject.quotesCount,
            likesCount: existingProject.likesCount,
            reviewsCount: existingProject.reviewsCount,
            bookmarksCount: existingProject.bookmarksCount,
            vettingsCount: existingProject.vettingsCount,
            physicalLocations: existingProject.physicalLocations,
            virtualLocations: existingProject.virtualLocations,
            projectMediaAssets: existingProject.projectMediaAssets,
          );
          await updateProject(
            session,
            updatedProject,
            transaction: transaction,
          );
          return updatedProject;
        } else {
          final insertedProject = await Project.db.insertRow(
            session,
            project.copyWith(ownerId: user.userInfoId, owner: user),
            transaction: transaction,
          );
          await MediaAsset.db.insert(
            session,
            project.projectMediaAssets!
                .map(
                  (e) => e.copyWith(
                    ownerId: user.id!,
                    projectId: insertedProject.id!,
                  ),
                )
                .toList(),
            transaction: transaction,
          );
          final insertedProjectWithRelations = await Project.db.findById(
            session,
            insertedProject.id!,
            include: Project.include(
              owner: UserRecord.include(userInfo: UserInfo.include()),
              projectMediaAssets: MediaAsset.includeList(),
            ),
            transaction: transaction,
          );
          if (insertedProjectWithRelations == null) {
            throw ServerSideException(
              message: 'Failed to retrieve inserted project',
            );
          }
          return insertedProjectWithRelations;
        }
      } catch (e, stackTrace) {
        session.log(
          'Error in saveProject: $e',
          level: LogLevel.error,
          exception: e,
          stackTrace: stackTrace,
        );
        throw ServerSideException(message: e.toString());
      }
    });
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
  /// 5. Handles and logs exceptions, rethrowing known `ServerSideException` errors.
  ///
  /// Throws a [ServerSideException] if the project or review cannot be found, or if any other error occurs.
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
          include: Project.include(owner: UserRecord.include()),
        );
        if (project == null) {
          throw ServerSideException(
            message:
                'This project cannot be found. It may have been permanently deleted.',
          );
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
            throw ServerSideException(message: 'Review not found');
          }

          await validateProjectReviewOwnership(
            session,
            projectReview.id!,
            user,
          );

          if (project.reviewsCount != 0) {
            final count = project.reviewsCount!;

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
              reviewsCount: project.reviewsCount,
              overallRating: _computeOverallFromDimensions(
                project.copyWith(
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
                ),
              ),
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
          // Also consolidate ratings into ProjectRating rows
          await _upsertRatingsFromReview(session, updatedReview);
          return updatedReview;
        } else {
          final oldCount = project.reviewsCount!;

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
            reviewsCount: oldCount + 1,
            overallRating: _computeOverallFromDimensions(
              project.copyWith(
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
              ),
            ),
          );

          await updateProject(session, updatedProject);

          final sentReview = await ProjectReview.db.insertRow(
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

          // Consolidate ratings into ProjectRating rows for reporting/analytics
          await _upsertRatingsFromReview(session, sentReview);

          if (project.ownerId != user.id) {
            unawaited(
              NotificationEndpoint().sendNotification(
                session,
                receiverId: project.ownerId,
                senderId: user.id!,
                actionType: NotificationActionType.review,
                targetType: NotificationTargetType.project,
                senderAvatarUrl: user.userInfo!.imageUrl!,
                targetId: sentReview.projectId,
                senderName: getFullName(
                  user.firstName!,
                  user.middleName,
                  user.lastName!,
                ),
                actionRoute: '/project/${project.id}',
                body: _getNotificationBody(projectReview.review ?? ''),
              ),
            );

            unawaited(
              NotificationEndpoint().notifyProjectSubscribers(
                session,
                projectId: sentReview.projectId,
                senderId: user.id!,
                actionType: NotificationActionType.review,
                targetType: NotificationTargetType.project,
                senderAvatarUrl: user.userInfo!.imageUrl!,
                targetId: sentReview.projectId,
                senderName: getFullName(
                  user.firstName!,
                  user.middleName,
                  user.lastName!,
                ),
                actionRoute: '/project/${project.id}',
                body: _getNotificationBody(projectReview.review ?? ''),
              ),
            );
          }

          return sentReview;
        }
      } on ServerSideException {
        rethrow;
      } catch (e, stackTrace) {
        session.log(
          'Error in saveProjectReview: $e',
          level: LogLevel.error,
          exception: e,
          stackTrace: stackTrace,
        );
        throw ServerSideException(message: e.toString());
      }
    });
  }

  /// Deletes a [ProjectReview] by its [reviewId] for the authenticated user.
  ///
  /// This method performs the following steps within a database transaction:
  /// 1. Authenticates the user from the [session].
  /// 2. Finds the review by [reviewId]. Throws a [ServerSideException] if not found.
  /// 3. Checks if the authenticated user is the owner of the review. Throws a [ServerSideException] if unauthorized.
  /// 4. Retrieves the associated project. Throws a [ServerSideException] if the project is not found.
  /// 5. Updates the project's overall ratings and `reviewedBy` list:
  ///    - If this is the only review, resets all ratings and clears the `reviewedBy` list.
  ///    - Otherwise, recalculates each rating by removing the deleted review's contribution and updates the `reviewedBy` list.
  /// 6. Deletes the review from the database.
  ///
  /// Throws a [ServerSideException] on any error, including database or authorization failures.
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
          throw ServerSideException(
            message:
                'This review cannot be found. It may have been permanently deleted.',
          );
        }

        if (existingReview.ownerId != user.id) {
          throw ServerSideException(
            message: 'Unauthorized to delete this review',
          );
        }

        final project = await Project.db.findById(
          session,
          existingReview.projectId,
          transaction: transaction,
        );

        if (project == null) {
          throw ServerSideException(message: 'Associated project not found');
        }

        final currentCount = project.reviewsCount!;

        if (currentCount <= 1) {
          // If only one review existed, reset ratings
          final updatedProject = project.copyWith(
            overallLocationRating: 0,
            overallDescriptionRating: 0,
            overallDatesRating: 0,
            overallAttachmentsRating: 0,
            overAllCategoryRating: null,
            overallFundingRating: 0,
            reviewsCount: 0,
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
            reviewsCount: newCount,
            overallRating: _computeOverallFromDimensions(
              project.copyWith(
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
              ),
            ),
          );

          await updateProject(session, updatedProject);
        }

        // Delete consolidated rating rows linked to this review
        await ProjectRating.db.deleteWhere(
          session,
          where: (t) => t.reviewId.equals(existingReview.id),
          transaction: transaction,
        );

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
        throw ServerSideException(message: e.toString());
      }
    });
  }

  /// Deletes a [ProjectVetting] entry by its [vettingId].
  ///
  /// This method performs the following steps within a database transaction:
  /// 1. Authenticates the current user.
  /// 2. Finds the vetting entry by [vettingId]. Throws a [ServerSideException] if not found.
  /// 3. Checks that the authenticated user is the owner of the vetting entry.
  ///    -  Throws a [ServerSideException] if unauthorized.
  /// 4. Retrieves the associated project. Throws a [ServerSideException] if not found.
  /// 5. Updates the project's `vettedBy` list to remove the user's ID.
  /// 6. Deletes the vetting entry from the database.
  ///
  /// If any error occurs during the process, logs the error and throws a [ServerSideException].
  ///
  /// Throws a [ServerSideException] for not found, unauthorized, or other errors.
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
          throw ServerSideException(
            message:
                'This vetting cannot be found. It may have been permanently deleted.',
          );
        }

        if (existingVetting.ownerId != user.id) {
          throw ServerSideException(
            message: 'Unauthorized to delete this vetting',
          );
        }

        final project = await Project.db.findById(
          session,
          existingVetting.projectId,
          transaction: transaction,
        );

        if (project == null) {
          throw ServerSideException(message: 'Associated project not found');
        }

        final updatedProject = project.copyWith(
          vettingsCount: ((project.vettingsCount ?? 0) > 0)
              ? (project.vettingsCount! - 1)
              : 0,
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
        throw ServerSideException(message: e.toString());
      }
    });
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
    await session.serverpod.futureCalls
        .callAtTime(dateTime)
        .scheduleProject
        .sendProjectInFuture(project);
  }

  /// Returns enriched feed projects including:
  /// - Base project data & owner
  /// - Up to 5 recent image attachments per project (for previews)
  /// - Current user interaction state flags: hasLiked, hasBookmarked, hasReviewed,
  ///   hasVetted, isSubscribed
  /// This is a read-only aggregation endpoint; no persistence of transient flags.
  Future<FeedProjectList> getProjects(
    Session session, {
    int limit = 50,
    int page = 1,
    String sortBy = '',
  }) async {
    if (limit <= 0 || page <= 0) {
      throw ServerSideException(message: 'Invalid pagination parameters');
    }
    final user = await authUser(session);

    // Base filtering: exclude ignored.
    final ignored = await ProjectNotInterested.db.find(
      session,
      where: (t) => t.userId.equals(user.id!),
    );
    final ignoredIds = ignored.map((e) => e.projectId).toSet();

    final count = await Project.db.count(
      session,
      where: (t) => t.id.notInSet(ignoredIds),
    );

    var projects = await Project.db.find(
      session,
      limit: limit,
      offset: (page - 1) * limit,
      include: Project.include(
        owner: UserRecord.include(userInfo: UserInfo.include()),
        projectMediaAssets: MediaAsset.includeList(),
      ),
      where: (t) => t.id.notInSet(ignoredIds) & t.isDeleted.equals(false),
    );

    // In-memory sort variants.
    if (sortBy == 'new') {
      projects.sort((a, b) => b.dateCreated!.compareTo(a.dateCreated!));
    } else if (sortBy == 'trending') {
      projects.sort((a, b) => engagementScore(b).compareTo(engagementScore(a)));
    } else if (sortBy == 'rating') {
      projects.sort(
        (a, b) => (b.overallRating ?? 0).compareTo(a.overallRating ?? 0),
      );
    }

    if (projects.isEmpty) {
      return FeedProjectList(
        count: count,
        page: page,
        numPages: (count / limit).ceil(),
        limit: limit,
        canLoadMore: page * limit < count,
        results: [],
      );
    }

    final projectIds = projects.map((p) => p.id!).toSet();

    // Bulk fetch user interactions.
    Future<Set<int>> projectIdsFor<T>(
      Future<List<T>> future,
      int Function(T) idGetter,
    ) async {
      final rows = await future;
      return rows.map(idGetter).toSet();
    }

    final likedSet = await projectIdsFor(
      ProjectLikes.db.find(
        session,
        where: (t) =>
            t.projectId.inSet(projectIds) & t.ownerId.equals(user.userInfoId),
      ),
      (r) => r.projectId,
    );

    final bookmarkedSet = await projectIdsFor(
      ProjectBookmarks.db.find(
        session,
        where: (t) =>
            t.projectId.inSet(projectIds) & t.ownerId.equals(user.userInfoId),
      ),
      (r) => r.projectId,
    );

    final reviewedSet = await projectIdsFor(
      ProjectReview.db.find(
        session,
        where: (t) =>
            t.projectId.inSet(projectIds) & t.ownerId.equals(user.userInfoId),
      ),
      (r) => r.projectId,
    );

    final vettedSet = await projectIdsFor(
      ProjectVetting.db.find(
        session,
        where: (t) =>
            t.projectId.inSet(projectIds) & t.ownerId.equals(user.userInfoId),
      ),
      (r) => r.projectId,
    );

    final subscribedSet = await projectIdsFor(
      ProjectSubscription.db.find(
        session,
        where: (t) => t.projectId.inSet(projectIds) & t.userId.equals(user.id!),
      ),
      (r) => r.projectId,
    );

    // Following relationships for project owners
    final ownerIds = projects.map((p) => p.ownerId).whereType<int>().toSet();
    final followingOwnerSet = await projectIdsFor(
      UserFollow.db.find(
        session,
        where: (t) =>
            t.followerId.equals(user.id!) & t.followeeId.inSet(ownerIds),
      ),
      (r) => r.followeeId,
    );

    // Assemble enriched DTOs.
    final feedProjects = <ProjectWithUserState>[];
    for (final p in projects) {
      feedProjects.add(
        ProjectWithUserState(
          project: p,
          hasLiked: likedSet.contains(p.id!),
          hasBookmarked: bookmarkedSet.contains(p.id!),
          hasReviewed: reviewedSet.contains(p.id!),
          hasVetted: vettedSet.contains(p.id!),
          isSubscribed: subscribedSet.contains(p.id!),
          isFollower: followingOwnerSet.contains(p.ownerId),
        ),
      );
    }

    return FeedProjectList(
      count: count,
      page: page,
      numPages: (count / limit).ceil(),
      limit: limit,
      canLoadMore: page * limit < count,
      results: feedProjects,
    );
  }

  @doNotGenerate
  double engagementScore(Project p) {
    return (p.likesCount! * 2) +
        (p.quotesCount! * 2) +
        (p.bookmarksCount! * 1) +
        (p.reviewsCount! * 3) +
        (p.vettingsCount! * 4);
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
  /// Throws a [ServerSideException] if pagination parameters are invalid or if an invalid
  /// rating category is provided.
  /// Throws a [ServerSideException] if an error occurs while fetching reviews.
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
        throw ServerSideException(message: 'Invalid pagination parameters');
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
          throw ServerSideException(message: 'Invalid cardinal parameter');
        }

        filters.add(ratingMap[cardinal]!.equals(rating));
      }

      // Construct final where clause
      whereClause(t) => filters.reduce((a, b) => a & b);

      // Get count with filters applied
      final count = await ProjectReview.db.count(session, where: whereClause);

      // Fetch results with filters
      final results = await ProjectReview.db.find(
        session,
        limit: limit,
        offset: (page - 1) * limit,
        include: ProjectReview.include(
          owner: UserRecord.include(userInfo: UserInfo.include()),
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
      throw ServerSideException(message: 'Error fetching project reviews');
    }
  }

  Future<void> clearBookmarks(Session session) async {
    return await session.db.transaction((transaction) async {
      try {
        final user = await authUser(session);
        final userBookmarks = await ProjectBookmarks.db.find(
          session,
          where: (t) => t.ownerId.equals(user.id!),
          include: ProjectBookmarks.include(project: Project.include()),
        );
        final projects = userBookmarks.map((e) => e.project!);
        for (final project in projects) {
          final newCount = ((project.bookmarksCount ?? 0) > 0)
              ? (project.bookmarksCount! - 1)
              : 0;
          project.bookmarksCount = newCount;
          await updateProject(session, project);
        }
        await ProjectBookmarks.db.deleteWhere(
          session,
          where: (t) => t.ownerId.equals(user.id!),
        );
      } catch (e, stackTrace) {
        session.log(
          'Error in clearProjectBookmarks: $e',
          level: LogLevel.error,
          exception: e,
          stackTrace: stackTrace,
        );
        throw ServerSideException(message: 'Error clearing bookmarks');
      }
    });
  }

  /// Handles user reactions (like/dislike) to a project review.
  ///
  /// This method allows an authenticated user to like or dislike a specific project review.
  /// It manages the following scenarios within a database transaction:
  /// - If the review does not exist, throws a [ServerSideException].
  /// - If the user has previously reacted and the reaction was soft-deleted, it reactivates the reaction.
  /// - If the user repeats the same reaction, it soft-deletes the reaction (removes the like/dislike).
  /// - If the user switches between like and dislike, it updates the reaction accordingly.
  /// - If the user has not reacted before, it creates a new reaction.
  /// The method also updates the `likedBy` and `dislikedBy` lists on the review and persists the changes.
  ///
  /// Throws a [ServerSideException] if the review cannot be found or if any error occurs during the process.
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
          throw ServerSideException(
            message:
                'This review cannot be found. It may have been permanently deleted.',
          );
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

          if (review!.ownerId != user.id) {
            unawaited(
              NotificationEndpoint().sendNotification(
                session,
                receiverId: review!.ownerId,
                senderId: user.id!,
                actionType: NotificationActionType.react,
                targetType: NotificationTargetType.project,
                senderAvatarUrl: user.userInfo!.imageUrl!,
                targetId: review!.projectId,
                senderName: getFullName(
                  user.firstName!,
                  user.middleName,
                  user.lastName!,
                ),
                actionRoute: '/project/${review!.projectId}',
                body: _getNotificationBody(review!.review ?? ''),
              ),
            );
          }
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
        throw ServerSideException(message: e.toString());
      }
    });
    return review!;
  }

  /// Handles user reactions (like or dislike) to a project vetting.
  ///
  /// This method allows an authenticated user to like or dislike a specific project vetting.
  /// It manages the following scenarios within a database transaction:
  /// - If the vetting does not exist, throws a [ServerSideException].
  /// - If the user has previously reacted and the reaction was soft-deleted, it reactivates the reaction.
  /// - If the user repeats the same reaction, it soft-deletes the reaction (removes the like/dislike).
  /// - If the user switches between like and dislike, it updates the reaction accordingly.
  /// - If the user has not reacted before, it creates a new reaction.
  /// The method also updates the `likedBy` and `dislikedBy` lists on the vetting and persists the changes.
  ///
  /// Throws a [ServerSideException] if any error occurs during the process.
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
          throw ServerSideException(
            message:
                'This review cannot be found. It may have been permanently deleted.',
          );
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

          if (vetting!.ownerId != user.id) {
            unawaited(
              NotificationEndpoint().sendNotification(
                session,
                receiverId: vetting!.ownerId,
                senderId: user.id!,
                actionType: NotificationActionType.react,
                targetType: NotificationTargetType.project,
                senderAvatarUrl: user.userInfo!.imageUrl!,
                targetId: vetting!.id!,
                senderName: getFullName(
                  user.firstName!,
                  user.middleName,
                  user.lastName!,
                ),
                actionRoute: '/project/${vetting!.projectId}',
                body: _getNotificationBody(vetting!.comment ?? ''),
              ),
            );
          }
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
        throw ServerSideException(message: e.toString());
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
  /// 4. If the project does not exist, throws a [ServerSideException].
  /// 5. Marks the project as deleted by setting its `isDeleted` property to `true`.
  /// 6. Updates the project in the database.
  ///
  /// Throws a [ServerSideException] if the project is not found.
  ///
  /// Parameters:
  /// [projectId] - The ID of the project to delete.
  Future<void> deleteProject(Session session, int projectId) async {
    final user = await authUser(session);
    await validateProjectOwnership(session, projectId, user);

    final project = await Project.db.findById(session, projectId);

    if (project == null) {
      throw ServerSideException(message: 'Project not found');
    }

    final newProject = project.copyWith(isDeleted: true);

    await updateProject(session, newProject);
  }

  /// Toggles the bookmark status of a project for the authenticated user.
  ///
  /// - If the user has already bookmarked the project, this method removes the bookmark.
  /// - Otherwise, it adds a new bookmark for the project.
  /// - The operation is performed within a database transaction to ensure consistency.
  /// - Updates the `bookmarkedBy` field of the project accordingly.
  ///
  /// Throws a [ServerSideException] if the project is not found.
  ///
  /// Logs any errors encountered during the process.
  ///
  /// Parameters:
  /// - [projectId]: The ID of the project to toggle the bookmark for.
  Future<void> toggleBookmark(Session session, int projectId) async {
    await session.db.transaction((transaction) async {
      try {
        final user = await authUser(session);
        final project = await Project.db.findById(
          session,
          projectId,
          transaction: transaction,
          include: Project.include(owner: UserRecord.include()),
        );
        if (project == null) {
          throw ServerSideException(message: "Project not found");
        }

        final existingBookmark = await ProjectBookmarks.db.findFirstRow(
          session,
          where: (t) =>
              t.projectId.equals(projectId) & t.ownerId.equals(user.userInfoId),
          transaction: transaction,
        );

        if (existingBookmark != null) {
          await ProjectBookmarks.db.deleteRow(
            session,
            existingBookmark,
            transaction: transaction,
          );
          project.bookmarksCount = ((project.bookmarksCount ?? 0) > 0)
              ? (project.bookmarksCount! - 1)
              : 0;
        } else {
          await ProjectBookmarks.db.insertRow(
            session,
            ProjectBookmarks(projectId: projectId, ownerId: user.id!),
            transaction: transaction,
          );
          project.bookmarksCount = (project.bookmarksCount ?? 0) + 1;
        }
        await updateProject(session, project);
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
  /// Throws a [ServerSideException] if the project is not found.
  ///
  /// Logs any errors encountered during the operation.
  ///
  /// Parameters:
  /// - [projectId]: The ID of the project to like or unlike.
  Future<void> toggleLike(Session session, int projectId) async {
    await session.db.transaction((transaction) async {
      try {
        final user = await authUser(session);
        final project = await Project.db.findById(
          session,
          projectId,
          transaction: transaction,
          include: Project.include(owner: UserRecord.include()),
        );
        if (project == null) {
          throw ServerSideException(message: "Project not found");
        }

        final existingLike = await ProjectLikes.db.findFirstRow(
          session,
          where: (t) =>
              t.projectId.equals(projectId) & t.ownerId.equals(user.userInfoId),
          transaction: transaction,
        );

        if (existingLike != null) {
          await ProjectLikes.db.deleteRow(
            session,
            existingLike,
            transaction: transaction,
          );
          project.likesCount = ((project.likesCount ?? 0) > 0)
              ? (project.likesCount! - 1)
              : 0;
        } else {
          await ProjectLikes.db.insertRow(
            session,
            ProjectLikes(
              projectId: projectId,
              ownerId: user.id!,
              dateCreated: DateTime.now(),
            ),
            transaction: transaction,
          );
          project.likesCount = (project.likesCount ?? 0) + 1;

          if (project.ownerId != user.id) {
            unawaited(
              NotificationEndpoint().sendNotification(
                session,
                receiverId: project.ownerId,
                senderId: user.id!,
                actionType: NotificationActionType.like,
                targetType: NotificationTargetType.project,
                senderAvatarUrl: user.userInfo!.imageUrl!,
                targetId: project.id!,
                senderName: getFullName(
                  user.firstName!,
                  user.middleName,
                  user.lastName!,
                ),
                actionRoute: '/project/${project.id!}',
                body: _getNotificationBody(project.title ?? ''),
              ),
            );
            unawaited(
              NotificationEndpoint().notifyProjectSubscribers(
                session,
                projectId: project.id!,
                senderId: user.id!,
                actionType: NotificationActionType.like,
                targetType: NotificationTargetType.project,
                senderAvatarUrl: user.userInfo!.imageUrl!,
                targetId: project.id!,
                senderName: getFullName(
                  user.firstName!,
                  user.middleName,
                  user.lastName!,
                ),
                actionRoute: '/project/${project.id}',
                body: _getNotificationBody(project.title ?? ''),
              ),
            );
          }
        }
        await updateProject(session, project);
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
  Future<void> markNotInterested(Session session, int projectId) async {
    try {
      final user = await authUser(session);
      final entry = ProjectNotInterested(
        userId: user.id!,
        projectId: projectId,
      );

      await ProjectNotInterested.db.insertRow(session, entry);
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
  ///   - Throws a [ServerSideException] if the project cannot be found.
  /// - Checks if the user has already vetted the project.
  ///   - If an existing vetting record is found, updates its `updatedAt` timestamp and returns the updated record.
  ///   - If no vetting record exists, adds the user's ID to the project's `vettedBy` list,
  ///     creates a new vetting record with empty `likedBy` and `dislikedBy` lists, and returns it.
  /// - Logs and rethrows any [ServerSideException], or wraps other exceptions in a [ServerSideException].
  ///
  /// Throws a [ServerSideException] if the project does not exist or if an unexpected error occurs.
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
          include: Project.include(owner: UserRecord.include()),
        );
        if (project == null) {
          throw ServerSideException(
            message:
                'This project cannot be found. It may have been permanently deleted.',
          );
        }
        final existingVet = await ProjectVetting.db.findFirstRow(
          session,
          where: (t) =>
              t.projectId.equals(projectVetting.projectId) &
              t.ownerId.equals(user.id),
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
            vettingsCount: (project.vettingsCount ?? 0) + 1,
          );
          await updateProject(session, newProject);
          final newVetting = await ProjectVetting.db.insertRow(
            session,
            projectVetting.copyWith(likedBy: [], dislikedBy: []),
            transaction: transaction,
          );

          if (project.ownerId != user.id) {
            unawaited(
              NotificationEndpoint().sendNotification(
                session,
                receiverId: project.ownerId,
                senderId: user.id!,
                actionType: NotificationActionType.vet,
                targetType: NotificationTargetType.project,
                senderAvatarUrl: user.userInfo!.imageUrl!,
                targetId: project.id!,
                senderName: getFullName(
                  user.firstName!,
                  user.middleName,
                  user.lastName!,
                ),
                actionRoute: '/project/${project.id!}',
                body: _getNotificationBody(newVetting.comment ?? ''),
              ),
            );

            unawaited(
              NotificationEndpoint().notifyProjectSubscribers(
                session,
                projectId: project.id!,
                senderId: user.id!,
                actionType: NotificationActionType.vet,
                targetType: NotificationTargetType.project,
                senderAvatarUrl: user.userInfo!.imageUrl!,
                targetId: project.id!,
                senderName: getFullName(
                  user.firstName!,
                  user.middleName,
                  user.lastName!,
                ),
                actionRoute: '/project/${project.id}',
                body: _getNotificationBody(newVetting.comment ?? ''),
              ),
            );
          }
          return newVetting;
        }
      } on ServerSideException {
        rethrow;
      } catch (e, stackTrace) {
        session.log(
          'Error in vetProject: $e',
          level: LogLevel.error,
          exception: e,
          stackTrace: stackTrace,
        );
        throw ServerSideException(message: e.toString());
      }
    });
  }

  /// Retrieves the vetted project for the authenticated user and specified project ID.
  ///
  /// This method first authenticates the user from the provided [session], then attempts to find
  /// the project with the given [projectId]. If the project does not exist, a [ServerSideException] is thrown.
  /// If the project exists, it searches for a [ProjectVetting] record associated with both the project
  /// and the authenticated user. The related [Project] is also included in the result.
  ///
  /// Returns a [ProjectVetting] instance if found, or `null` if no matching record exists.
  ///
  /// Throws a [ServerSideException] if the project does not exist.
  ///
  /// Parameters:
  /// - [projectId]: The ID of the project to retrieve.
  Future<ProjectVetting?> getVettedProject(
    Session session,
    int projectId,
  ) async {
    final user = await authUser(session);

    final project = await Project.db.findById(session, projectId);

    if (project == null) {
      throw ServerSideException(
        message:
            'This project does not exist. It may have been permanently deleted.',
      );
    }

    final result = await ProjectVetting.db.findFirstRow(
      session,
      where: (row) =>
          row.projectId.equals(projectId) & row.ownerId.equals(user.userInfoId),
      include: ProjectVetting.include(project: Project.include()),
    );
    return result;
  }

  /// Retrieves a paginated list of vetted projects.
  ///
  /// Throws a [ServerSideException] if the provided [limit] or [page] parameters are invalid (less than or equal to zero).
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
      throw ServerSideException(message: 'Invalid pagination parameters');
    }

    final count = await ProjectVetting.db.count(session);
    final results = await ProjectVetting.db.find(
      session,
      limit: limit,
      offset: (page - 1) * limit,
      include: ProjectVetting.include(
        owner: UserRecord.include(userInfo: UserInfo.include()),
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

  Future<FeedProjectList> getUserProjectBookmarks(
    Session session, {
    int limit = 50,
    int page = 1,
  }) async {
    return await session.db.transaction((transaction) async {
      try {
        final user = await authUser(session);
        final count = await ProjectBookmarks.db.count(
          session,
          where: (t) => t.ownerId.equals(user.id!) & t.project.isDeleted.equals(false),
        );
        final bookmarks = await ProjectBookmarks.db.find(
          session,
          where: (t) => t.ownerId.equals(user.id!) & t.project.isDeleted.equals(false),
          limit: limit,
          offset: (page - 1) * limit,
          include: ProjectBookmarks.include(
            project: Project.include(
              owner: UserRecord.include(userInfo: UserInfo.include()),
              projectMediaAssets: MediaAsset.includeList(),
            ),
          ),
          orderBy: (t) => t.dateCreated,
          orderDescending: true,
        );
        final results = bookmarks.map((bookmark) => bookmark.project!).toList();

        // Build user-state flags similar to getProjects
        if (results.isEmpty) {
          return FeedProjectList(
            count: count,
            page: page,
            numPages: (count / limit).ceil(),
            limit: limit,
            canLoadMore: page * limit < count,
            results: [],
          );
        }

        final projectIds = results.map((p) => p.id!).toSet();

        Future<Set<int>> asIdSet<T>(
          Future<List<T>> fut,
          int Function(T) id,
        ) async {
          final rows = await fut;
          return rows.map(id).toSet();
        }

        final likedSet = await asIdSet(
          ProjectLikes.db.find(
            session,
            where: (t) =>
                t.projectId.inSet(projectIds) &
                t.ownerId.equals(user.userInfoId),
          ),
          (r) => r.projectId,
        );

        final bookmarkedSet = await asIdSet(
          ProjectBookmarks.db.find(
            session,
            where: (t) =>
                t.projectId.inSet(projectIds) &
                t.ownerId.equals(user.userInfoId),
          ),
          (r) => r.projectId,
        );

        final reviewedSet = await asIdSet(
          ProjectReview.db.find(
            session,
            where: (t) =>
                t.projectId.inSet(projectIds) &
                t.ownerId.equals(user.userInfoId),
          ),
          (r) => r.projectId,
        );

        final vettedSet = await asIdSet(
          ProjectVetting.db.find(
            session,
            where: (t) =>
                t.projectId.inSet(projectIds) &
                t.ownerId.equals(user.userInfoId),
          ),
          (r) => r.projectId,
        );

        final subscribedSet = await asIdSet(
          ProjectSubscription.db.find(
            session,
            where: (t) =>
                t.projectId.inSet(projectIds) & t.userId.equals(user.id!),
          ),
          (r) => r.projectId,
        );

        // Following relationships for project owners
        final ownerIds = results.map((p) => p.ownerId).whereType<int>().toSet();
        final followingOwnerSet = await asIdSet(
          UserFollow.db.find(
            session,
            where: (t) =>
                t.followerId.equals(user.id!) & t.followeeId.inSet(ownerIds),
          ),
          (r) => r.followeeId,
        );

        final enriched = results
            .map(
              (p) => ProjectWithUserState(
                project: p,
                hasLiked: likedSet.contains(p.id!),
                hasBookmarked: bookmarkedSet.contains(p.id!),
                hasReviewed: reviewedSet.contains(p.id!),
                hasVetted: vettedSet.contains(p.id!),
                isSubscribed: subscribedSet.contains(p.id!),
                isFollower: followingOwnerSet.contains(p.ownerId),
              ),
            )
            .toList();

        return FeedProjectList(
          results: enriched,
          count: count,
          page: page,
          numPages: (count / limit).ceil(),
          limit: limit,
          canLoadMore: page * limit < count,
        );
      } catch (e, stackTrace) {
        session.log(
          'Error in getUserProjectBookmarks: $e',
          level: LogLevel.error,
          exception: e,
          stackTrace: stackTrace,
        );
        throw ServerSideException(message: e.toString());
      }
    });
  }

  /// Authenticates the current user based on the provided [session].
  ///
  /// Retrieves authentication information from the [session]. If the user is not
  /// authenticated, a [ServerSideException] is thrown with an appropriate message.
  /// If authenticated, attempts to find the corresponding [UserRecord] in the database,
  /// including related [UserInfo]. If the user record is not found, another [ServerSideException]
  /// is thrown. Otherwise, returns the authenticated [UserRecord].
  ///
  /// Throws:
  ///   - [ServerSideException] if the user is not logged in or the user record is not found.
  ///
  /// Returns:
  ///   - The authenticated [UserRecord] with included [UserInfo].
  @doNotGenerate
  Future<UserRecord> authUser(
    Session session, {
    Transaction? transaction,
  }) async {
    final authInfo = session.authenticated;
    if (authInfo == null) {
      throw ServerSideException(message: 'You must be logged in');
    }

    // Fetch the user record from the local database
    var cacheKey = 'UserData-${authInfo.userId}';
    var userRecord = await session.caches.localPrio.get<UserRecord>(cacheKey);

    if (userRecord == null) {
      userRecord = await UserRecord.db.findFirstRow(
        session,
        where: (row) => row.userInfoId.equals(authInfo.userId),
        include: UserRecord.include(userInfo: UserInfo.include()),
      );
      if (userRecord != null) {
        await session.caches.localPrio.put(
          cacheKey,
          userRecord,
          lifetime: Duration(days: 1),
        );
        return userRecord;
      }
    }
    if (userRecord == null) {
      throw ServerSideException(message: 'User not found');
    }
    return userRecord;
  }

  /// Validates that the given [user] is the owner of the project with the specified [projectId].
  ///
  /// Throws a [ServerSideException] if the project does not exist or if the user is not the owner.
  ///
  /// Parameters:
  /// [projectId] - The ID of the project to validate ownership for.
  /// [user] - The user attempting the operation.
  @doNotGenerate
  Future<void> validateProjectOwnership(
    Session session,
    int projectId,
    UserRecord user, {
    Transaction? transaction,
  }) async {
    final project = await Project.db.findFirstRow(
      session,
      where: (t) => t.id.equals(projectId) & t.ownerId.equals(user.userInfoId),
      transaction: transaction,
    );
    if (project == null) {
      throw ServerSideException(message: 'Project not found');
    }
    if (project.ownerId != user.userInfoId) {
      throw ServerSideException(message: 'Unauthorised operation');
    }
  }

  /// Validates that the given [user] is the owner of the project review with the specified [projectReviewId].
  ///
  /// Throws a [ServerSideException] if the project review is not found or if the user is not the owner.
  ///
  /// Parameters:
  /// [projectReviewId] - The ID of the project review to validate.
  /// [user] - The user attempting the operation.
  @doNotGenerate
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
      throw ServerSideException(message: 'Project review not found');
    }
    if (projectReview.ownerId != user.userInfoId) {
      throw ServerSideException(message: 'Unauthorised operation');
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
  Stream<ProjectCounts> projectCountUpdates(
    Session session,
    int projectId,
  ) async* {
    // Create a message stream for this project
    var updateStream = session.messages.createStream<ProjectCounts>(
      'project_counts_$projectId',
    );

    // Yield the latest project details when the client subscribes
    var project = await Project.db.findById(session, projectId);
    if (project != null) yield _buildProjectCounts(project);

    // Send updates when changes occur
    await for (final counts in updateStream) {
      yield counts;
    }
  }

  Future<void> subscribeToProject(Session session, int projectId) async {
    return await session.db.transaction((transaction) async {
      // Authenticate the user
      final user = await authUser(session);

      final project = await Project.db.findById(session, projectId);

      if (project == null) {
        throw ServerSideException(message: 'Project not found');
      }

      final exists = await ProjectSubscription.db.findFirstRow(
        session,
        where: (t) => t.userId.equals(user.id!) & t.projectId.equals(projectId),
      );

      if (exists != null) {
        await ProjectSubscription.db.deleteWhere(
          session,
          where: (t) =>
              t.userId.equals(user.id!) & t.projectId.equals(projectId),
        );
        // No project field to update for subscribers; state is stored in ProjectSubscription.
        return;
      }

      await ProjectSubscription.db.insertRow(
        session,
        ProjectSubscription(
          userId: user.id!,
          projectId: projectId,
          createdAt: DateTime.now(),
        ),
      );

      // No project field to update for subscribers; state is stored in ProjectSubscription.
    });
  }

  /// Computes an overall composite rating from the per-dimension averages.
  /// Simple mean of present (non-null) dimension values. You can later adjust
  /// to a weighted formula if product requirements change.
  @doNotGenerate
  double? _computeOverallFromDimensions(Project p) {
    final parts = [
      p.overallLocationRating,
      p.overallDescriptionRating,
      p.overallDatesRating,
      p.overallAttachmentsRating,
      p.overAllCategoryRating,
      p.overallFundingRating,
    ].whereType<double>().toList();
    if (parts.isEmpty) return p.overallRating; // preserve existing if none
    return parts.reduce((a, b) => a + b) / parts.length;
  }

  /// Upserts consolidated ProjectRating rows for each rating dimension found on the review.
  @doNotGenerate
  Future<void> _upsertRatingsFromReview(
    Session session,
    ProjectReview review,
  ) async {
    // helper to upsert one rating row
    Future<void> upsert({
      required RatingDimension dimension,
      required double? value,
    }) async {
      if (value == null) return;
      // Try existing row for (projectId, ownerId, dimension)
      final existing = await ProjectRating.db.findFirstRow(
        session,
        where: (t) =>
            t.projectId.equals(review.projectId) &
            t.ownerId.equals(review.ownerId) &
            t.dimension.equals(dimension),
      );
      if (existing != null) {
        await ProjectRating.db.updateRow(
          session,
          existing.copyWith(
            value: value,
            reviewId: review.id ?? existing.reviewId,
            updatedAt: DateTime.now(),
            isDeleted: false,
          ),
        );
      } else {
        await ProjectRating.db.insertRow(
          session,
          ProjectRating(
            projectId: review.projectId,
            ownerId: review.ownerId,
            reviewId: review.id!,
            dimension: dimension,
            value: value,
            dateCreated: DateTime.now(),
            isDeleted: false,
          ),
        );
      }
    }

    await upsert(
      dimension: RatingDimension.location,
      value: review.locationRating,
    );
    await upsert(
      dimension: RatingDimension.description,
      value: review.descriptionRating,
    );
    await upsert(dimension: RatingDimension.dates, value: review.datesRating);
    await upsert(
      dimension: RatingDimension.attachments,
      value: review.attachmentsRating,
    );
    await upsert(
      dimension: RatingDimension.category,
      value: review.categoryRating,
    );
    await upsert(
      dimension: RatingDimension.funding,
      value: review.fundingRating,
    );
    await upsert(
      dimension: RatingDimension.overall,
      value: review.overallRating,
    );
  }

  /// Updates the given [project] in the database and notifies all clients
  /// subscribed to this project by sending an update message.
  ///
  /// Parameters:
  /// - [project]: The project instance to be updated.
  ///
  /// This method first updates the project in the database, then posts a message
  /// to all clients subscribed to the project's channel to notify them of the update.
  @doNotGenerate
  Future<void> updateProject(
    Session session,
    Project project, {
    Transaction? transaction,
  }) async {
    // Update the project in the database
    await Project.db.updateRow(session, project, transaction: transaction);

    // Send an update to all clients subscribed to this project
    session.messages.postMessage(
      'project_counts_${project.id}',
      _buildProjectCounts(project),
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
    var updateStream = session.messages.createStream<ProjectReview>(
      'review_$reviewId',
    );

    // Yield the latest project details when the client subscribes
    var projectReview = await ProjectReview.db.findById(
      session,
      reviewId,
      include: ProjectReview.include(
        owner: UserRecord.include(userInfo: UserInfo.include()),
      ),
    );
    if (projectReview != null) {
      yield projectReview;
    }

    // Send updates when changes occur
    await for (var projectReviewUpdate in updateStream) {
      yield projectReviewUpdate.copyWith(owner: projectReview!.owner);
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
  ///
  @doNotGenerate
  Future<void> updateProjectReview(
    Session session,
    ProjectReview projectReview,
  ) async {
    await ProjectReview.db.updateRow(session, projectReview);

    // Send an update to all clients subscribed to this project
    session.messages.postMessage('review_${projectReview.id}', projectReview);
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
    var updateStream = session.messages.createStream<ProjectVetting>(
      'review_$vettingId',
    );

    // Yield the latest project details when the client subscribes
    var projectVetting = await ProjectVetting.db.findById(
      session,
      vettingId,
      include: ProjectVetting.include(
        owner: UserRecord.include(userInfo: UserInfo.include()),
      ),
    );
    if (projectVetting != null) {
      yield projectVetting;
    }

    // Send updates when changes occur
    await for (var projectVettingUpdate in updateStream) {
      yield projectVettingUpdate.copyWith(owner: projectVetting!.owner);
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
  @doNotGenerate
  Future<void> updateProjectVetting(
    Session session,
    ProjectVetting projectVetting,
  ) async {
    // Update the project in the database
    await ProjectVetting.db.updateRow(session, projectVetting);

    // Send an update to all clients subscribed to this project
    session.messages.postMessage('review_${projectVetting.id}', projectVetting);
  }

  @doNotGenerate
  String getFullName(String firstName, String? middleName, String lastName) {
    if (middleName == null || middleName.trim().isEmpty) {
      return '$firstName $lastName';
    }
    return '$firstName $middleName $lastName';
  }

  @doNotGenerate
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

  @doNotGenerate
  String? _getNotificationBody(String text) {
    if (text.isEmpty) return null;
    if (text.length > 150) {
      return '${text.substring(0, 150)}...';
    }
    return text;
  }

  /// Builds `PostCounts` from a `Post` row.
  @doNotGenerate
  ProjectCounts _buildProjectCounts(Project project) {
    return ProjectCounts(
      projectId: project.id!,
      likesCount: project.likesCount ?? 0,
      quotesCount: project.quotesCount ?? 0,
      bookmarksCount: project.bookmarksCount ?? 0,
      reviewsCount: project.reviewsCount ?? 0,
      vettingsCount: project.vettingsCount ?? 0,
      impressionsCount: project.impressionsCount ?? 0,
      lastImpressionAt: project.lastImpressionAt,
    );
  }
}
