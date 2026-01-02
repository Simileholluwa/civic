/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:civic_client/src/protocol/general/aws_places.dart' as _i3;
import 'package:civic_client/src/protocol/media/media_asset.dart' as _i4;
import 'package:civic_client/src/protocol/notification/notification_list.dart'
    as _i5;
import 'package:civic_client/src/protocol/notification/notification_target_type.dart'
    as _i6;
import 'package:civic_client/src/protocol/notification/notifications_settings.dart'
    as _i7;
import 'package:civic_client/src/protocol/notification/notification.dart'
    as _i8;
import 'package:civic_client/src/protocol/post/post.dart' as _i9;
import 'package:civic_client/src/protocol/post/post_list.dart' as _i10;
import 'package:civic_client/src/protocol/post/post_with_user_state.dart'
    as _i11;
import 'package:civic_client/src/protocol/post/post_counts.dart' as _i12;
import 'package:civic_client/src/protocol/poll/poll_counts.dart' as _i13;
import 'package:civic_client/src/protocol/project/project_with_user_state.dart'
    as _i14;
import 'package:civic_client/src/protocol/project/project_review.dart' as _i15;
import 'package:civic_client/src/protocol/project/project.dart' as _i16;
import 'package:civic_client/src/protocol/project/feed_project_list.dart'
    as _i17;
import 'package:civic_client/src/protocol/project/project_review_list.dart'
    as _i18;
import 'package:civic_client/src/protocol/project/project_vetting.dart' as _i19;
import 'package:civic_client/src/protocol/project/project_vet_list.dart'
    as _i20;
import 'package:civic_client/src/protocol/user/user_record.dart' as _i21;
import 'package:civic_client/src/protocol/user/users_list.dart' as _i22;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i23;
import 'protocol.dart' as _i24;

