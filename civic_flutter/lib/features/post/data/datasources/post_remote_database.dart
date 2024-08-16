import 'dart:async';
import 'dart:io';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/device/device_utility.dart';
import 'package:civic_flutter/core/errors/exceptions.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

abstract class PostRemoteDatabase {
  Future<Post?> save({required Post post});
}

class PostRemoteDatabaseImpl implements PostRemoteDatabase {
  PostRemoteDatabaseImpl({
    required Client client,
    required SessionManager sessionManager,
  })  : _client = client,
        _sessionManager = sessionManager;

  final Client _client;
  final SessionManager _sessionManager;
  @override
  Future<Post?> save({required Post post}) async {
    try {
      final isConnected = await TDeviceUtils.hasInternetConnection();
      if (!isConnected) {
        throw const ServerException(
          message: 'You are not connected to the internet.',
        );
      }
      if (!_sessionManager.isSignedIn) {
        throw const ServerException(
          message: 'You must be signed in to continue.',
        );
      }
      final result = await _client.post
          .save(
            post,
          )
          .timeout(
            const Duration(
              seconds: 60,
            ),
          );

      if (result == null) {
        return null;
      }
      return result;
    } on TimeoutException catch (_) {
      throw const ServerException(message: 'Request timed out');
    } on SocketException catch (_) {
      throw const ServerException(message: 'Failed to connect to server');
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }
}
