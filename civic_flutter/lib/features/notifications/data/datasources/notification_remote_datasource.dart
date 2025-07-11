import 'dart:io';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';

abstract class NotificationRemoteDatasource {
  Future<void> deleteNotification({required int id});
  Future<void> deleteAllNotification();
  Future<void> markAllNotificationsAsRead();
  Future<void> markNotificationsAsRead({required int id});
  Future<NotificationList> getNotifications({
    required int limit,
    required int page,
    String targetType = '',
    bool isRead = true,
  });
}

class NotificationRemoteDatasourceImpl implements NotificationRemoteDatasource {
  NotificationRemoteDatasourceImpl({
    required Client client,
  }) : _client = client;

  final Client _client;
  @override
  Future<void> deleteAllNotification() async {
    try {
      final result = await _client.notification.deleteAllNotifications();
      return result;
    } on SocketException catch (_) {
      throw const ServerException(
          message: 'Failed to connect to server. Please try again.');
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
    } on PostException catch (e) {
      throw ServerException(message: e.message);
    } on SocketException catch (_) {
      throw const ServerException(
          message: 'Failed to connect to server. Please try again.');
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
    String targetType = '',
    bool isRead = true,
  }) async {
    try {
      final result = await _client.notification.getNotifications(
        limit: limit,
        page: page,
        targetType: targetType,
        isRead: isRead,
      );
      return result;
    } on PostException catch (e) {
      throw ServerException(message: e.message);
    } on SocketException catch (_) {
      throw const ServerException(
          message: 'Failed to connect to server. Please try again.');
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
    } on PostException catch (e) {
      throw ServerException(message: e.message);
    } on SocketException catch (_) {
      throw const ServerException(
          message: 'Failed to connect to server. Please try again.');
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
    } on PostException catch (e) {
      throw ServerException(message: e.message);
    } on SocketException catch (_) {
      throw const ServerException(
          message: 'Failed to connect to server. Please try again.');
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }
}
