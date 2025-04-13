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
import 'package:civic_client/src/protocol/post/post_comment.dart' as _i8;
import 'package:civic_client/src/protocol/post/post_comment_list.dart' as _i9;
import 'package:civic_client/src/protocol/user/user_record.dart' as _i10;
import 'package:civic_client/src/protocol/post/post.dart' as _i11;
import 'package:civic_client/src/protocol/post/post_list.dart' as _i12;
import 'package:civic_client/src/protocol/project/project.dart' as _i13;
import 'package:civic_client/src/protocol/project/project_review.dart' as _i14;
import 'package:civic_client/src/protocol/project/project_list.dart' as _i15;
import 'package:civic_client/src/protocol/project/project_review_list.dart'
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
class EndpointPostComment extends _i1.EndpointRef {
  EndpointPostComment(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'postComment';

  _i2.Future<_i8.PostComment?> savePostComment(
    int postId,
    _i8.PostComment postComment,
  ) =>
      caller.callServerEndpoint<_i8.PostComment?>(
        'postComment',
        'savePostComment',
        {
          'postId': postId,
          'postComment': postComment,
        },
      );

  _i2.Future<_i9.PostCommentList> getPostComments(
    int postId, {
    required int limit,
    required int page,
  }) =>
      caller.callServerEndpoint<_i9.PostCommentList>(
        'postComment',
        'getPostComments',
        {
          'postId': postId,
          'limit': limit,
          'page': page,
        },
      );

  _i2.Future<_i9.PostCommentList> getPostCommentReplies(
    int commentId,
    int postId, {
    required int limit,
    required int page,
  }) =>
      caller.callServerEndpoint<_i9.PostCommentList>(
        'postComment',
        'getPostCommentReplies',
        {
          'commentId': commentId,
          'postId': postId,
          'limit': limit,
          'page': page,
        },
      );

  _i2.Future<void> deletePostComment(int commentId) =>
      caller.callServerEndpoint<void>(
        'postComment',
        'deletePostComment',
        {'commentId': commentId},
      );

  _i2.Future<List<int>> getUserLikedComments() =>
      caller.callServerEndpoint<List<int>>(
        'postComment',
        'getUserLikedComments',
        {},
      );

  _i2.Future<int> toggleCommentLike(int commentId) =>
      caller.callServerEndpoint<int>(
        'postComment',
        'toggleCommentLike',
        {'commentId': commentId},
      );

  _i2.Future<void> validatePostCommentOwnership(
    int commentId,
    _i10.UserRecord user,
  ) =>
      caller.callServerEndpoint<void>(
        'postComment',
        'validatePostCommentOwnership',
        {
          'commentId': commentId,
          'user': user,
        },
      );
}

/// {@category Endpoint}
class EndpointPost extends _i1.EndpointRef {
  EndpointPost(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'post';

  _i2.Future<_i11.Post?> savePost(
    _i11.Post post, {
    required bool isProjectRepost,
    int? projectId,
  }) =>
      caller.callServerEndpoint<_i11.Post?>(
        'post',
        'savePost',
        {
          'post': post,
          'isProjectRepost': isProjectRepost,
          'projectId': projectId,
        },
      );

  _i2.Future<void> schedulePost(
    _i11.Post post,
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

  _i2.Future<_i11.Post?> getPost(int id) =>
      caller.callServerEndpoint<_i11.Post?>(
        'post',
        'getPost',
        {'id': id},
      );

  _i2.Future<_i12.PostList> getPosts({
    required int limit,
    required int page,
  }) =>
      caller.callServerEndpoint<_i12.PostList>(
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

  _i2.Future<List<int>> getUserLikedPosts() =>
      caller.callServerEndpoint<List<int>>(
        'post',
        'getUserLikedPosts',
        {},
      );

  _i2.Future<int> toggleLike(int postId) => caller.callServerEndpoint<int>(
        'post',
        'toggleLike',
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
}

/// {@category Endpoint}
class EndpointProject extends _i1.EndpointRef {
  EndpointProject(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'project';

  _i2.Future<_i13.Project?> getProject(int id) =>
      caller.callServerEndpoint<_i13.Project?>(
        'project',
        'getProject',
        {'id': id},
      );

  _i2.Future<_i14.ProjectReview?> getProjectReview(int projectId) =>
      caller.callServerEndpoint<_i14.ProjectReview?>(
        'project',
        'getProjectReview',
        {'projectId': projectId},
      );

  _i2.Future<_i13.Project?> saveProject(_i13.Project project) =>
      caller.callServerEndpoint<_i13.Project?>(
        'project',
        'saveProject',
        {'project': project},
      );

  _i2.Future<_i14.ProjectReview?> saveProjectReview(
          _i14.ProjectReview projectReview) =>
      caller.callServerEndpoint<_i14.ProjectReview?>(
        'project',
        'saveProjectReview',
        {'projectReview': projectReview},
      );

  _i2.Future<void> undoRepost(int projectId) => caller.callServerEndpoint<void>(
        'project',
        'undoRepost',
        {'projectId': projectId},
      );

  _i2.Future<void> scheduleProject(
    _i13.Project project,
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

  _i2.Future<_i15.ProjectList> getProjects({
    required int limit,
    required int page,
  }) =>
      caller.callServerEndpoint<_i15.ProjectList>(
        'project',
        'getProjects',
        {
          'limit': limit,
          'page': page,
        },
      );

  _i2.Future<_i16.ProjectReviewList> getProjectReviews(
    int projectId, {
    required int limit,
    required int page,
    double? rating,
    String? cardinal,
  }) =>
      caller.callServerEndpoint<_i16.ProjectReviewList>(
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

  _i2.Future<void> reactToReview(
    int reviewId,
    bool isLike,
  ) =>
      caller.callServerEndpoint<void>(
        'project',
        'reactToReview',
        {
          'reviewId': reviewId,
          'isLike': isLike,
        },
      );

  _i2.Future<void> deleteProject(int id) => caller.callServerEndpoint<void>(
        'project',
        'deleteProject',
        {'id': id},
      );

  _i2.Future<void> toggleBookmark(int projectId) =>
      caller.callServerEndpoint<void>(
        'project',
        'toggleBookmark',
        {'projectId': projectId},
      );

  _i2.Future<void> toggleLike(int projectId) => caller.callServerEndpoint<void>(
        'project',
        'toggleLike',
        {'projectId': projectId},
      );

  _i2.Future<void> markNotInterested(int projectId) =>
      caller.callServerEndpoint<void>(
        'project',
        'markNotInterested',
        {'projectId': projectId},
      );

  _i2.Future<_i10.UserRecord> authUser() =>
      caller.callServerEndpoint<_i10.UserRecord>(
        'project',
        'authUser',
        {},
      );

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

  _i2.Stream<_i13.Project> projectUpdates(int projectId) => caller
          .callStreamingServerEndpoint<_i2.Stream<_i13.Project>, _i13.Project>(
        'project',
        'projectUpdates',
        {'projectId': projectId},
        {},
      );

  _i2.Future<void> updateProject(_i13.Project project) =>
      caller.callServerEndpoint<void>(
        'project',
        'updateProject',
        {'project': project},
      );

  _i2.Stream<_i14.ProjectReview> projectReviewUpdates(int reviewId) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i14.ProjectReview>,
          _i14.ProjectReview>(
        'project',
        'projectReviewUpdates',
        {'reviewId': reviewId},
        {},
      );

  _i2.Future<void> updateProjectReview(_i14.ProjectReview projectReview) =>
      caller.callServerEndpoint<void>(
        'project',
        'updateProjectReview',
        {'projectReview': projectReview},
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
    postComment = EndpointPostComment(this);
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

  late final EndpointPostComment postComment;

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
        'postComment': postComment,
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
