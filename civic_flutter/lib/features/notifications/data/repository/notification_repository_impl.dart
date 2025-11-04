import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/notifications/notifications.dart';
import 'package:fpdart/fpdart.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  NotificationRepositoryImpl({
    required NotificationRemoteDatasourceImpl remoteDatabase,
  }) : _remoteDatabase = remoteDatabase;
  final NotificationRemoteDatasourceImpl _remoteDatabase;
  @override
  Future<Either<Failure, void>> deleteAllNotification() async {
    try {
      final result = await _remoteDatabase.deleteAllNotification();
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> deleteNotification({required int id}) async {
    try {
      final result = await _remoteDatabase.deleteNotification(
        id: id,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, NotificationList>> getNotifications({
    required int limit,
    required int page,
    NotificationTargetType? targetType,
    bool? isRead,
  }) async {
    try {
      final result = await _remoteDatabase.getNotifications(
        limit: limit,
        page: page,
        targetType: targetType,
        isRead: isRead,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> markAllNotificationAsRead() async {
    try {
      final result = await _remoteDatabase.markAllNotificationsAsRead();
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> markNotificationAsRead({
    required int id,
  }) async {
    try {
      final result = await _remoteDatabase.markNotificationsAsRead(
        id: id,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserNotificationSettings>>
      getUserNotificationSettings() async {
    try {
      final result = await _remoteDatabase.getUserNotificationSettings();
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserNotificationSettings>>
      updateUserNotificationSettings({
    required UserNotificationSettings notificationsSettings,
  }) async {
    try {
      final result = await _remoteDatabase.updateUserNotificationSettings(
        notificationsSettings: notificationsSettings,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }
}
