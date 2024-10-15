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
import '../endpoints/poll_endpoint.dart' as _i5;
import '../endpoints/post_endpoint.dart' as _i6;
import '../endpoints/user_nin_endpoint.dart' as _i7;
import '../endpoints/user_record_endpoint.dart' as _i8;
import 'package:civic_server/src/generated/poll/poll.dart' as _i9;
import 'package:civic_server/src/generated/post/post.dart' as _i10;
import 'package:civic_server/src/generated/user/user_record.dart' as _i11;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i12;

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
      'poll': _i5.PollEndpoint()
        ..initialize(
          server,
          'poll',
          null,
        ),
      'post': _i6.PostEndpoint()
        ..initialize(
          server,
          'post',
          null,
        ),
      'userNin': _i7.UserNinEndpoint()
        ..initialize(
          server,
          'userNin',
          null,
        ),
      'userRecord': _i8.UserRecordEndpoint()
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
        'sendHashTags': _i1.MethodConnector(
          name: 'sendHashTags',
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
              (endpoints['hashtag'] as _i3.HashtagEndpoint).sendHashTags(
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
              (endpoints['hashtag'] as _i3.HashtagEndpoint).sendPollHashtags(
            session,
            params['tags'],
            params['pollId'],
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
        'searchNearbyPlaces': _i1.MethodConnector(
          name: 'searchNearbyPlaces',
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
                  .searchNearbyPlaces(
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
        'save': _i1.MethodConnector(
          name: 'save',
          params: {
            'poll': _i1.ParameterDescription(
              name: 'poll',
              type: _i1.getType<_i9.Poll>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['poll'] as _i5.PollEndpoint).save(
            session,
            params['poll'],
          ),
        ),
        'sendInFuture': _i1.MethodConnector(
          name: 'sendInFuture',
          params: {
            'poll': _i1.ParameterDescription(
              name: 'poll',
              type: _i1.getType<_i9.Poll>(),
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
              (endpoints['poll'] as _i5.PollEndpoint).sendInFuture(
            session,
            params['poll'],
            params['dateTime'],
          ),
        ),
        'retrieve': _i1.MethodConnector(
          name: 'retrieve',
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
              (endpoints['poll'] as _i5.PollEndpoint).retrieve(
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
              (endpoints['poll'] as _i5.PollEndpoint).castVote(
            session,
            params['pollId'],
            params['optionId'],
          ),
        ),
      },
    );
    connectors['post'] = _i1.EndpointConnector(
      name: 'post',
      endpoint: endpoints['post']!,
      methodConnectors: {
        'save': _i1.MethodConnector(
          name: 'save',
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
              (endpoints['post'] as _i6.PostEndpoint).save(
            session,
            params['post'],
          ),
        ),
        'sendInFuture': _i1.MethodConnector(
          name: 'sendInFuture',
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
              (endpoints['post'] as _i6.PostEndpoint).sendInFuture(
            session,
            params['post'],
            params['dateTime'],
          ),
        ),
        'retrieve': _i1.MethodConnector(
          name: 'retrieve',
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
              (endpoints['post'] as _i6.PostEndpoint).retrieve(
            session,
            params['id'],
          ),
        ),
        'listPost': _i1.MethodConnector(
          name: 'listPost',
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
              (endpoints['post'] as _i6.PostEndpoint).listPost(
            session,
            limit: params['limit'],
            page: params['page'],
          ),
        ),
      },
    );
    connectors['userNin'] = _i1.EndpointConnector(
      name: 'userNin',
      endpoint: endpoints['userNin']!,
      methodConnectors: {
        'findNinDetails': _i1.MethodConnector(
          name: 'findNinDetails',
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
              (endpoints['userNin'] as _i7.UserNinEndpoint).findNinDetails(
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
        'saveUserRecord': _i1.MethodConnector(
          name: 'saveUserRecord',
          params: {
            'userRecord': _i1.ParameterDescription(
              name: 'userRecord',
              type: _i1.getType<_i11.UserRecord>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['userRecord'] as _i8.UserRecordEndpoint)
                  .saveUserRecord(
            session,
            params['userRecord'],
          ),
        ),
        'me': _i1.MethodConnector(
          name: 'me',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['userRecord'] as _i8.UserRecordEndpoint).me(session),
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
              (endpoints['userRecord'] as _i8.UserRecordEndpoint)
                  .checkIfNewUser(
            session,
            params['email'],
          ),
        ),
        'fetchAllUsernames': _i1.MethodConnector(
          name: 'fetchAllUsernames',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['userRecord'] as _i8.UserRecordEndpoint)
                  .fetchAllUsernames(session),
        ),
        'listUsers': _i1.MethodConnector(
          name: 'listUsers',
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
              (endpoints['userRecord'] as _i8.UserRecordEndpoint).listUsers(
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
              (endpoints['userRecord'] as _i8.UserRecordEndpoint).mentionUsers(
            session,
            query: params['query'],
            limit: params['limit'],
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
              (endpoints['userRecord'] as _i8.UserRecordEndpoint).fetchHashtags(
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
              (endpoints['userRecord'] as _i8.UserRecordEndpoint)
                  .followUnfollowUser(
            session,
            params['followedUserId'],
          ),
        ),
      },
    );
    modules['serverpod_auth'] = _i12.Endpoints()..initializeEndpoints(server);
  }
}
