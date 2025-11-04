import 'dart:convert';
import 'package:civic_client/civic_client.dart';

import 'package:civic_flutter/core/core.dart';

abstract class NotificationLocalDatasource {
  UserNotificationSettings? getSavedNotificationSettings();
  Future<void> saveNotificationSettings({
    required UserNotificationSettings notificationSettings,
  });
}

class NotificationLocalDatasourceImpl implements NotificationLocalDatasource {
  NotificationLocalDatasourceImpl({required LocalStorage prefs})
      : _prefs = prefs;
  final LocalStorage _prefs;
  @override
  UserNotificationSettings? getSavedNotificationSettings() {
    final settingsString = _prefs.getString('notification_settings');
    if (settingsString == null) {
      return null;
    }
    final settingsMap = jsonDecode(settingsString) as Map<String, dynamic>;
    return UserNotificationSettings.fromJson(settingsMap);
  }

  @override
  Future<void> saveNotificationSettings({
    required UserNotificationSettings notificationSettings,
  }) async {
    await _prefs.setString(
      'notification_settings',
      jsonEncode(notificationSettings.toJson()),
    );
  }
}
