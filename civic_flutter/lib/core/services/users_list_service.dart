import 'dart:async';
import 'dart:io';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
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
      final result = await client.userRecord.getUsers(
        query: query,
        page: page,
        limit: limit,
      );
      return right(result);
    } on TimeoutException catch (_) {
      return left(TTexts.requestTimedOutShort);
    } on SocketException catch (_) {
      return left(TTexts.failedToConnectToServer);
    } on Exception catch (e) {
      return left(
        e.toString(),
      );
    }
  }
}
