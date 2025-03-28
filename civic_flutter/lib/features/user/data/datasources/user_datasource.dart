import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';

abstract class UserRemoteDatasource {
  Future<void> toggleFollow({required int userId,});
  Future<UserRecord> fetchUser();
}

class UserRemoteDatasourceImpl extends UserRemoteDatasource {
  UserRemoteDatasourceImpl({
    required Client client,
  }) : _client = client;
  final Client _client;
  @override
  Future<void> toggleFollow({required int userId}) async {
    try {
      return await _client.userRecord.followUnfollowUser(
        userId,
      );
    } on UserException catch (e) {
      throw ServerException(message: e.message);
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }
  
  @override
  Future<UserRecord> fetchUser() async {
    try {
      final userRecord = await _client.userRecord.getUser();
      if (userRecord == null) {
        throw ServerException(message: 'User not found');
      }
      return userRecord;
    } on UserException catch (e) {
      throw ServerException(message: e.message);
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }
  
}