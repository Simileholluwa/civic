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
import '../endpoints/assets_endpoint.dart' as _i2;
import '../endpoints/hashtag_endpoint.dart' as _i3;
import '../endpoints/location_endpoint.dart' as _i4;
import '../endpoints/notification_endpoint.dart' as _i5;
import '../endpoints/post_endpoint.dart' as _i6;
import '../endpoints/project_endpoint.dart' as _i7;
import '../endpoints/send_email_endpoint.dart' as _i8;
import '../endpoints/user_record_endpoint.dart' as _i9;
import 'package:civic_server/src/generated/post/post.dart' as _i10;
import 'package:civic_server/src/generated/project/project.dart' as _i11;
import 'package:civic_server/src/generated/project/project_review.dart' as _i12;
import 'package:civic_server/src/generated/project/project_vetting.dart'
    as _i13;
import 'package:civic_server/src/generated/user/user_record.dart' as _i14;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i15;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'assets': _i2.AssetsEndpoint()
        ..initialize(
          server,
          'assets',
          null,
        ),
      'hashtag': _i3.HashtagEndpoint()
        ..initialize(
          server,
          'hashtag',
          null,
        ),
      'location': _i4.LocationEndpoint()
        ..initialize(
          server,
          'location',
          null,
        ),
      'notification': _i5.NotificationEndpoint()
        ..initialize(
          server,
          'notification',
          null,
        ),
      'post': _i6.PostEndpoint()
        ..initialize(
          server,
          'post',
          null,
        ),
      'project': _i7.ProjectEndpoint()
        ..initialize(
          server,
          'project',
          null,
        ),
      'sendEmail': _i8.SendEmailEndpoint()
        ..initialize(
          server,
          'sendEmail',
          null,
        ),
      'userRecord': _i9.UserRecordEndpoint()
        ..initialize(
          server,
          'userRecord',
          null,
        ),
    };
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
              (endpoints['assets'] as _i2.AssetsEndpoint).getUploadDescription(
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
              (endpoints['assets'] as _i2.AssetsEndpoint).verifyUpload(
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
              (endpoints['hashtag'] as _i3.HashtagEndpoint).sendPostHashtags(
            session,
            params['tags'],
            params['postId'],
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
              (endpoints['hashtag'] as _i3.HashtagEndpoint).fetchHashtags(
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
              (endpoints['location'] as _i4.LocationEndpoint).searchLocation(
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
              (endpoints['location'] as _i4.LocationEndpoint)
                  .searchNearbyLocation(
            session,
            params['position'],
          ),
        ),
      },
    );
    connectors['notification'] = _i1.EndpointConnector(
      name: 'notification',
      endpoint: endpoints['notification']!,
      methodConnectors: {
        'markNotificationAsRead': _i1.MethodConnector(
          name: 'markNotificationAsRead',
          params: {
            'notificationId': _i1.ParameterDescription(
              name: 'notificationId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['notification'] as _i5.NotificationEndpoint)
                  .markNotificationAsRead(
            session,
            params['notificationId'],
          ),
        ),
        'markAllNotificationsAsRead': _i1.MethodConnector(
          name: 'markAllNotificationsAsRead',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['notification'] as _i5.NotificationEndpoint)
                  .markAllNotificationsAsRead(session),
        ),
        'deleteNotification': _i1.MethodConnector(
          name: 'deleteNotification',
          params: {
            'notificationId': _i1.ParameterDescription(
              name: 'notificationId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['notification'] as _i5.NotificationEndpoint)
                  .deleteNotification(
            session,
            params['notificationId'],
          ),
        ),
        'deleteAllNotifications': _i1.MethodConnector(
          name: 'deleteAllNotifications',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['notification'] as _i5.NotificationEndpoint)
                  .deleteAllNotifications(session),
        ),
        'getUnreadNotificationCount': _i1.MethodConnector(
          name: 'getUnreadNotificationCount',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['notification'] as _i5.NotificationEndpoint)
                  .getUnreadNotificationCount(session),
        ),
        'getNotifications': _i1.MethodConnector(
          name: 'getNotifications',
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
            'targetType': _i1.ParameterDescription(
              name: 'targetType',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'isRead': _i1.ParameterDescription(
              name: 'isRead',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['notification'] as _i5.NotificationEndpoint)
                  .getNotifications(
            session,
            limit: params['limit'],
            page: params['page'],
            targetType: params['targetType'],
            isRead: params['isRead'],
          ),
        ),
        'notificationUpdates': _i1.MethodStreamConnector(
          name: 'notificationUpdates',
          params: {
            'notificationId': _i1.ParameterDescription(
              name: 'notificationId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['notification'] as _i5.NotificationEndpoint)
                  .notificationUpdates(
            session,
            params['notificationId'],
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
              type: _i1.getType<_i10.Post>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['post'] as _i6.PostEndpoint).savePost(
            session,
            params['post'],
          ),
        ),
        'savePoll': _i1.MethodConnector(
          name: 'savePoll',
          params: {
            'post': _i1.ParameterDescription(
              name: 'post',
              type: _i1.getType<_i10.Post>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['post'] as _i6.PostEndpoint).savePoll(
            session,
            params['post'],
          ),
        ),
        'saveArticle': _i1.MethodConnector(
          name: 'saveArticle',
          params: {
            'post': _i1.ParameterDescription(
              name: 'post',
              type: _i1.getType<_i10.Post>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['post'] as _i6.PostEndpoint).saveArticle(
            session,
            params['post'],
          ),
        ),
        'castVote': _i1.MethodConnector(
          name: 'castVote',
          params: {
            'postId': _i1.ParameterDescription(
              name: 'postId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'optionId': _i1.ParameterDescription(
              name: 'optionId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['post'] as _i6.PostEndpoint).castVote(
            session,
            params['postId'],
            params['optionId'],
          ),
        ),
        'clearVote': _i1.MethodConnector(
          name: 'clearVote',
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
              (endpoints['post'] as _i6.PostEndpoint).clearVote(
            session,
            params['pollId'],
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
              (endpoints['post'] as _i6.PostEndpoint).getPolls(
            session,
            limit: params['limit'],
            page: params['page'],
          ),
        ),
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
              (endpoints['post'] as _i6.PostEndpoint).getArticles(
            session,
            limit: params['limit'],
            page: params['page'],
          ),
        ),
        'savePostComment': _i1.MethodConnector(
          name: 'savePostComment',
          params: {
            'comment': _i1.ParameterDescription(
              name: 'comment',
              type: _i1.getType<_i10.Post>(),
              nullable: false,
            ),
            'isReply': _i1.ParameterDescription(
              name: 'isReply',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['post'] as _i6.PostEndpoint).savePostComment(
            session,
            params['comment'],
            params['isReply'],
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
              (endpoints['post'] as _i6.PostEndpoint).getPostComments(
            session,
            params['postId'],
            limit: params['limit'],
            page: params['page'],
          ),
        ),
        'getComment': _i1.MethodConnector(
          name: 'getComment',
          params: {
            'commentId': _i1.ParameterDescription(
              name: 'commentId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'isComment': _i1.ParameterDescription(
              name: 'isComment',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['post'] as _i6.PostEndpoint).getComment(
            session,
            params['commentId'],
            params['isComment'],
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
              (endpoints['post'] as _i6.PostEndpoint).getPostCommentReplies(
            session,
            params['commentId'],
            limit: params['limit'],
            page: params['page'],
          ),
        ),
        'schedulePost': _i1.MethodConnector(
          name: 'schedulePost',
          params: {
            'post': _i1.ParameterDescription(
              name: 'post',
              type: _i1.getType<_i10.Post>(),
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
              (endpoints['post'] as _i6.PostEndpoint).schedulePost(
            session,
            params['post'],
            params['dateTime'],
          ),
        ),
        'getRootPost': _i1.MethodConnector(
          name: 'getRootPost',
          params: {
            'post': _i1.ParameterDescription(
              name: 'post',
              type: _i1.getType<_i10.Post>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['post'] as _i6.PostEndpoint).getRootPost(
            session,
            params['post'],
          ),
        ),
        'quoteProject': _i1.MethodConnector(
          name: 'quoteProject',
          params: {
            'projectId': _i1.ParameterDescription(
              name: 'projectId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'quoteContent': _i1.ParameterDescription(
              name: 'quoteContent',
              type: _i1.getType<_i10.Post>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['post'] as _i6.PostEndpoint).quoteProject(
            session,
            params['projectId'],
            params['quoteContent'],
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
              (endpoints['post'] as _i6.PostEndpoint).getPost(
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
              (endpoints['post'] as _i6.PostEndpoint).getPosts(
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
              (endpoints['post'] as _i6.PostEndpoint).deletePost(
            session,
            params['id'],
          ),
        ),
        'clearBookmarks': _i1.MethodConnector(
          name: 'clearBookmarks',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['post'] as _i6.PostEndpoint).clearBookmarks(session),
        ),
        'toggleBookmark': _i1.MethodConnector(
          name: 'toggleBookmark',
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
              (endpoints['post'] as _i6.PostEndpoint).toggleBookmark(
            session,
            params['postId'],
          ),
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
              (endpoints['post'] as _i6.PostEndpoint).toggleLike(
            session,
            params['postId'],
          ),
        ),
        'subscribeToPost': _i1.MethodConnector(
          name: 'subscribeToPost',
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
              (endpoints['post'] as _i6.PostEndpoint).subscribeToPost(
            session,
            params['postId'],
          ),
        ),
        'getUserPostBookmarks': _i1.MethodConnector(
          name: 'getUserPostBookmarks',
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
              (endpoints['post'] as _i6.PostEndpoint).getUserPostBookmarks(
            session,
            limit: params['limit'],
            page: params['page'],
          ),
        ),
        'markNotInterested': _i1.MethodConnector(
          name: 'markNotInterested',
          params: {
            'postId': _i1.ParameterDescription(
              name: 'postId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'reason': _i1.ParameterDescription(
              name: 'reason',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['post'] as _i6.PostEndpoint).markNotInterested(
            session,
            params['postId'],
            params['reason'],
          ),
        ),
        'postUpdates': _i1.MethodStreamConnector(
          name: 'postUpdates',
          params: {
            'postId': _i1.ParameterDescription(
              name: 'postId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['post'] as _i6.PostEndpoint).postUpdates(
            session,
            params['postId'],
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
              (endpoints['project'] as _i7.ProjectEndpoint).getProject(
            session,
            params['projectId'],
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
              (endpoints['project'] as _i7.ProjectEndpoint).getProjectReview(
            session,
            params['projectId'],
          ),
        ),
        'saveProject': _i1.MethodConnector(
          name: 'saveProject',
          params: {
            'project': _i1.ParameterDescription(
              name: 'project',
              type: _i1.getType<_i11.Project>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['project'] as _i7.ProjectEndpoint).saveProject(
            session,
            params['project'],
          ),
        ),
        'saveProjectReview': _i1.MethodConnector(
          name: 'saveProjectReview',
          params: {
            'projectReview': _i1.ParameterDescription(
              name: 'projectReview',
              type: _i1.getType<_i12.ProjectReview>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['project'] as _i7.ProjectEndpoint).saveProjectReview(
            session,
            params['projectReview'],
          ),
        ),
        'deleteProjectReview': _i1.MethodConnector(
          name: 'deleteProjectReview',
          params: {
            'reviewId': _i1.ParameterDescription(
              name: 'reviewId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['project'] as _i7.ProjectEndpoint).deleteProjectReview(
            session,
            params['reviewId'],
          ),
        ),
        'deleteProjectVetting': _i1.MethodConnector(
          name: 'deleteProjectVetting',
          params: {
            'vettingId': _i1.ParameterDescription(
              name: 'vettingId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['project'] as _i7.ProjectEndpoint)
                  .deleteProjectVetting(
            session,
            params['vettingId'],
          ),
        ),
        'scheduleProject': _i1.MethodConnector(
          name: 'scheduleProject',
          params: {
            'project': _i1.ParameterDescription(
              name: 'project',
              type: _i1.getType<_i11.Project>(),
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
              (endpoints['project'] as _i7.ProjectEndpoint).scheduleProject(
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
            'sortBy': _i1.ParameterDescription(
              name: 'sortBy',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['project'] as _i7.ProjectEndpoint).getProjects(
            session,
            limit: params['limit'],
            page: params['page'],
            sortBy: params['sortBy'],
          ),
        ),
        'getProjectReviews': _i1.MethodConnector(
          name: 'getProjectReviews',
          params: {
            'projectId': _i1.ParameterDescription(
              name: 'projectId',
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
            'rating': _i1.ParameterDescription(
              name: 'rating',
              type: _i1.getType<double?>(),
              nullable: true,
            ),
            'cardinal': _i1.ParameterDescription(
              name: 'cardinal',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['project'] as _i7.ProjectEndpoint).getProjectReviews(
            session,
            params['projectId'],
            limit: params['limit'],
            page: params['page'],
            rating: params['rating'],
            cardinal: params['cardinal'],
          ),
        ),
        'clearBookmarks': _i1.MethodConnector(
          name: 'clearBookmarks',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['project'] as _i7.ProjectEndpoint)
                  .clearBookmarks(session),
        ),
        'reactToReview': _i1.MethodConnector(
          name: 'reactToReview',
          params: {
            'reviewId': _i1.ParameterDescription(
              name: 'reviewId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'isLike': _i1.ParameterDescription(
              name: 'isLike',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['project'] as _i7.ProjectEndpoint).reactToReview(
            session,
            params['reviewId'],
            params['isLike'],
          ),
        ),
        'reactToVetting': _i1.MethodConnector(
          name: 'reactToVetting',
          params: {
            'vettingId': _i1.ParameterDescription(
              name: 'vettingId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'isLike': _i1.ParameterDescription(
              name: 'isLike',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['project'] as _i7.ProjectEndpoint).reactToVetting(
            session,
            params['vettingId'],
            params['isLike'],
          ),
        ),
        'deleteProject': _i1.MethodConnector(
          name: 'deleteProject',
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
              (endpoints['project'] as _i7.ProjectEndpoint).deleteProject(
            session,
            params['projectId'],
          ),
        ),
        'toggleBookmark': _i1.MethodConnector(
          name: 'toggleBookmark',
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
              (endpoints['project'] as _i7.ProjectEndpoint).toggleBookmark(
            session,
            params['projectId'],
          ),
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
              (endpoints['project'] as _i7.ProjectEndpoint).toggleLike(
            session,
            params['projectId'],
          ),
        ),
        'markNotInterested': _i1.MethodConnector(
          name: 'markNotInterested',
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
              (endpoints['project'] as _i7.ProjectEndpoint).markNotInterested(
            session,
            params['projectId'],
          ),
        ),
        'vetProject': _i1.MethodConnector(
          name: 'vetProject',
          params: {
            'projectVetting': _i1.ParameterDescription(
              name: 'projectVetting',
              type: _i1.getType<_i13.ProjectVetting>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['project'] as _i7.ProjectEndpoint).vetProject(
            session,
            params['projectVetting'],
          ),
        ),
        'getVettedProject': _i1.MethodConnector(
          name: 'getVettedProject',
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
              (endpoints['project'] as _i7.ProjectEndpoint).getVettedProject(
            session,
            params['projectId'],
          ),
        ),
        'getVettedProjects': _i1.MethodConnector(
          name: 'getVettedProjects',
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
              (endpoints['project'] as _i7.ProjectEndpoint).getVettedProjects(
            session,
            limit: params['limit'],
            page: params['page'],
          ),
        ),
        'getUserProjectBookmarks': _i1.MethodConnector(
          name: 'getUserProjectBookmarks',
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
              (endpoints['project'] as _i7.ProjectEndpoint)
                  .getUserProjectBookmarks(
            session,
            limit: params['limit'],
            page: params['page'],
          ),
        ),
        'subscribeToProject': _i1.MethodConnector(
          name: 'subscribeToProject',
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
              (endpoints['project'] as _i7.ProjectEndpoint).subscribeToProject(
            session,
            params['projectId'],
          ),
        ),
        'projectUpdates': _i1.MethodStreamConnector(
          name: 'projectUpdates',
          params: {
            'projectId': _i1.ParameterDescription(
              name: 'projectId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['project'] as _i7.ProjectEndpoint).projectUpdates(
            session,
            params['projectId'],
          ),
        ),
        'projectReviewUpdates': _i1.MethodStreamConnector(
          name: 'projectReviewUpdates',
          params: {
            'reviewId': _i1.ParameterDescription(
              name: 'reviewId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['project'] as _i7.ProjectEndpoint)
                  .projectReviewUpdates(
            session,
            params['reviewId'],
          ),
        ),
        'projectVettingUpdates': _i1.MethodStreamConnector(
          name: 'projectVettingUpdates',
          params: {
            'vettingId': _i1.ParameterDescription(
              name: 'vettingId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['project'] as _i7.ProjectEndpoint)
                  .projectVettingUpdates(
            session,
            params['vettingId'],
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
              (endpoints['sendEmail'] as _i8.SendEmailEndpoint).sendEmail(
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
    connectors['userRecord'] = _i1.EndpointConnector(
      name: 'userRecord',
      endpoint: endpoints['userRecord']!,
      methodConnectors: {
        'saveUser': _i1.MethodConnector(
          name: 'saveUser',
          params: {
            'userRecord': _i1.ParameterDescription(
              name: 'userRecord',
              type: _i1.getType<_i14.UserRecord>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['userRecord'] as _i9.UserRecordEndpoint).saveUser(
            session,
            params['userRecord'],
          ),
        ),
        'getUser': _i1.MethodConnector(
          name: 'getUser',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<String?>(),
              nullable: true,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['userRecord'] as _i9.UserRecordEndpoint).getUser(
            session,
            params['userId'],
          ),
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
              (endpoints['userRecord'] as _i9.UserRecordEndpoint)
                  .checkIfNewUser(
            session,
            params['email'],
          ),
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
              (endpoints['userRecord'] as _i9.UserRecordEndpoint).getUsers(
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
              (endpoints['userRecord'] as _i9.UserRecordEndpoint).mentionUsers(
            session,
            query: params['query'],
            limit: params['limit'],
          ),
        ),
        'followUnfollowUser': _i1.MethodConnector(
          name: 'followUnfollowUser',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['userRecord'] as _i9.UserRecordEndpoint)
                  .followUnfollowUser(
            session,
            params['userId'],
          ),
        ),
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
              (endpoints['userRecord'] as _i9.UserRecordEndpoint).getNinDetails(
            session,
            params['ninNumber'],
          ),
        ),
        'userUpdates': _i1.MethodStreamConnector(
          name: 'userUpdates',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['userRecord'] as _i9.UserRecordEndpoint).userUpdates(
            session,
            params['userId'],
          ),
        ),
      },
    );
    modules['serverpod_auth'] = _i15.Endpoints()..initializeEndpoints(server);
  }
}
