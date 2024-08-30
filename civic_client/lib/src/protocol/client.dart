/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:civic_client/src/protocol/create_post.dart' as _i3;
import 'package:civic_client/src/protocol/post_list.dart' as _i4;
import 'package:civic_client/src/protocol/user_nin_record.dart' as _i5;
import 'package:civic_client/src/protocol/user_record.dart' as _i6;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i7;
import 'protocol.dart' as _i8;

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
class EndpointExample extends _i1.EndpointRef {
  EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
      );
}

/// {@category Endpoint}
class EndpointPost extends _i1.EndpointRef {
  EndpointPost(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'post';

  _i2.Future<_i3.Post?> save(_i3.Post post) =>
      caller.callServerEndpoint<_i3.Post?>(
        'post',
        'save',
        {'post': post},
      );

  _i2.Future<_i3.Post?> retrieve(int id) =>
      caller.callServerEndpoint<_i3.Post?>(
        'post',
        'retrieve',
        {'id': id},
      );

  _i2.Future<_i4.PostList> listPost({
    required int limit,
    required int page,
  }) =>
      caller.callServerEndpoint<_i4.PostList>(
        'post',
        'listPost',
        {
          'limit': limit,
          'page': page,
        },
      );
}

/// {@category Endpoint}
class EndpointUserNin extends _i1.EndpointRef {
  EndpointUserNin(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'userNin';

  _i2.Future<_i5.UserNinRecord?> findNinDetails(String ninNumber) =>
      caller.callServerEndpoint<_i5.UserNinRecord?>(
        'userNin',
        'findNinDetails',
        {'ninNumber': ninNumber},
      );
}

/// {@category Endpoint}
class EndpointUserRecord extends _i1.EndpointRef {
  EndpointUserRecord(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'userRecord';

  _i2.Future<void> saveUserRecord(_i6.UserRecord userRecord) =>
      caller.callServerEndpoint<void>(
        'userRecord',
        'saveUserRecord',
        {'userRecord': userRecord},
      );

  _i2.Future<_i6.UserRecord?> me() =>
      caller.callServerEndpoint<_i6.UserRecord?>(
        'userRecord',
        'me',
        {},
      );

  _i2.Future<String?> checkIfNewUser(String email) =>
      caller.callServerEndpoint<String?>(
        'userRecord',
        'checkIfNewUser',
        {'email': email},
      );

  _i2.Future<List<String>> fetchAllUsernames() =>
      caller.callServerEndpoint<List<String>>(
        'userRecord',
        'fetchAllUsernames',
        {},
      );
}

class _Modules {
  _Modules(Client client) {
    auth = _i7.Caller(client);
  }

  late final _i7.Caller auth;
}

class Client extends _i1.ServerpodClient {
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
  }) : super(
          host,
          _i8.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
        ) {
    assets = EndpointAssets(this);
    example = EndpointExample(this);
    post = EndpointPost(this);
    userNin = EndpointUserNin(this);
    userRecord = EndpointUserRecord(this);
    modules = _Modules(this);
  }

  late final EndpointAssets assets;

  late final EndpointExample example;

  late final EndpointPost post;

  late final EndpointUserNin userNin;

  late final EndpointUserRecord userRecord;

  late final _Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'assets': assets,
        'example': example,
        'post': post,
        'userNin': userNin,
        'userRecord': userRecord,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
