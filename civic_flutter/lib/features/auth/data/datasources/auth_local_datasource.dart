import 'dart:convert';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';

abstract class AuthLocalDatasource {
  Future<void> saveUserRecord({required UserRecord userRecord});
  UserRecord? getUserRecord();
  Future<void> removeUserRecord();
}

class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  AuthLocalDatasourceImpl({
    required LocalStorage prefs,
  }) : _prefs = prefs;
  final LocalStorage _prefs;

  @override
  Future<void> saveUserRecord({
    required UserRecord userRecord,
  }) async {
    try {
      final jsonString = jsonEncode(userRecord);
      await _prefs.setString('userRecord', jsonString);
      await _prefs.setInt(
        'userId',
        userRecord.id!,
      );
    } on Exception catch (_) {
      throw const CacheException(
        message: TTexts.errorSavingUserRecord,
      );
    }
  }

  @override
  UserRecord? getUserRecord() {
    final userRecord = _prefs.getString('userRecord');
    try {
      if (userRecord != null) {
        final decoded = jsonDecode(userRecord) as Map<String, dynamic>;
        return UserRecord.fromJson(decoded);
      } else {
        return null;
      }
    } on Exception catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<void> removeUserRecord() async {
    try {
      await _prefs.remove('userId');
      await _prefs.remove('userRecord');
      await _prefs.remove('notification_settings');
    } catch (e) {
      throw CacheException(
        message: 'Failed to clear user record: $e',
      );
    }
  }
}
