/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:civic_client/src/protocol/article/article_list.dart' as _i3;
import 'package:civic_client/src/protocol/article/article.dart' as _i4;
import 'package:civic_client/src/protocol/general/aws_places.dart' as _i5;
import 'package:civic_client/src/protocol/poll/poll.dart' as _i6;
import 'package:civic_client/src/protocol/poll/poll_list.dart' as _i7;
import 'package:civic_client/src/protocol/post/post.dart' as _i8;
import 'package:civic_client/src/protocol/post/post_list.dart' as _i9;
import 'package:civic_client/src/protocol/user/user_record.dart' as _i10;
import 'package:civic_client/src/protocol/project/project.dart' as _i11;
import 'package:civic_client/src/protocol/project/project_review.dart' as _i12;
import 'package:civic_client/src/protocol/project/project_list.dart' as _i13;
import 'package:civic_client/src/protocol/project/project_review_list.dart'
    as _i14;
import 'package:civic_client/src/protocol/project/project_vetting.dart' as _i15;
import 'package:civic_client/src/protocol/project/project_vet_list.dart'
    as _i16;
import 'package:civic_client/src/protocol/user/user_nin_record.dart' as _i17;
import 'package:civic_client/src/protocol/user/users_list.dart' as _i18;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i19;
import 'protocol.dart' as _i20;

/// {@category Endpoint}
class EndpointArticle extends _i1.EndpointRef {
  EndpointArticle(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'article';

  _i2.Future<_i3.ArticleList> getArticles({
    required int limit,
    required int page,
  }) =>
      caller.callServerEndpoint<_i3.ArticleList>(
        'article',
        'getArticles',
        {
          'limit': limit,
          'page': page,
        },
      );

  _i2.Future<_i4.Article?> getArticle({required int id}) =>
      caller.callServerEndpoint<_i4.Article?>(
        'article',
        'getArticle',
        {'id': id},
      );

  _i2.Future<_i4.Article?> saveArticle(_i4.Article article) =>
      caller.callServerEndpoint<_i4.Article?>(
        'article',
        'saveArticle',
        {'article': article},
      );

  _i2.Future<void> deleteArticle(int id) => caller.callServerEndpoint<void>(
        'article',
        'deleteArticle',
        {'id': id},
      );
}

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
  ) =>
      caller.callServerEndpoint<void>(
        'hashtag',
        'sendPostHashtags',
        {
          'tags': tags,
          'postId': postId,
        },
      );

  _i2.Future<void> sendPollHashtags(
    List<String> tags,
    int pollId,
  ) =>
      caller.callServerEndpoint<void>(
        'hashtag',
        'sendPollHashtags',
        {
          'tags': tags,
          'pollId': pollId,
        },
      );

  _i2.Future<List<String>> fetchHashtags({
    required String query,
    required int limit,
  }) =>
      caller.callServerEndpoint<List<String>>(
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

  _i2.Future<List<_i5.AWSPlaces>> searchLocation(String query) =>
      caller.callServerEndpoint<List<_i5.AWSPlaces>>(
        'location',
        'searchLocation',
        {'query': query},
      );

  _i2.Future<List<_i5.AWSPlaces>> searchNearbyLocation(List<double> position) =>
      caller.callServerEndpoint<List<_i5.AWSPlaces>>(
        'location',
        'searchNearbyLocation',
        {'position': position},
      );
}

