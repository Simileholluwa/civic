/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/article_endpoint.dart' as _i2;
import '../endpoints/assets_endpoint.dart' as _i3;
import '../endpoints/hashtag_endpoint.dart' as _i4;
import '../endpoints/location_endpoint.dart' as _i5;
import '../endpoints/poll_endpoint.dart' as _i6;
import '../endpoints/post_comment_endpoint.dart' as _i7;
import '../endpoints/post_endpoint.dart' as _i8;
import '../endpoints/project_endpoint.dart' as _i9;
import '../endpoints/send_email_endpoint.dart' as _i10;
import '../endpoints/user_nin_endpoint.dart' as _i11;
import '../endpoints/user_record_endpoint.dart' as _i12;
import 'package:civic_server/src/generated/article/article.dart' as _i13;
import 'package:civic_server/src/generated/poll/poll.dart' as _i14;
import 'package:civic_server/src/generated/post/post_comment.dart' as _i15;
import 'package:civic_server/src/generated/user/user_record.dart' as _i16;
import 'package:civic_server/src/generated/post/post.dart' as _i17;
import 'package:civic_server/src/generated/project/project.dart' as _i18;
import 'package:civic_server/src/generated/project/project_review.dart' as _i19;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i20;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'article': _i2.ArticleEndpoint()
        ..initialize(
          server,
          'article',
          null,
        ),
      'assets': _i3.AssetsEndpoint()
        ..initialize(
          server,
          'assets',
          null,
        ),
      'hashtag': _i4.HashtagEndpoint()
        ..initialize(
          server,
          'hashtag',
          null,
        ),
      'location': _i5.LocationEndpoint()
        ..initialize(
          server,
          'location',
          null,
        ),
      'poll': _i6.PollEndpoint()
        ..initialize(
          server,
          'poll',
          null,
        ),
      'postComment': _i7.PostCommentEndpoint()
        ..initialize(
          server,
          'postComment',
          null,
        ),
      'post': _i8.PostEndpoint()
        ..initialize(
          server,
          'post',
          null,
        ),
      'project': _i9.ProjectEndpoint()
        ..initialize(
          server,
          'project',
          null,
        ),
      'sendEmail': _i10.SendEmailEndpoint()
        ..initialize(
          server,
          'sendEmail',
          null,
        ),
      'userNin': _i11.UserNinEndpoint()
        ..initialize(
          server,
          'userNin',
          null,
        ),
      'userRecord': _i12.UserRecordEndpoint()
        ..initialize(
          server,
          'userRecord',
          null,
        ),
    };
    connectors['article'] = _i1.EndpointConnector(
      name: 'article',
      endpoint: endpoints['article']!,
      methodConnectors: {
        'getArticles': _i1.MethodConnector(
          name: 'getArticles',
          params: {
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'page': _i1.ParameterDescription(
              name: 'page',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['article'] as _i2.ArticleEndpoint).getArticles(
            session,
            limit: params['limit'],
            page: params['page'],
          ),
        ),
        'getArticle': _i1.MethodConnector(
          name: 'getArticle',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['article'] as _i2.ArticleEndpoint).getArticle(
            session,
            id: params['id'],
          ),
        ),
        'saveArticle': _i1.MethodConnector(
          name: 'saveArticle',
          params: {
            'article': _i1.ParameterDescription(
              name: 'article',
              type: _i1.getType<_i13.Article>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['article'] as _i2.ArticleEndpoint).saveArticle(
            session,
            params['article'],
          ),
        ),
        'deleteArticle': _i1.MethodConnector(
          name: 'deleteArticle',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['article'] as _i2.ArticleEndpoint).deleteArticle(
            session,
            params['id'],
          ),
        ),
      },
    );
    connectors['assets'] = _i1.EndpointConnector(
      name: 'assets',
      endpoint: endpoints['assets']!,
      methodConnectors: {
        'getUploadDescription': _i1.MethodConnector(
          name: 'getUploadDescription',
          params: {
            'path': _i1.ParameterDescription(
              name: 'path',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['assets'] as _i3.AssetsEndpoint).getUploadDescription(
            session,
            params['path'],
          ),
        ),
        'verifyUpload': _i1.MethodConnector(
          name: 'verifyUpload',
          params: {
            'path': _i1.ParameterDescription(
              name: 'path',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['assets'] as _i3.AssetsEndpoint).verifyUpload(
            session,
            params['path'],
          ),
        ),
      },
    );
    connectors['hashtag'] = _i1.EndpointConnector(
      name: 'hashtag',
      endpoint: endpoints['hashtag']!,
      methodConnectors: {
        'sendPostHashtags': _i1.MethodConnector(
          name: 'sendPostHashtags',
          params: {
            'tags': _i1.ParameterDescription(
              name: 'tags',
              type: _i1.getType<List<String>>(),
              nullable: false,
            ),
            'postId': _i1.ParameterDescription(
              name: 'postId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['hashtag'] as _i4.HashtagEndpoint).sendPostHashtags(
            session,
            params['tags'],
            params['postId'],
          ),
        ),
        'sendPollHashtags': _i1.MethodConnector(
          name: 'sendPollHashtags',
          params: {
            'tags': _i1.ParameterDescription(
              name: 'tags',
              type: _i1.getType<List<String>>(),
              nullable: false,
            ),
            'pollId': _i1.ParameterDescription(
              name: 'pollId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['hashtag'] as _i4.HashtagEndpoint).sendPollHashtags(
            session,
            params['tags'],
            params['pollId'],
          ),
        ),
        'fetchHashtags': _i1.MethodConnector(
          name: 'fetchHashtags',
          params: {
            'query': _i1.ParameterDescription(
              name: 'query',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['hashtag'] as _i4.HashtagEndpoint).fetchHashtags(
            session,
            query: params['query'],
            limit: params['limit'],
          ),
        ),
      },
    );
    connectors['location'] = _i1.EndpointConnector(
      name: 'location',
      endpoint: endpoints['location']!,
      methodConnectors: {
        'searchLocation': _i1.MethodConnector(
          name: 'searchLocation',
          params: {
            'query': _i1.ParameterDescription(
              name: 'query',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['location'] as _i5.LocationEndpoint).searchLocation(
            session,
            params['query'],
          ),
        ),
        'searchNearbyLocation': _i1.MethodConnector(
          name: 'searchNearbyLocation',
          params: {
            'position': _i1.ParameterDescription(
              name: 'position',
              type: _i1.getType<List<double>>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['location'] as _i5.LocationEndpoint)
                  .searchNearbyLocation(
            session,
            params['position'],
          ),
        ),
      },
    );
    connectors['poll'] = _i1.EndpointConnector(
      name: 'poll',
      endpoint: endpoints['poll']!,
      methodConnectors: {
        'savePoll': _i1.MethodConnector(
          name: 'savePoll',
          params: {
            'poll': _i1.ParameterDescription(
              name: 'poll',
              type: _i1.getType<_i14.Poll>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['poll'] as _i6.PollEndpoint).savePoll(
            session,
            params['poll'],
          ),
        ),
        'schedulePoll': _i1.MethodConnector(
          name: 'schedulePoll',
          params: {
            'poll': _i1.ParameterDescription(
              name: 'poll',
              type: _i1.getType<_i14.Poll>(),
              nullable: false,
            ),
            'dateTime': _i1.ParameterDescription(
              name: 'dateTime',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['poll'] as _i6.PollEndpoint).schedulePoll(
            session,
            params['poll'],
            params['dateTime'],
          ),
        ),
        'getPoll': _i1.MethodConnector(
          name: 'getPoll',
          params: {
            'pollId': _i1.ParameterDescription(
              name: 'pollId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['poll'] as _i6.PollEndpoint).getPoll(
            session,
            params['pollId'],
          ),
        ),
        'castVote': _i1.MethodConnector(
          name: 'castVote',
          params: {
            'pollId': _i1.ParameterDescription(
              name: 'pollId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'option': _i1.ParameterDescription(
              name: 'option',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['poll'] as _i6.PollEndpoint).castVote(
            session,
            params['pollId'],
            params['option'],
          ),
        ),
        'getPolls': _i1.MethodConnector(
          name: 'getPolls',
          params: {
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'page': _i1.ParameterDescription(
              name: 'page',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['poll'] as _i6.PollEndpoint).getPolls(
            session,
            limit: params['limit'],
            page: params['page'],
          ),
        ),
        'hasVoted': _i1.MethodConnector(
          name: 'hasVoted',
          params: {
            'pollId': _i1.ParameterDescription(
              name: 'pollId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['poll'] as _i6.PollEndpoint).hasVoted(
            session,
            params['pollId'],
            params['userId'],
          ),
        ),
      },
    );
    connectors['postComment'] = _i1.EndpointConnector(
      name: 'postComment',
      endpoint: endpoints['postComment']!,
      methodConnectors: {
        'savePostComment': _i1.MethodConnector(
          name: 'savePostComment',
          params: {
            'postId': _i1.ParameterDescription(
              name: 'postId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'postComment': _i1.ParameterDescription(
              name: 'postComment',
              type: _i1.getType<_i15.PostComment>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['postComment'] as _i7.PostCommentEndpoint)
                  .savePostComment(
            session,
            params['postId'],
            params['postComment'],
          ),
        ),
        'getPostComments': _i1.MethodConnector(
          name: 'getPostComments',
          params: {
            'postId': _i1.ParameterDescription(
              name: 'postId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'page': _i1.ParameterDescription(
              name: 'page',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['postComment'] as _i7.PostCommentEndpoint)
                  .getPostComments(
            session,
            params['postId'],
            limit: params['limit'],
            page: params['page'],
          ),
        ),
        'getPostCommentReplies': _i1.MethodConnector(
          name: 'getPostCommentReplies',
          params: {
            'commentId': _i1.ParameterDescription(
              name: 'commentId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'postId': _i1.ParameterDescription(
              name: 'postId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'page': _i1.ParameterDescription(
              name: 'page',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['postComment'] as _i7.PostCommentEndpoint)
                  .getPostCommentReplies(
            session,
            params['commentId'],
            params['postId'],
            limit: params['limit'],
            page: params['page'],
          ),
        ),
        'deletePostComment': _i1.MethodConnector(
          name: 'deletePostComment',
          params: {
            'commentId': _i1.ParameterDescription(
              name: 'commentId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['postComment'] as _i7.PostCommentEndpoint)
                  .deletePostComment(
            session,
            params['commentId'],
          ),
        ),
        'getUserLikedComments': _i1.MethodConnector(
          name: 'getUserLikedComments',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['postComment'] as _i7.PostCommentEndpoint)
                  .getUserLikedComments(session),
        ),
        'toggleCommentLike': _i1.MethodConnector(
          name: 'toggleCommentLike',
          params: {
            'commentId': _i1.ParameterDescription(
              name: 'commentId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['postComment'] as _i7.PostCommentEndpoint)
                  .toggleCommentLike(
            session,
            params['commentId'],
          ),
        ),
        'validatePostCommentOwnership': _i1.MethodConnector(
          name: 'validatePostCommentOwnership',
          params: {
            'commentId': _i1.ParameterDescription(
              name: 'commentId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'user': _i1.ParameterDescription(
              name: 'user',
              type: _i1.getType<_i16.UserRecord>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['postComment'] as _i7.PostCommentEndpoint)
                  .validatePostCommentOwnership(
            session,
            params['commentId'],
            params['user'],
          ),
        ),
      },
    );
    connectors['post'] = _i1.EndpointConnector(
      name: 'post',
      endpoint: endpoints['post']!,
      methodConnectors: {
        'savePost': _i1.MethodConnector(
          name: 'savePost',
          params: {
            'post': _i1.ParameterDescription(
              name: 'post',
              type: _i1.getType<_i17.Post>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['post'] as _i8.PostEndpoint).savePost(
            session,
            params['post'],
          ),
        ),
        'schedulePost': _i1.MethodConnector(
          name: 'schedulePost',
          params: {
            'post': _i1.ParameterDescription(
              name: 'post',
              type: _i1.getType<_i17.Post>(),
              nullable: false,
            ),
            'dateTime': _i1.ParameterDescription(
              name: 'dateTime',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['post'] as _i8.PostEndpoint).schedulePost(
            session,
            params['post'],
            params['dateTime'],
          ),
        ),
        'getPost': _i1.MethodConnector(
          name: 'getPost',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['post'] as _i8.PostEndpoint).getPost(
            session,
            params['id'],
          ),
        ),
        'getPosts': _i1.MethodConnector(
          name: 'getPosts',
          params: {
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'page': _i1.ParameterDescription(
              name: 'page',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['post'] as _i8.PostEndpoint).getPosts(
            session,
            limit: params['limit'],
            page: params['page'],
          ),
        ),
        'deletePost': _i1.MethodConnector(
          name: 'deletePost',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['post'] as _i8.PostEndpoint).deletePost(
            session,
            params['id'],
          ),
        ),
        'getUserLikedPosts': _i1.MethodConnector(
          name: 'getUserLikedPosts',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['post'] as _i8.PostEndpoint)
                  .getUserLikedPosts(session),
        ),
        'toggleLike': _i1.MethodConnector(
          name: 'toggleLike',
          params: {
            'postId': _i1.ParameterDescription(
              name: 'postId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['post'] as _i8.PostEndpoint).toggleLike(
            session,
            params['postId'],
          ),
        ),
        'authUser': _i1.MethodConnector(
          name: 'authUser',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['post'] as _i8.PostEndpoint).authUser(session),
        ),
        'validatePostOwnership': _i1.MethodConnector(
          name: 'validatePostOwnership',
          params: {
            'postId': _i1.ParameterDescription(
              name: 'postId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'user': _i1.ParameterDescription(
              name: 'user',
              type: _i1.getType<_i16.UserRecord>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['post'] as _i8.PostEndpoint).validatePostOwnership(
            session,
            params['postId'],
            params['user'],
          ),
        ),
      },
    );
    connectors['project'] = _i1.EndpointConnector(
      name: 'project',
      endpoint: endpoints['project']!,
      methodConnectors: {
        'getProject': _i1.MethodConnector(
          name: 'getProject',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['project'] as _i9.ProjectEndpoint).getProject(
            session,
            params['id'],
          ),
        ),
        'getProjectReview': _i1.MethodConnector(
          name: 'getProjectReview',
          params: {
            'projectId': _i1.ParameterDescription(
              name: 'projectId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['project'] as _i9.ProjectEndpoint).getProjectReview(
            session,
            params['projectId'],
          ),
        ),
        'saveProject': _i1.MethodConnector(
          name: 'saveProject',
          params: {
            'project': _i1.ParameterDescription(
              name: 'project',
              type: _i1.getType<_i18.Project>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['project'] as _i9.ProjectEndpoint).saveProject(
            session,
            params['project'],
          ),
        ),
        'saveProjectReview': _i1.MethodConnector(
          name: 'saveProjectReview',
          params: {
            'projectReview': _i1.ParameterDescription(
              name: 'projectReview',
              type: _i1.getType<_i19.ProjectReview>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['project'] as _i9.ProjectEndpoint).saveProjectReview(
            session,
            params['projectReview'],
          ),
        ),
        'scheduleProject': _i1.MethodConnector(
          name: 'scheduleProject',
          params: {
            'project': _i1.ParameterDescription(
              name: 'project',
              type: _i1.getType<_i18.Project>(),
              nullable: false,
            ),
            'dateTime': _i1.ParameterDescription(
              name: 'dateTime',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['project'] as _i9.ProjectEndpoint).scheduleProject(
            session,
            params['project'],
            params['dateTime'],
          ),
        ),
        'getProjects': _i1.MethodConnector(
          name: 'getProjects',
          params: {
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'page': _i1.ParameterDescription(
              name: 'page',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['project'] as _i9.ProjectEndpoint).getProjects(
            session,
            limit: params['limit'],
            page: params['page'],
          ),
        ),
        'getProjectReviews': _i1.MethodConnector(
          name: 'getProjectReviews',
          params: {
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'page': _i1.ParameterDescription(
              name: 'page',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['project'] as _i9.ProjectEndpoint).getProjectReviews(
            session,
            limit: params['limit'],
            page: params['page'],
          ),
        ),
        'deleteProject': _i1.MethodConnector(
          name: 'deleteProject',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['project'] as _i9.ProjectEndpoint).deleteProject(
            session,
            params['id'],
          ),
        ),
        'updateCount': _i1.MethodConnector(
          name: 'updateCount',
          params: {
            'projectId': _i1.ParameterDescription(
              name: 'projectId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'field': _i1.ParameterDescription(
              name: 'field',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'isAdding': _i1.ParameterDescription(
              name: 'isAdding',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['project'] as _i9.ProjectEndpoint).updateCount(
            session,
            params['projectId'],
            params['userId'],
            params['field'],
            params['isAdding'],
          ),
        ),
        'getUserLikedProjects': _i1.MethodConnector(
          name: 'getUserLikedProjects',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['project'] as _i9.ProjectEndpoint)
                  .getUserLikedProjects(session),
        ),
        'toggleLike': _i1.MethodConnector(
          name: 'toggleLike',
          params: {
            'projectId': _i1.ParameterDescription(
              name: 'projectId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['project'] as _i9.ProjectEndpoint).toggleLike(
            session,
            params['projectId'],
          ),
        ),
        'authUser': _i1.MethodConnector(
          name: 'authUser',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['project'] as _i9.ProjectEndpoint).authUser(session),
        ),
        'validateProjectOwnership': _i1.MethodConnector(
          name: 'validateProjectOwnership',
          params: {
            'projectId': _i1.ParameterDescription(
              name: 'projectId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'user': _i1.ParameterDescription(
              name: 'user',
              type: _i1.getType<_i16.UserRecord>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['project'] as _i9.ProjectEndpoint)
                  .validateProjectOwnership(
            session,
            params['projectId'],
            params['user'],
          ),
        ),
        'validateProjectReviewOwnership': _i1.MethodConnector(
          name: 'validateProjectReviewOwnership',
          params: {
            'projectReviewId': _i1.ParameterDescription(
              name: 'projectReviewId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'user': _i1.ParameterDescription(
              name: 'user',
              type: _i1.getType<_i16.UserRecord>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['project'] as _i9.ProjectEndpoint)
                  .validateProjectReviewOwnership(
            session,
            params['projectReviewId'],
            params['user'],
          ),
        ),
      },
    );
    connectors['sendEmail'] = _i1.EndpointConnector(
      name: 'sendEmail',
      endpoint: endpoints['sendEmail']!,
      methodConnectors: {
        'sendEmail': _i1.MethodConnector(
          name: 'sendEmail',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'code': _i1.ParameterDescription(
              name: 'code',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'text': _i1.ParameterDescription(
              name: 'text',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'username': _i1.ParameterDescription(
              name: 'username',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'isEmailVerification': _i1.ParameterDescription(
              name: 'isEmailVerification',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['sendEmail'] as _i10.SendEmailEndpoint).sendEmail(
            session,
            params['email'],
            params['code'],
            params['text'],
            params['username'],
            params['isEmailVerification'],
          ),
        )
      },
    );
    connectors['userNin'] = _i1.EndpointConnector(
      name: 'userNin',
      endpoint: endpoints['userNin']!,
      methodConnectors: {
        'getNinDetails': _i1.MethodConnector(
          name: 'getNinDetails',
          params: {
            'ninNumber': _i1.ParameterDescription(
              name: 'ninNumber',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['userNin'] as _i11.UserNinEndpoint).getNinDetails(
            session,
            params['ninNumber'],
          ),
        )
      },
    );
    connectors['userRecord'] = _i1.EndpointConnector(
      name: 'userRecord',
      endpoint: endpoints['userRecord']!,
      methodConnectors: {
        'saveUser': _i1.MethodConnector(
          name: 'saveUser',
          params: {
            'userRecord': _i1.ParameterDescription(
              name: 'userRecord',
              type: _i1.getType<_i16.UserRecord>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['userRecord'] as _i12.UserRecordEndpoint).saveUser(
            session,
            params['userRecord'],
          ),
        ),
        'getUser': _i1.MethodConnector(
          name: 'getUser',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['userRecord'] as _i12.UserRecordEndpoint)
                  .getUser(session),
        ),
        'checkIfNewUser': _i1.MethodConnector(
          name: 'checkIfNewUser',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['userRecord'] as _i12.UserRecordEndpoint)
                  .checkIfNewUser(
            session,
            params['email'],
          ),
        ),
        'fetchUsernames': _i1.MethodConnector(
          name: 'fetchUsernames',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['userRecord'] as _i12.UserRecordEndpoint)
                  .fetchUsernames(session),
        ),
        'getUsers': _i1.MethodConnector(
          name: 'getUsers',
          params: {
            'query': _i1.ParameterDescription(
              name: 'query',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'page': _i1.ParameterDescription(
              name: 'page',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['userRecord'] as _i12.UserRecordEndpoint).getUsers(
            session,
            query: params['query'],
            limit: params['limit'],
            page: params['page'],
          ),
        ),
        'mentionUsers': _i1.MethodConnector(
          name: 'mentionUsers',
          params: {
            'query': _i1.ParameterDescription(
              name: 'query',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['userRecord'] as _i12.UserRecordEndpoint).mentionUsers(
            session,
            query: params['query'],
            limit: params['limit'],
          ),
        ),
        'followUnfollowUser': _i1.MethodConnector(
          name: 'followUnfollowUser',
          params: {
            'followedUserId': _i1.ParameterDescription(
              name: 'followedUserId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['userRecord'] as _i12.UserRecordEndpoint)
                  .followUnfollowUser(
            session,
            params['followedUserId'],
          ),
        ),
      },
    );
    modules['serverpod_auth'] = _i20.Endpoints()..initializeEndpoints(server);
  }
}
