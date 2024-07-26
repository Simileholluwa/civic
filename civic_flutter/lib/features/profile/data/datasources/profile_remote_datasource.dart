import 'dart:async';
import 'dart:io';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/errors/exceptions.dart';

abstract class ProfileRemoteDatasource {
  Future<UserRecord> me();
}

class ProfileRemoteDatasourceImpl implements ProfileRemoteDatasource {

  ProfileRemoteDatasourceImpl({required Client client}) : _client = client;
  final Client _client;

  @override
  Future<UserRecord> me() async {
    try {
      final result = await _client.userRecord.me();
      if (result == null) {
        throw const ServerException(message: 'User not found');
      }
      return result;
    } on TimeoutException catch (_) {
      throw const ServerException(message: 'Request timed out');
    } on SocketException catch (_) {
      throw const ServerException(message: 'Failed to connect to server');
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }
}
