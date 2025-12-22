import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:fpdart/fpdart.dart';

abstract class NotificationRepository {
  Future<Either<Failure, void>> markNotificationAsRead({required int id});
  Future<Either<Failure, void>> deleteNotification({required int id});
  Future<Either<Failure, void>> markAllNotificationAsRead();
  Future<Either<Failure, void>> deleteAllNotification();
  Future<Either<Failure, NotificationList>> getNotifications({
    required int limit,
    required int page,
    NotificationTargetType? targetType,
    bool? isRead,
  });
  Future<Either<Failure, int>> getUnreadNotifications();
  Future<Either<Failure, UserNotificationSettings>>
      getUserNotificationSettings();
  Future<Either<Failure, UserNotificationSettings>>
      updateUserNotificationSettings({
    required UserNotificationSettings notificationsSettings,
  });
}
