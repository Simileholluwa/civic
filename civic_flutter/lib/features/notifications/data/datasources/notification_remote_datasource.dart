import 'dart:io';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/notifications/notifications.dart';

abstract class NotificationRemoteDatasource {
  Future<void> deleteNotification({required int id});
  Future<void> deleteAllNotification();
  Future<void> markAllNotificationsAsRead();
  Future<void> markNotificationsAsRead({required int id});
  Future<int> getUnreadNotifications();
  Future<NotificationList> getNotifications({
    required int limit,
    required int page,
    NotificationTargetType? targetType,
    bool? isRead,
  });
  Future<UserNotificationSettings> getUserNotificationSettings();
  Future<UserNotificationSettings> updateUserNotificationSettings({
    required UserNotificationSettings notificationsSettings,
  });
}

class NotificationRemoteDatasourceImpl implements NotificationRemoteDatasource {
  NotificationRemoteDatasourceImpl({
    required Client client,
    required NotificationLocalDatasourceImpl localDatasource,
  })  : _client = client,
        _localDatasource = localDatasource;

  final Client _client;
  final NotificationLocalDatasourceImpl _localDatasource;
  @override
  Future<void> deleteAllNotification() async {
    try {
      final result = await _client.notification.deleteAllNotifications();
      return result;
    } on SocketException catch (_) {
      throw const ServerException(
        message: 'Failed to connect to server. Please try again.',
      );
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<int> getUnreadNotifications() async {
    try {
      final result = await _client.notification.getUnreadNotificationCount();
      return result;
    } on SocketException catch (_) {
      throw const ServerException(
        message: 'Failed to connect to server. Please try again.',
      );
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<void> deleteNotification({required int id}) async {
    try {
      final result = await _client.notification.deleteAllNotifications();
      return result;
    } on ServerSideException catch (e) {
      throw ServerException(message: e.message);
    } on SocketException catch (_) {
      throw const ServerException(
        message: 'Failed to connect to server. Please try again.',
      );
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<NotificationList> getNotifications({
    required int limit,
    required int page,
    NotificationTargetType? targetType,
    bool? isRead,
  }) async {
    try {
      final result = await _client.notification.getNotifications(
        limit: limit,
        page: page,
        targetType: targetType,
        isRead: isRead,
      );
      return result;
    } on ServerSideException catch (e) {
      throw ServerException(message: e.message);
    } on SocketException catch (_) {
      throw const ServerException(
        message: 'Failed to connect to server. Please try again.',
      );
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<void> markAllNotificationsAsRead() async {
    try {
      final result = await _client.notification.markAllNotificationsAsRead();
      return result;
    } on ServerSideException catch (e) {
      throw ServerException(message: e.message);
    } on SocketException catch (_) {
      throw const ServerException(
        message: 'Failed to connect to server. Please try again.',
      );
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<void> markNotificationsAsRead({required int id}) async {
    try {
      final result = await _client.notification.markNotificationAsRead(
        id,
      );
      return result;
    } on ServerSideException catch (e) {
      throw ServerException(message: e.message);
    } on SocketException catch (_) {
      throw const ServerException(
        message: 'Failed to connect to server. Please try again.',
      );
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<UserNotificationSettings> getUserNotificationSettings() async {
    try {
      final savedSettings = _localDatasource.getSavedNotificationSettings();
      if (savedSettings != null) {
        return savedSettings;
      }
      final result = await _client.notification.getNotificationSettings();
      await _localDatasource.saveNotificationSettings(
        notificationSettings: result,
      );
      return result;
    } on ServerSideException catch (e) {
      throw ServerException(message: e.message);
    } on SocketException catch (_) {
      throw const ServerException(
        message: 'Failed to connect to server. Please try again.',
      );
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<UserNotificationSettings> updateUserNotificationSettings({
    required UserNotificationSettings notificationsSettings,
  }) async {
    try {
      final result = await _client.notification.updateNotificationSettings(
        notificationsSettings,
      );
      await _localDatasource.saveNotificationSettings(
        notificationSettings: result,
      );
      return result;
    } on ServerSideException catch (e) {
      throw ServerException(message: e.message);
    } on SocketException catch (_) {
      throw const ServerException(
        message: 'Failed to connect to server. Please try again.',
      );
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }
}
