import 'dart:async';
import 'dart:io';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/device/device_utility.dart';
import 'package:fpdart/fpdart.dart';

class UsersListService {
  UsersListService({required this.client});
  final Client client;

  Future<Either<String, UsersList>> listUsers({
    required String query,
    required int page,
    required int limit,
  }) async {
    try {
      final isConnected = await TDeviceUtils.hasInternetConnection();
      if (!isConnected) {
        return left(
          'You are not connected to the internet.',
        );
      }
      final result = await client.userRecord.getUsers(
        query: query,
        page: page,
        limit: limit,
      );
      return right(result);
    } on TimeoutException catch (_) {
      return left('Request timed out');
    } on SocketException catch (_) {
      return left('Failed to connect to server');
    } catch (e) {
      return left(
        e.toString(),
      );
    }
  }
}