/// {@category Endpoint}
class EndpointPoll extends _i1.EndpointRef {
  EndpointPoll(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'poll';

  _i2.Future<_i6.Poll?> savePoll(_i6.Poll poll) =>
      caller.callServerEndpoint<_i6.Poll?>(
        'poll',
        'savePoll',
        {'poll': poll},
      );

  _i2.Future<void> schedulePoll(
    _i6.Poll poll,
    DateTime dateTime,
  ) =>
      caller.callServerEndpoint<void>(
        'poll',
        'schedulePoll',
        {
          'poll': poll,
          'dateTime': dateTime,
        },
      );

  _i2.Future<_i6.Poll?> getPoll(int pollId) =>
      caller.callServerEndpoint<_i6.Poll?>(
        'poll',
        'getPoll',
        {'pollId': pollId},
      );

  _i2.Future<void> castVote(
    int pollId,
    String option,
  ) =>
      caller.callServerEndpoint<void>(
        'poll',
        'castVote',
        {
          'pollId': pollId,
          'option': option,
        },
      );

  _i2.Future<_i7.PollList> getPolls({
    required int limit,
    required int page,
  }) =>
      caller.callServerEndpoint<_i7.PollList>(
        'poll',
        'getPolls',
        {
          'limit': limit,
          'page': page,
        },
      );

  _i2.Future<bool> hasVoted(
    int pollId,
    int userId,
  ) =>
      caller.callServerEndpoint<bool>(
        'poll',
        'hasVoted',
        {
          'pollId': pollId,
          'userId': userId,
        },
      );
}

/// {@category Endpoint}
class EndpointPost extends _i1.EndpointRef {
  EndpointPost(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'post';

  _i2.Future<_i8.Post?> savePost(_i8.Post post) =>
      caller.callServerEndpoint<_i8.Post?>(
        'post',
        'savePost',
        {'post': post},
      );

  _i2.Future<_i8.Post?> savePostComment(
    _i8.Post comment,
    bool isReply,
  ) =>
      caller.callServerEndpoint<_i8.Post?>(
        'post',
        'savePostComment',
        {
          'comment': comment,
          'isReply': isReply,
        },
      );

  _i2.Future<_i9.PostList> getPostComments(
    int postId, {
    required int limit,
    required int page,
  }) =>
      caller.callServerEndpoint<_i9.PostList>(
        'post',
        'getPostComments',
        {
          'postId': postId,
          'limit': limit,
          'page': page,
        },
      );

  _i2.Future<_i9.PostList> getPostCommentReplies(
    int commentId, {
    required int limit,
    required int page,
  }) =>
      caller.callServerEndpoint<_i9.PostList>(
        'post',
        'getPostCommentReplies',
        {
          'commentId': commentId,
          'limit': limit,
          'page': page,
        },
      );

  _i2.Future<void> schedulePost(
    _i8.Post post,
    DateTime dateTime,
  ) =>
      caller.callServerEndpoint<void>(
        'post',
        'schedulePost',
        {
          'post': post,
          'dateTime': dateTime,
        },
      );

  _i2.Future<_i8.Post> getRootPost(_i8.Post post) =>
      caller.callServerEndpoint<_i8.Post>(
        'post',
        'getRootPost',
        {'post': post},
      );

  _i2.Future<_i8.Post> repostOrQuote(
    int? projectId,
    _i8.Post? quoteContent,
  ) =>
      caller.callServerEndpoint<_i8.Post>(
        'post',
        'repostOrQuote',
        {
          'projectId': projectId,
          'quoteContent': quoteContent,
        },
      );

  _i2.Future<_i8.Post> getPost(int id) => caller.callServerEndpoint<_i8.Post>(
        'post',
        'getPost',
        {'id': id},
      );

  _i2.Future<_i9.PostList> getPosts({
    required int limit,
    required int page,
  }) =>
      caller.callServerEndpoint<_i9.PostList>(
        'post',
        'getPosts',
        {
          'limit': limit,
          'page': page,
        },
      );

  _i2.Future<void> deletePost(int id) => caller.callServerEndpoint<void>(
        'post',
        'deletePost',
        {'id': id},
      );

  _i2.Future<void> toggleBookmark(int postId) =>
      caller.callServerEndpoint<void>(
        'post',
        'toggleBookmark',
        {'postId': postId},
      );

  _i2.Future<void> toggleLike(int postId) => caller.callServerEndpoint<void>(
        'post',
        'toggleLike',
        {'postId': postId},
      );

  _i2.Future<void> markNotInterested(int postId) =>
      caller.callServerEndpoint<void>(
        'post',
        'markNotInterested',
        {'postId': postId},
      );

  _i2.Future<_i10.UserRecord> authUser() =>
      caller.callServerEndpoint<_i10.UserRecord>(
        'post',
        'authUser',
        {},
      );

  _i2.Future<void> validatePostOwnership(
    int postId,
    _i10.UserRecord user,
  ) =>
      caller.callServerEndpoint<void>(
        'post',
        'validatePostOwnership',
        {
          'postId': postId,
          'user': user,
        },
      );

  _i2.Future<void> validateCommentOwnership(
    int commentId,
    int postId,
    _i10.UserRecord user,
  ) =>
      caller.callServerEndpoint<void>(
        'post',
        'validateCommentOwnership',
        {
          'commentId': commentId,
          'postId': postId,
          'user': user,
        },
      );

  _i2.Stream<_i8.Post> postUpdates(int postId) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i8.Post>, _i8.Post>(
        'post',
        'postUpdates',
        {'postId': postId},
        {},
      );

  _i2.Future<void> updatePost(_i8.Post post) => caller.callServerEndpoint<void>(
        'post',
        'updatePost',
        {'post': post},
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
  /// Throws a [PostException] if the project cannot be found, possibly due to deletion.
  ///
  /// Parameters:
  /// - [projectId]: The unique identifier of the project to retrieve.
  ///
  /// Returns the [Project] if found, otherwise throws an exception.
  _i2.Future<_i11.Project> getProject(int projectId) =>
      caller.callServerEndpoint<_i11.Project>(
        'project',
        'getProject',
        {'projectId': projectId},
      );

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
  _i2.Future<_i12.ProjectReview?> getProjectReview(int projectId) =>
      caller.callServerEndpoint<_i12.ProjectReview?>(
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
  /// Logs and throws a [PostException] if an error occurs during the process.
  ///
  /// Parameters:
  /// - [project]: The project to save or update.
  ///
  /// Returns the saved or updated [Project].
  _i2.Future<_i11.Project> saveProject(_i11.Project project) =>
      caller.callServerEndpoint<_i11.Project>(
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
  /// 5. Handles and logs exceptions, rethrowing known `PostException` errors.
  ///
  /// Throws a [PostException] if the project or review cannot be found, or if any other error occurs.
  ///
  /// Returns the saved [ProjectReview] object (either newly created or updated).
  ///
  /// Parameters:
  /// - [projectReview]: The review to be saved or updated.
  _i2.Future<_i12.ProjectReview> saveProjectReview(
          _i12.ProjectReview projectReview) =>
      caller.callServerEndpoint<_i12.ProjectReview>(
        'project',
        'saveProjectReview',
        {'projectReview': projectReview},
      );

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
  _i2.Future<void> deleteProjectVetting(int vettingId) =>
      caller.callServerEndpoint<void>(
        'project',
        'deleteProjectVetting',
        {'vettingId': vettingId},
      );

  /// Undoes a repost action for a given project.
  ///
  /// Calls the [PostEndpoint.repostOrQuote] method with the provided [session] and [projectId],
  /// effectively reversing a previous repost operation.
  ///
  /// [session] - The current user session.
  /// [projectId] - The ID of the project to undo the repost for.
  ///
  /// Throws an exception if the operation fails.
  _i2.Future<void> undoRepost(int projectId) => caller.callServerEndpoint<void>(
        'project',
        'undoRepost',
        {'projectId': projectId},
      );

  /// Schedules a future call to handle the specified [project] at the given [dateTime].
  ///
  /// Uses the [session]'s serverpod to schedule a future call named 'scheduleProjectFutureCall'.
  ///
  /// Parameters:
  /// [project] - The project to be scheduled.
  /// [dateTime] - The date and time when the future call should be executed.
  _i2.Future<void> scheduleProject(
    _i11.Project project,
    DateTime dateTime,
  ) =>
      caller.callServerEndpoint<void>(
        'project',
        'scheduleProject',
        {
          'project': project,
          'dateTime': dateTime,
        },
      );

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
  _i2.Future<_i13.ProjectList> getProjects({
    required int limit,
    required int page,
  }) =>
      caller.callServerEndpoint<_i13.ProjectList>(
        'project',
        'getProjects',
        {
          'limit': limit,
          'page': page,
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
  /// Throws a [UserException] if pagination parameters are invalid or if an invalid
  /// rating category is provided.
  /// Throws a [PostException] if an error occurs while fetching reviews.
  _i2.Future<_i14.ProjectReviewList> getProjectReviews(
    int projectId, {
    required int limit,
    required int page,
    double? rating,
    String? cardinal,
  }) =>
      caller.callServerEndpoint<_i14.ProjectReviewList>(
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
  _i2.Future<_i12.ProjectReview> reactToReview(
    int reviewId,
    bool isLike,
  ) =>
      caller.callServerEndpoint<_i12.ProjectReview>(
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
  _i2.Future<_i15.ProjectVetting> reactToVetting(
    int vettingId,
    bool isLike,
  ) =>
      caller.callServerEndpoint<_i15.ProjectVetting>(
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
  /// 4. If the project does not exist, throws a [PostException].
  /// 5. Marks the project as deleted by setting its `isDeleted` property to `true`.
  /// 6. Updates the project in the database.
  ///
  /// Throws a [PostException] if the project is not found.
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
  /// Throws a [PostException] if the project is not found.
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
  /// Throws a [PostException] if the project is not found.
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
  _i2.Future<_i15.ProjectVetting> vetProject(
          _i15.ProjectVetting projectVetting) =>
      caller.callServerEndpoint<_i15.ProjectVetting>(
        'project',
        'vetProject',
        {'projectVetting': projectVetting},
      );

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
  _i2.Future<_i15.ProjectVetting?> getVettedProject(int projectId) =>
      caller.callServerEndpoint<_i15.ProjectVetting?>(
        'project',
        'getVettedProject',
        {'projectId': projectId},
      );

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
  _i2.Future<_i16.ProjectVetList> getVettedProjects({
    required int limit,
    required int page,
  }) =>
      caller.callServerEndpoint<_i16.ProjectVetList>(
        'project',
        'getVettedProjects',
        {
          'limit': limit,
          'page': page,
        },
      );

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
  _i2.Future<_i10.UserRecord> authUser() =>
      caller.callServerEndpoint<_i10.UserRecord>(
        'project',
        'authUser',
        {},
      );

  /// Validates that the given [user] is the owner of the project with the specified [projectId].
  ///
  /// Throws a [PostException] if the project does not exist or if the user is not the owner.
  ///
  /// Parameters:
  /// [projectId] - The ID of the project to validate ownership for.
  /// [user] - The user attempting the operation.
  _i2.Future<void> validateProjectOwnership(
    int projectId,
    _i10.UserRecord user,
  ) =>
      caller.callServerEndpoint<void>(
        'project',
        'validateProjectOwnership',
        {
          'projectId': projectId,
          'user': user,
        },
      );

  /// Validates that the given [user] is the owner of the project review with the specified [projectReviewId].
  ///
  /// Throws a [PostException] if the project review is not found or if the user is not the owner.
  ///
  /// Parameters:
  /// [projectReviewId] - The ID of the project review to validate.
  /// [user] - The user attempting the operation.
  _i2.Future<void> validateProjectReviewOwnership(
    int projectReviewId,
    _i10.UserRecord user,
  ) =>
      caller.callServerEndpoint<void>(
        'project',
        'validateProjectReviewOwnership',
        {
          'projectReviewId': projectReviewId,
          'user': user,
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
  _i2.Stream<_i11.Project> projectUpdates(int projectId) => caller
          .callStreamingServerEndpoint<_i2.Stream<_i11.Project>, _i11.Project>(
        'project',
        'projectUpdates',
        {'projectId': projectId},
        {},
      );

  /// Updates the given [project] in the database and notifies all clients
  /// subscribed to this project by sending an update message.
  ///
  /// Parameters:
  /// - [project]: The project instance to be updated.
  ///
  /// This method first updates the project in the database, then posts a message
  /// to all clients subscribed to the project's channel to notify them of the update.
  _i2.Future<void> updateProject(_i11.Project project) =>
      caller.callServerEndpoint<void>(
        'project',
        'updateProject',
        {'project': project},
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
  _i2.Stream<_i12.ProjectReview> projectReviewUpdates(int reviewId) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i12.ProjectReview>,
          _i12.ProjectReview>(
        'project',
        'projectReviewUpdates',
        {'reviewId': reviewId},
        {},
      );

  /// Updates a [ProjectReview] in the database and notifies all clients subscribed to this review.
  ///
  /// This method performs the following actions:
  /// - Updates the specified [projectReview] in the database using the provided [session].
  /// - Sends a message to all clients subscribed to the review channel identified by `'review_${projectReview.id}'`,
  ///   containing the updated [projectReview] data.
  ///
  /// [session]: The current database session.
  /// [projectReview]: The project review object to update.
  _i2.Future<void> updateProjectReview(_i12.ProjectReview projectReview) =>
      caller.callServerEndpoint<void>(
        'project',
        'updateProjectReview',
        {'projectReview': projectReview},
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
  _i2.Stream<_i15.ProjectVetting> projectVettingUpdates(int vettingId) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i15.ProjectVetting>,
          _i15.ProjectVetting>(
        'project',
        'projectVettingUpdates',
        {'vettingId': vettingId},
        {},
      );

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
  _i2.Future<void> updateProjectVetting(_i15.ProjectVetting projectVetting) =>
      caller.callServerEndpoint<void>(
        'project',
        'updateProjectVetting',
        {'projectVetting': projectVetting},
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
  ) =>
      caller.callServerEndpoint<bool>(
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
class EndpointUserNin extends _i1.EndpointRef {
  EndpointUserNin(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'userNin';

  _i2.Future<_i17.UserNinRecord?> getNinDetails(String ninNumber) =>
      caller.callServerEndpoint<_i17.UserNinRecord?>(
        'userNin',
        'getNinDetails',
        {'ninNumber': ninNumber},
      );
}

/// {@category Endpoint}
class EndpointUserRecord extends _i1.EndpointRef {
  EndpointUserRecord(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'userRecord';

  _i2.Future<void> saveUser(_i10.UserRecord userRecord) =>
      caller.callServerEndpoint<void>(
        'userRecord',
        'saveUser',
        {'userRecord': userRecord},
      );

  _i2.Future<_i10.UserRecord?> getUser() =>
      caller.callServerEndpoint<_i10.UserRecord?>(
        'userRecord',
        'getUser',
        {},
      );

  _i2.Future<String?> checkIfNewUser(String email) =>
      caller.callServerEndpoint<String?>(
        'userRecord',
        'checkIfNewUser',
        {'email': email},
      );

  _i2.Future<List<String>> fetchUsernames() =>
      caller.callServerEndpoint<List<String>>(
        'userRecord',
        'fetchUsernames',
        {},
      );

  _i2.Future<_i18.UsersList> getUsers({
    required String query,
    required int limit,
    required int page,
  }) =>
      caller.callServerEndpoint<_i18.UsersList>(
        'userRecord',
        'getUsers',
        {
          'query': query,
          'limit': limit,
          'page': page,
        },
      );

  _i2.Future<List<_i10.UserRecord>> mentionUsers({
    required String query,
    required int limit,
  }) =>
      caller.callServerEndpoint<List<_i10.UserRecord>>(
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
}

class Modules {
  Modules(Client client) {
    auth = _i19.Caller(client);
  }

  late final _i19.Caller auth;
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
          host,
          _i20.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    article = EndpointArticle(this);
    assets = EndpointAssets(this);
    hashtag = EndpointHashtag(this);
    location = EndpointLocation(this);
    poll = EndpointPoll(this);
    post = EndpointPost(this);
    project = EndpointProject(this);
    sendEmail = EndpointSendEmail(this);
    userNin = EndpointUserNin(this);
    userRecord = EndpointUserRecord(this);
    modules = Modules(this);
  }

  late final EndpointArticle article;

  late final EndpointAssets assets;

  late final EndpointHashtag hashtag;

  late final EndpointLocation location;

  late final EndpointPoll poll;

  late final EndpointPost post;

  late final EndpointProject project;

  late final EndpointSendEmail sendEmail;

  late final EndpointUserNin userNin;

  late final EndpointUserRecord userRecord;

  late final Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'article': article,
        'assets': assets,
        'hashtag': hashtag,
        'location': location,
        'poll': poll,
        'post': post,
        'project': project,
        'sendEmail': sendEmail,
        'userNin': userNin,
        'userRecord': userRecord,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
