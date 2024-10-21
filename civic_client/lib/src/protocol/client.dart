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
import 'package:civic_client/src/protocol/general/aws_places.dart' as _i3;
import 'package:civic_client/src/protocol/poll/poll.dart' as _i4;
import 'package:civic_client/src/protocol/post/post.dart' as _i5;
import 'package:civic_client/src/protocol/post/post_list.dart' as _i6;
import 'package:civic_client/src/protocol/user/user_nin_record.dart' as _i7;
import 'package:civic_client/src/protocol/user/user_record.dart' as _i8;
import 'package:civic_client/src/protocol/user/users_list.dart' as _i9;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i10;
import 'protocol.dart' as _i11;

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

  _i2.Future<void> sendHashTags(
    List<String> tags,
    int postId,
  ) =>
      caller.callServerEndpoint<void>(
        'hashtag',
        'sendHashTags',
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

  _i2.Future<List<_i3.AWSPlaces>> searchNearbyPlaces(List<double> position) =>
      caller.callServerEndpoint<List<_i3.AWSPlaces>>(
        'location',
        'searchNearbyPlaces',
        {'position': position},
      );
}

/// {@category Endpoint}
class EndpointPoll extends _i1.EndpointRef {
  EndpointPoll(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'poll';

  _i2.Future<_i4.Poll?> save(_i4.Poll poll) =>
      caller.callServerEndpoint<_i4.Poll?>(
        'poll',
        'save',
        {'poll': poll},
      );

  _i2.Future<void> sendInFuture(
    _i4.Poll poll,
    DateTime dateTime,
  ) =>
      caller.callServerEndpoint<void>(
        'poll',
        'sendInFuture',
        {
          'poll': poll,
          'dateTime': dateTime,
        },
      );

  _i2.Future<_i4.Poll?> retrieve(int pollId) =>
      caller.callServerEndpoint<_i4.Poll?>(
        'poll',
        'retrieve',
        {'pollId': pollId},
      );

  _i2.Future<void> castVote(
    int pollId,
    int optionId,
  ) =>
      caller.callServerEndpoint<void>(
        'poll',
        'castVote',
        {
          'pollId': pollId,
          'optionId': optionId,
        },
      );
}

/// {@category Endpoint}
class EndpointPost extends _i1.EndpointRef {
  EndpointPost(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'post';

  _i2.Future<_i5.Post?> save(_i5.Post post) =>
      caller.callServerEndpoint<_i5.Post?>(
        'post',
        'save',
        {'post': post},
      );

  _i2.Future<void> sendInFuture(
    _i5.Post post,
    DateTime dateTime,
  ) =>
      caller.callServerEndpoint<void>(
        'post',
        'sendInFuture',
        {
          'post': post,
          'dateTime': dateTime,
        },
      );

  _i2.Future<_i5.Post?> retrieve(int id) =>
      caller.callServerEndpoint<_i5.Post?>(
        'post',
        'retrieve',
        {'id': id},
      );

  _i2.Future<_i6.PostList> listPost({
    required int limit,
    required int page,
  }) =>
      caller.callServerEndpoint<_i6.PostList>(
        'post',
        'listPost',
        {
          'limit': limit,
          'page': page,
        },
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

  _i2.Future<_i7.UserNinRecord?> findNinDetails(String ninNumber) =>
      caller.callServerEndpoint<_i7.UserNinRecord?>(
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

  _i2.Future<void> saveUserRecord(_i8.UserRecord userRecord) =>
      caller.callServerEndpoint<void>(
        'userRecord',
        'saveUserRecord',
        {'userRecord': userRecord},
      );

  _i2.Future<_i8.UserRecord?> me() =>
      caller.callServerEndpoint<_i8.UserRecord?>(
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

  _i2.Future<_i9.UsersList> listUsers({
    required String query,
    required int limit,
    required int page,
  }) =>
      caller.callServerEndpoint<_i9.UsersList>(
        'userRecord',
        'listUsers',
        {
          'query': query,
          'limit': limit,
          'page': page,
        },
      );

  _i2.Future<List<_i8.UserRecord>> mentionUsers({
    required String query,
    required int limit,
  }) =>
      caller.callServerEndpoint<List<_i8.UserRecord>>(
        'userRecord',
        'mentionUsers',
        {
          'query': query,
          'limit': limit,
        },
      );

  _i2.Future<List<String>> fetchHashtags({
    required String query,
    required int limit,
  }) =>
      caller.callServerEndpoint<List<String>>(
        'userRecord',
        'fetchHashtags',
        {
          'query': query,
          'limit': limit,
        },
      );

  _i2.Future<void> followUnfollowUser(int followedUserId) =>
      caller.callServerEndpoint<void>(
        'userRecord',
        'followUnfollowUser',
        {'followedUserId': followedUserId},
      );
}

class _Modules {
  _Modules(Client client) {
    auth = _i10.Caller(client);
  }

  late final _i10.Caller auth;
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
          _i11.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
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
    poll = EndpointPoll(this);
    post = EndpointPost(this);
    sendEmail = EndpointSendEmail(this);
    userNin = EndpointUserNin(this);
    userRecord = EndpointUserRecord(this);
    modules = _Modules(this);
  }

  late final EndpointAssets assets;

  late final EndpointHashtag hashtag;

  late final EndpointLocation location;

  late final EndpointPoll poll;

  late final EndpointPost post;

  late final EndpointSendEmail sendEmail;

  late final EndpointUserNin userNin;

  late final EndpointUserRecord userRecord;

  late final _Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'assets': assets,
        'hashtag': hashtag,
        'location': location,
        'poll': poll,
        'post': post,
        'sendEmail': sendEmail,
        'userNin': userNin,
        'userRecord': userRecord,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