/// {@category Endpoint}
class EndpointAssets extends _i1.EndpointRef {
  EndpointAssets(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'assets';

  _i2.Future<String?> getUploadDescription(String path) =>
      caller.callServerEndpoint<String?>(
        'assets',
        'getUploadDescription',
        {'path': path},
      );

  _i2.Future<bool> verifyUpload(String path) => caller.callServerEndpoint<bool>(
    'assets',
    'verifyUpload',
    {'path': path},
  );
}

/// {@category Endpoint}
class EndpointHashtag extends _i1.EndpointRef {
  EndpointHashtag(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'hashtag';

  _i2.Future<void> sendPostHashtags(
    List<String> tags,
    int postId,
  ) => caller.callServerEndpoint<void>(
    'hashtag',
    'sendPostHashtags',
    {
      'tags': tags,
      'postId': postId,
    },
  );

  _i2.Future<List<String>> fetchHashtags({
    required String query,
    required int limit,
  }) => caller.callServerEndpoint<List<String>>(
    'hashtag',
    'fetchHashtags',
    {
      'query': query,
      'limit': limit,
    },
  );
}

/// {@category Endpoint}
class EndpointLocation extends _i1.EndpointRef {
  EndpointLocation(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'location';

  _i2.Future<List<_i3.AWSPlaces>> searchLocation(String query) =>
      caller.callServerEndpoint<List<_i3.AWSPlaces>>(
        'location',
        'searchLocation',
        {'query': query},
      );

  _i2.Future<List<_i3.AWSPlaces>> searchNearbyLocation(List<double> position) =>
      caller.callServerEndpoint<List<_i3.AWSPlaces>>(
        'location',
        'searchNearbyLocation',
        {'position': position},
      );
}

/// {@category Endpoint}
class EndpointMedia extends _i1.EndpointRef {
  EndpointMedia(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'media';

  _i2.Future<Map<String, String?>> requestUploadTarget({
    required String kind,
    required String ext,
    int? postId,
  }) => caller.callServerEndpoint<Map<String, String?>>(
    'media',
    'requestUploadTarget',
    {
      'kind': kind,
      'ext': ext,
      'postId': postId,
    },
  );

  _i2.Future<String> confirmUpload({
    required String path,
    required String kind,
  }) => caller.callServerEndpoint<String>(
    'media',
    'confirmUpload',
    {
      'path': path,
      'kind': kind,
    },
  );

  _i2.Future<bool> deleteAsset(int assetId) => caller.callServerEndpoint<bool>(
    'media',
    'deleteAsset',
    {'assetId': assetId},
  );

  _i2.Future<int> deleteAssetsByPost(int postId) =>
      caller.callServerEndpoint<int>(
        'media',
        'deleteAssetsByPost',
        {'postId': postId},
      );

  _i2.Future<int> cleanupTemp() => caller.callServerEndpoint<int>(
    'media',
    'cleanupTemp',
    {},
  );

  _i2.Future<void> scheduleCleanup({required int hours}) =>
      caller.callServerEndpoint<void>(
        'media',
        'scheduleCleanup',
        {'hours': hours},
      );

  _i2.Future<List<_i4.MediaAsset>> listAssets(
    int postId, {
    String? kind,
  }) => caller.callServerEndpoint<List<_i4.MediaAsset>>(
    'media',
    'listAssets',
    {
      'postId': postId,
      'kind': kind,
    },
  );
}

/// {@category Endpoint}
class EndpointNotification extends _i1.EndpointRef {
  EndpointNotification(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'notification';

  _i2.Future<void> markAllNotificationsAsRead() =>
      caller.callServerEndpoint<void>(
        'notification',
        'markAllNotificationsAsRead',
        {},
      );

  _i2.Future<void> markNotificationAsRead(int notificationId) =>
      caller.callServerEndpoint<void>(
        'notification',
        'markNotificationAsRead',
        {'notificationId': notificationId},
      );

  _i2.Future<void> deleteNotification(int notificationId) =>
      caller.callServerEndpoint<void>(
        'notification',
        'deleteNotification',
        {'notificationId': notificationId},
      );

  _i2.Future<void> deleteAllNotifications() => caller.callServerEndpoint<void>(
    'notification',
    'deleteAllNotifications',
    {},
  );

  _i2.Future<int> getUnreadNotificationCount() =>
      caller.callServerEndpoint<int>(
        'notification',
        'getUnreadNotificationCount',
        {},
      );

  _i2.Future<_i5.NotificationList> getNotifications({
    required int limit,
    required int page,
    _i6.NotificationTargetType? targetType,
    bool? isRead,
  }) => caller.callServerEndpoint<_i5.NotificationList>(
    'notification',
    'getNotifications',
    {
      'limit': limit,
      'page': page,
      'targetType': targetType,
      'isRead': isRead,
    },
  );

  _i2.Future<_i7.UserNotificationSettings> getNotificationSettings() =>
      caller.callServerEndpoint<_i7.UserNotificationSettings>(
        'notification',
        'getNotificationSettings',
        {},
      );

  _i2.Future<_i7.UserNotificationSettings> updateNotificationSettings(
    _i7.UserNotificationSettings settings,
  ) => caller.callServerEndpoint<_i7.UserNotificationSettings>(
    'notification',
    'updateNotificationSettings',
    {'settings': settings},
  );

  _i2.Stream<_i8.AppNotification> newNotificationUpdates(int userId) =>
      caller.callStreamingServerEndpoint<
        _i2.Stream<_i8.AppNotification>,
        _i8.AppNotification
      >(
        'notification',
        'newNotificationUpdates',
        {'userId': userId},
        {},
      );
}

/// Endpoint for managing posts, articles, polls, comments, and related
/// engagement. Also handles synchronization of associated media assets and
/// emits real-time count updates via Serverpod message streams.
/// {@category Endpoint}
class EndpointPost extends _i1.EndpointRef {
  EndpointPost(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'post';

  /// Creates or updates a regular post.
  ///
  /// On update, media assets are synchronized and hashtags recorded.
  /// Returns the enriched `Post` including owner and media assets.
  _i2.Future<_i9.Post?> savePost(_i9.Post post) =>
      caller.callServerEndpoint<_i9.Post?>(
        'post',
        'savePost',
        {'post': post},
      );

  /// Reposts an existing post, toggling if already reposted.
  ///
  /// Updates repost counts, inserts engagement events and notifications.
  _i2.Future<_i9.Post?> repostPost(int postId) =>
      caller.callServerEndpoint<_i9.Post?>(
        'post',
        'repostPost',
        {'postId': postId},
      );

  /// Creates a quote post referencing another post.
  ///
  /// Increments repost count on the root post, logs engagement, and
  /// dispatches relevant notifications.
  _i2.Future<_i9.Post?> quotePost(
    int postId,
    _i9.Post quoteContent,
  ) => caller.callServerEndpoint<_i9.Post?>(
    'post',
    'quotePost',
    {
      'postId': postId,
      'quoteContent': quoteContent,
    },
  );

  /// Logs batch post impressions for the authenticated viewer.
  ///
  /// Each impression is bucketed by hour and increments a post's
  /// impression counters.
  _i2.Future<void> logPostImpressions(
    List<int> postIds,
    String? viewport,
    String? source,
  ) => caller.callServerEndpoint<void>(
    'post',
    'logPostImpressions',
    {
      'postIds': postIds,
      'viewport': viewport,
      'source': source,
    },
  );

  /// Creates or updates a poll post and its options.
  ///
  /// On create, inserts poll/options and associates them with the post.
  /// Returns the updated or newly created `Post` with poll included.
  _i2.Future<_i9.Post?> savePoll(_i9.Post post) =>
      caller.callServerEndpoint<_i9.Post?>(
        'post',
        'savePoll',
        {'post': post},
      );

  /// Creates or updates an article post and synchronizes its media.
  ///
  /// On update, preserves post metadata linkage, updates the article row,
  /// and returns the enriched `Post` with `Article` and assets.
  _i2.Future<_i9.Post> saveArticle(_i9.Post post) =>
      caller.callServerEndpoint<_i9.Post>(
        'post',
        'saveArticle',
        {'post': post},
      );

  /// Casts or changes a vote on a poll option and updates counts.
  ///
  /// Emits engagement events and sends notifications if applicable.
  _i2.Future<void> castVote(
    int postId,
    int optionId,
  ) => caller.callServerEndpoint<void>(
    'post',
    'castVote',
    {
      'postId': postId,
      'optionId': optionId,
    },
  );

  /// Clears the authenticated user's vote in a given poll.
  ///
  /// Updates option and poll counts accordingly.
  _i2.Future<void> clearVote(int pollId) => caller.callServerEndpoint<void>(
    'post',
    'clearVote',
    {'pollId': pollId},
  );

  /// Creates or updates a comment or reply on a post.
  ///
  /// On update, synchronizes media assets; on create, inserts media and
  /// dispatches notifications and engagement events.
  _i2.Future<_i9.Post?> savePostComment(
    _i9.Post comment,
    bool isReply,
  ) => caller.callServerEndpoint<_i9.Post?>(
    'post',
    'savePostComment',
    {
      'comment': comment,
      'isReply': isReply,
    },
  );

  /// Returns paginated comments for a post, excluding ignored posts.
  ///
  /// Includes owner info and media assets for each comment.
  _i2.Future<_i10.PostList> getPostComments(
    int postId, {
    required int limit,
    required int page,
  }) => caller.callServerEndpoint<_i10.PostList>(
    'post',
    'getPostComments',
    {
      'postId': postId,
      'limit': limit,
      'page': page,
    },
  );

  /// Returns a single comment or reply enriched with user state.
  /// Throws if the target does not exist.
  _i2.Future<_i11.PostWithUserState> getComment(
    int commentId,
    bool isComment,
  ) => caller.callServerEndpoint<_i11.PostWithUserState>(
    'post',
    'getComment',
    {
      'commentId': commentId,
      'isComment': isComment,
    },
  );

  /// Returns paginated replies for a specific comment.
  ///
  /// Includes owner info and media assets for each reply.
  _i2.Future<_i10.PostList> getPostCommentReplies(
    int commentId, {
    required int limit,
    required int page,
  }) => caller.callServerEndpoint<_i10.PostList>(
    'post',
    'getPostCommentReplies',
    {
      'commentId': commentId,
      'limit': limit,
      'page': page,
    },
  );

  /// Schedules a post to be sent at a future time using Serverpod.
  _i2.Future<void> schedulePost(
    _i9.Post post,
    DateTime dateTime,
  ) => caller.callServerEndpoint<void>(
    'post',
    'schedulePost',
    {
      'post': post,
      'dateTime': dateTime,
    },
  );

  /// Traverses the parent chain to return the root post for a thread.
  _i2.Future<_i9.Post> getRootPost(_i9.Post post) =>
      caller.callServerEndpoint<_i9.Post>(
        'post',
        'getRootPost',
        {'post': post},
      );

  /// Creates a quote post referencing a project and updates project counts.
  _i2.Future<_i9.Post> quoteProject(
    int projectId,
    _i9.Post quoteContent,
  ) => caller.callServerEndpoint<_i9.Post>(
    'post',
    'quoteProject',
    {
      'projectId': projectId,
      'quoteContent': quoteContent,
    },
  );

  /// Returns an enriched post by id, including owner, media, and related data.
  _i2.Future<_i11.PostWithUserState> getPost(int id) =>
      caller.callServerEndpoint<_i11.PostWithUserState>(
        'post',
        'getPost',
        {'id': id},
      );

  /// Returns ranked, paginated feed posts for the authenticated user.
  ///
  /// Supports content-type filtering and logs impressions opportunistically.
  _i2.Future<_i10.PostList> getPosts({
    required int limit,
    required int page,
    String? contentType,
  }) => caller.callServerEndpoint<_i10.PostList>(
    'post',
    'getPosts',
    {
      'limit': limit,
      'page': page,
      'contentType': contentType,
    },
  );

  /// Deletes or soft-deletes a post, updating related counts when needed.
  _i2.Future<void> deletePost(
    int id, {
    required bool fullDelete,
  }) => caller.callServerEndpoint<void>(
    'post',
    'deletePost',
    {
      'id': id,
      'fullDelete': fullDelete,
    },
  );

  /// Clears all bookmarks for the authenticated user and updates counts.
  _i2.Future<void> clearBookmarks() => caller.callServerEndpoint<void>(
    'post',
    'clearBookmarks',
    {},
  );

  /// Toggles bookmark state on a post for the authenticated user.
  ///
  /// Updates counts and logs a corresponding engagement event.
  _i2.Future<void> toggleBookmark(int postId) =>
      caller.callServerEndpoint<void>(
        'post',
        'toggleBookmark',
        {'postId': postId},
      );

  /// Toggles like state on a post for the authenticated user.
  ///
  /// Sends notifications to the post owner and subscribers on like.
  _i2.Future<void> toggleLike(int postId) => caller.callServerEndpoint<void>(
    'post',
    'toggleLike',
    {'postId': postId},
  );

  /// Subscribes or unsubscribes the authenticated user from a post.
  ///
  /// Logs engagement and returns immediately.
  _i2.Future<void> subscribeToPost(int postId) =>
      caller.callServerEndpoint<void>(
        'post',
        'subscribeToPost',
        {'postId': postId},
      );

  /// Returns paginated bookmarks for the authenticated user with enrichment.
  _i2.Future<_i10.PostList> getUserPostBookmarks({
    required int limit,
    required int page,
  }) => caller.callServerEndpoint<_i10.PostList>(
    'post',
    'getUserPostBookmarks',
    {
      'limit': limit,
      'page': page,
    },
  );

  /// Marks a post as "not interested" for the authenticated user.
  /// Logs an engagement event of type `notInterested`.
  _i2.Future<void> markNotInterested(
    int postId,
    String reason,
  ) => caller.callServerEndpoint<void>(
    'post',
    'markNotInterested',
    {
      'postId': postId,
      'reason': reason,
    },
  );

  /// Stream of post count updates (likes, reposts, bookmarks, comments,
  /// impressions) for a given post id.
  _i2.Stream<_i12.PostCounts> postCountsUpdates(int postId) =>
      caller.callStreamingServerEndpoint<
        _i2.Stream<_i12.PostCounts>,
        _i12.PostCounts
      >(
        'post',
        'postCountsUpdates',
        {'postId': postId},
        {},
      );

  /// Stream of poll count updates for a given poll id.
  _i2.Stream<_i13.PollCounts> pollCountsUpdates(int pollId) =>
      caller.callStreamingServerEndpoint<
        _i2.Stream<_i13.PollCounts>,
        _i13.PollCounts
      >(
        'post',
        'pollCountsUpdates',
        {'pollId': pollId},
        {},
      );
}

/// An endpoint for handling project-related API requests.
///
/// This class extends [Endpoint] and provides methods to manage
/// project resources, such as:
/// Creating, updating, retrieving, and deleting projects.
/// Creating, updating, retrieving, and deleting project reviews.
/// Creating, updating, retrieving, and deleting project vettings.
/// Reacting to projects, project reviews, and project vettings.
/// Bookmarking and reposting a project.
/// {@category Endpoint}
class EndpointProject extends _i1.EndpointRef {
  EndpointProject(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'project';

  /// Retrieves a [Project] by its [projectId] from the database, including its owner and associated user info.
  ///
  /// Throws a [ServerSideException] if the project cannot be found, possibly due to deletion.
  ///
  /// Parameters:
  /// - [projectId]: The unique identifier of the project to retrieve.
  ///
  /// Returns the [Project] if found, otherwise throws an exception.
  _i2.Future<_i14.ProjectWithUserState> getProject(int projectId) =>
      caller.callServerEndpoint<_i14.ProjectWithUserState>(
        'project',
        'getProject',
        {'projectId': projectId},
      );

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
  _i2.Future<_i15.ProjectReview?> getProjectReview(int projectId) =>
      caller.callServerEndpoint<_i15.ProjectReview?>(
        'project',
        'getProjectReview',
        {'projectId': projectId},
      );

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
  _i2.Future<_i16.Project> saveProject(_i16.Project project) =>
      caller.callServerEndpoint<_i16.Project>(
        'project',
        'saveProject',
        {'project': project},
      );

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
  _i2.Future<_i15.ProjectReview> saveProjectReview(
    _i15.ProjectReview projectReview,
  ) => caller.callServerEndpoint<_i15.ProjectReview>(
    'project',
    'saveProjectReview',
    {'projectReview': projectReview},
  );

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
  _i2.Future<void> deleteProjectReview(int reviewId) =>
      caller.callServerEndpoint<void>(
        'project',
        'deleteProjectReview',
        {'reviewId': reviewId},
      );

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
  _i2.Future<void> deleteProjectVetting(int vettingId) =>
      caller.callServerEndpoint<void>(
        'project',
        'deleteProjectVetting',
        {'vettingId': vettingId},
      );

  /// Schedules a future call to handle the specified [project] at the given [dateTime].
  ///
  /// Uses the [session]'s serverpod to schedule a future call named 'scheduleProjectFutureCall'.
  ///
  /// Parameters:
  /// [project] - The project to be scheduled.
  /// [dateTime] - The date and time when the future call should be executed.
  _i2.Future<void> scheduleProject(
    _i16.Project project,
    DateTime dateTime,
  ) => caller.callServerEndpoint<void>(
    'project',
    'scheduleProject',
    {
      'project': project,
      'dateTime': dateTime,
    },
  );

  /// Returns enriched feed projects including:
  /// - Base project data & owner
  /// - Up to 5 recent image attachments per project (for previews)
  /// - Current user interaction state flags: hasLiked, hasBookmarked, hasReviewed,
  ///   hasVetted, isSubscribed
  /// This is a read-only aggregation endpoint; no persistence of transient flags.
  _i2.Future<_i17.FeedProjectList> getProjects({
    required int limit,
    required int page,
    required String sortBy,
  }) => caller.callServerEndpoint<_i17.FeedProjectList>(
    'project',
    'getProjects',
    {
      'limit': limit,
      'page': page,
      'sortBy': sortBy,
    },
  );

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
  _i2.Future<_i18.ProjectReviewList> getProjectReviews(
    int projectId, {
    required int limit,
    required int page,
    double? rating,
    String? cardinal,
  }) => caller.callServerEndpoint<_i18.ProjectReviewList>(
    'project',
    'getProjectReviews',
    {
      'projectId': projectId,
      'limit': limit,
      'page': page,
      'rating': rating,
      'cardinal': cardinal,
    },
  );

  _i2.Future<void> clearBookmarks() => caller.callServerEndpoint<void>(
    'project',
    'clearBookmarks',
    {},
  );

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
  _i2.Future<_i15.ProjectReview> reactToReview(
    int reviewId,
    bool isLike,
  ) => caller.callServerEndpoint<_i15.ProjectReview>(
    'project',
    'reactToReview',
    {
      'reviewId': reviewId,
      'isLike': isLike,
    },
  );

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
  _i2.Future<_i19.ProjectVetting> reactToVetting(
    int vettingId,
    bool isLike,
  ) => caller.callServerEndpoint<_i19.ProjectVetting>(
    'project',
    'reactToVetting',
    {
      'vettingId': vettingId,
      'isLike': isLike,
    },
  );

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
  _i2.Future<void> deleteProject(int projectId) =>
      caller.callServerEndpoint<void>(
        'project',
        'deleteProject',
        {'projectId': projectId},
      );

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
  _i2.Future<void> toggleBookmark(int projectId) =>
      caller.callServerEndpoint<void>(
        'project',
        'toggleBookmark',
        {'projectId': projectId},
      );

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
  _i2.Future<void> toggleLike(int projectId) => caller.callServerEndpoint<void>(
    'project',
    'toggleLike',
    {'projectId': projectId},
  );

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
  _i2.Future<void> markNotInterested(int projectId) =>
      caller.callServerEndpoint<void>(
        'project',
        'markNotInterested',
        {'projectId': projectId},
      );

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
  _i2.Future<_i19.ProjectVetting> vetProject(
    _i19.ProjectVetting projectVetting,
  ) => caller.callServerEndpoint<_i19.ProjectVetting>(
    'project',
    'vetProject',
    {'projectVetting': projectVetting},
  );

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
  _i2.Future<_i19.ProjectVetting?> getVettedProject(int projectId) =>
      caller.callServerEndpoint<_i19.ProjectVetting?>(
        'project',
        'getVettedProject',
        {'projectId': projectId},
      );

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
  _i2.Future<_i20.ProjectVetList> getVettedProjects({
    required int limit,
    required int page,
  }) => caller.callServerEndpoint<_i20.ProjectVetList>(
    'project',
    'getVettedProjects',
    {
      'limit': limit,
      'page': page,
    },
  );

  _i2.Future<_i17.FeedProjectList> getUserProjectBookmarks({
    required int limit,
    required int page,
  }) => caller.callServerEndpoint<_i17.FeedProjectList>(
    'project',
    'getUserProjectBookmarks',
    {
      'limit': limit,
      'page': page,
    },
  );

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
  _i2.Stream<_i16.Project> projectUpdates(int projectId) => caller
      .callStreamingServerEndpoint<_i2.Stream<_i16.Project>, _i16.Project>(
        'project',
        'projectUpdates',
        {'projectId': projectId},
        {},
      );

  _i2.Future<void> subscribeToProject(int projectId) =>
      caller.callServerEndpoint<void>(
        'project',
        'subscribeToProject',
        {'projectId': projectId},
      );

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
  _i2.Stream<_i15.ProjectReview> projectReviewUpdates(int reviewId) =>
      caller.callStreamingServerEndpoint<
        _i2.Stream<_i15.ProjectReview>,
        _i15.ProjectReview
      >(
        'project',
        'projectReviewUpdates',
        {'reviewId': reviewId},
        {},
      );

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
  _i2.Stream<_i19.ProjectVetting> projectVettingUpdates(int vettingId) =>
      caller.callStreamingServerEndpoint<
        _i2.Stream<_i19.ProjectVetting>,
        _i19.ProjectVetting
      >(
        'project',
        'projectVettingUpdates',
        {'vettingId': vettingId},
        {},
      );
}

/// {@category Endpoint}
class EndpointSendEmail extends _i1.EndpointRef {
  EndpointSendEmail(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'sendEmail';

  _i2.Future<bool> sendEmail(
    String email,
    String code,
    String text,
    String? username,
    bool isEmailVerification,
  ) => caller.callServerEndpoint<bool>(
    'sendEmail',
    'sendEmail',
    {
      'email': email,
      'code': code,
      'text': text,
      'username': username,
      'isEmailVerification': isEmailVerification,
    },
  );
}

/// {@category Endpoint}
class EndpointUserRecord extends _i1.EndpointRef {
  EndpointUserRecord(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'userRecord';

  _i2.Future<_i21.UserRecord> saveUser(_i21.UserRecord userRecord) =>
      caller.callServerEndpoint<_i21.UserRecord>(
        'userRecord',
        'saveUser',
        {'userRecord': userRecord},
      );

  _i2.Future<_i21.UserRecord?> getUser(String? userId) =>
      caller.callServerEndpoint<_i21.UserRecord?>(
        'userRecord',
        'getUser',
        {'userId': userId},
      );

  _i2.Future<String?> checkIfNewUser(String email) =>
      caller.callServerEndpoint<String?>(
        'userRecord',
        'checkIfNewUser',
        {'email': email},
      );

  _i2.Future<_i22.UsersList> getUsers({
    required String query,
    required int limit,
    required int page,
  }) => caller.callServerEndpoint<_i22.UsersList>(
    'userRecord',
    'getUsers',
    {
      'query': query,
      'limit': limit,
      'page': page,
    },
  );

  _i2.Future<List<_i21.UserRecord>> mentionUsers({
    required String query,
    required int limit,
  }) => caller.callServerEndpoint<List<_i21.UserRecord>>(
    'userRecord',
    'mentionUsers',
    {
      'query': query,
      'limit': limit,
    },
  );

  _i2.Future<void> followUnfollowUser(int userId) =>
      caller.callServerEndpoint<void>(
        'userRecord',
        'followUnfollowUser',
        {'userId': userId},
      );

  _i2.Future<_i21.UserRecord?> getNinDetails(String ninNumber) =>
      caller.callServerEndpoint<_i21.UserRecord?>(
        'userRecord',
        'getNinDetails',
        {'ninNumber': ninNumber},
      );

  _i2.Stream<_i21.UserRecord> userUpdates(int userId) =>
      caller.callStreamingServerEndpoint<
        _i2.Stream<_i21.UserRecord>,
        _i21.UserRecord
      >(
        'userRecord',
        'userUpdates',
        {'userId': userId},
        {},
      );

  _i2.Future<void> registerDeviceToken(String token) =>
      caller.callServerEndpoint<void>(
        'userRecord',
        'registerDeviceToken',
        {'token': token},
      );
}

class Modules {
  Modules(Client client) {
    auth = _i23.Caller(client);
  }

