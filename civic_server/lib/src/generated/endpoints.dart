/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/example_endpoint.dart' as _i2;
import '../endpoints/post_endpoint.dart' as _i3;
import '../endpoints/user_nin_endpoint.dart' as _i4;
import '../endpoints/user_record_endpoint.dart' as _i5;
import 'package:civic_server/src/generated/create_post.dart' as _i6;
import 'package:civic_server/src/generated/user_record.dart' as _i7;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i8;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'example': _i2.ExampleEndpoint()
        ..initialize(
          server,
          'example',
          null,
        ),
      'post': _i3.PostEndpoint()
        ..initialize(
          server,
          'post',
          null,
        ),
      'userNin': _i4.UserNinEndpoint()
        ..initialize(
          server,
          'userNin',
          null,
        ),
      'userRecord': _i5.UserRecordEndpoint()
        ..initialize(
          server,
          'userRecord',
          null,
        ),
    };
    connectors['example'] = _i1.EndpointConnector(
      name: 'example',
      endpoint: endpoints['example']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['example'] as _i2.ExampleEndpoint).hello(
            session,
            params['name'],
          ),
        )
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
              type: _i1.getType<_i6.Post>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['post'] as _i3.PostEndpoint).save(
            session,
            params['post'],
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
              (endpoints['post'] as _i3.PostEndpoint).listPost(
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
              (endpoints['userNin'] as _i4.UserNinEndpoint).findNinDetails(
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
              type: _i1.getType<_i7.UserRecord>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['userRecord'] as _i5.UserRecordEndpoint)
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
              (endpoints['userRecord'] as _i5.UserRecordEndpoint).me(session),
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
              (endpoints['userRecord'] as _i5.UserRecordEndpoint)
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
              (endpoints['userRecord'] as _i5.UserRecordEndpoint)
                  .fetchAllUsernames(session),
        ),
      },
    );
    modules['serverpod_auth'] = _i8.Endpoints()..initializeEndpoints(server);
  }
}
