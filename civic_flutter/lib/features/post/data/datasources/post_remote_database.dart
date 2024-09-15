import 'dart:async';
import 'dart:io';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/device/device_utility.dart';
import 'package:civic_flutter/core/errors/exceptions.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

abstract class PostRemoteDatabase {
  Future<Post?> save({required Post post});
  Future<PostList> listPost({
    required int page,
    required int limit,
  });
  Future<Post?> retrieve({
    required int id,
  });
  Future<List<UserRecord>> tagUsers();
  Future<List<UserRecord>> searchUsersToTag({
    required String query,
  });
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
  Future<Post?> save({
    required Post post,
  }) async {
    try {
      final isConnected = await TDeviceUtils.hasInternetConnection();
      if (!isConnected) {
        throw const ServerException(
          message: 'You are not connected to the internet.',
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
    } on UserException catch (e) {
      throw ServerException(message: e.message);
    } on PostException catch (e) {
      throw ServerException(message: e.message);
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

  @override
  Future<PostList> listPost({
    required int page,
    required int limit,
  }) async {
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
      final result = _client.post.listPost(
        limit: limit,
        page: page,
      );
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

  @override
  Future<Post?> retrieve({required int id}) async {
    try {
      final isConnected = await TDeviceUtils.hasInternetConnection();
      if (!isConnected) {
        throw const ServerException(
          message: 'You are not connected to the internet.',
        );
      }
      final result = _client.post.retrieve(
        id,
      );
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

  @override
  Future<List<UserRecord>> tagUsers() async {
    try {
      final isConnected = await TDeviceUtils.hasInternetConnection();
      if (!isConnected) {
        throw const ServerException(
          message: 'You are not connected to the internet.',
        );
      }
      final result = _client.post.tagUsers();
      return result;
    } on UserException catch (e) {
      throw ServerException(
        message: e.message,
      );
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

  @override
  Future<List<UserRecord>> searchUsersToTag({
    required String query,
  }) async {
    try {
      final isConnected = await TDeviceUtils.hasInternetConnection();
      if (!isConnected) {
        throw const ServerException(
          message: 'You are not connected to the internet.',
        );
      }
      final result = await _client.post.searchUsers(query);
      return result;
    } on UserException catch (e) {
      throw ServerException(
        message: e.message,
      );
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

  Future<void> saveInFuture({
    required Post post,
    required DateTime dateTime,
  }) async {
    try {
      final isConnected = await TDeviceUtils.hasInternetConnection();
      if (!isConnected) {
        throw const ServerException(
          message: 'You are not connected to the internet.',
        );
      }
      await _client.post.sendInFuture(
        post,
        dateTime,
      );
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }
}