  late final _i23.Caller auth;
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    @Deprecated(
      'Use authKeyProvider instead. This will be removed in future releases.',
    )
    super.authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )?
    onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
         host,
         _i24.Protocol(),
         securityContext: securityContext,
         streamingConnectionTimeout: streamingConnectionTimeout,
         connectionTimeout: connectionTimeout,
         onFailedCall: onFailedCall,
         onSucceededCall: onSucceededCall,
         disconnectStreamsOnLostInternetConnection:
             disconnectStreamsOnLostInternetConnection,
       ) {
    assets = EndpointAssets(this);
    hashtag = EndpointHashtag(this);
    location = EndpointLocation(this);
    media = EndpointMedia(this);
    notification = EndpointNotification(this);
    post = EndpointPost(this);
    project = EndpointProject(this);
    sendEmail = EndpointSendEmail(this);
    userRecord = EndpointUserRecord(this);
    modules = Modules(this);
  }

  late final EndpointAssets assets;

  late final EndpointHashtag hashtag;

  late final EndpointLocation location;

  late final EndpointMedia media;

  late final EndpointNotification notification;

  late final EndpointPost post;

  late final EndpointProject project;

  late final EndpointSendEmail sendEmail;

  late final EndpointUserRecord userRecord;

  late final Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
    'assets': assets,
    'hashtag': hashtag,
    'location': location,
    'media': media,
    'notification': notification,
    'post': post,
    'project': project,
    'sendEmail': sendEmail,
    'userRecord': userRecord,
  };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {
    'auth': modules.auth,
  };
}
