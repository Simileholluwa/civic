import 'dart:convert';
import 'dart:developer';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';

abstract class AuthLocalDatasource {
  Future<void> saveUserRecord({required UserRecord userRecord});
  UserRecord? getUserRecord();
  Future<void> removeUserRecord();
}

class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  final LocalStorage _prefs;
  AuthLocalDatasourceImpl({
    required LocalStorage prefs,
  }) : _prefs = prefs;

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
    } catch (e) {
      log(e.toString());
      throw CacheException(message: 'Something went wrong');
    }
  }

  @override
  UserRecord? getUserRecord() {
    final userRecord = _prefs.getString('userRecord');
    try {
      if (userRecord != null) {
        final decoded = jsonDecode(userRecord.toString());
        return UserRecord.fromJson(decoded);
      } else {
        return null;
      }
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<void> removeUserRecord() {
    return _prefs.remove('userRecord');
  }
}
