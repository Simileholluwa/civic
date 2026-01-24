import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/notifications/notifications.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'notification_services_provider.g.dart';

@Riverpod(keepAlive: true)
NotificationLocalDatasourceImpl notificationLocalDatasource(Ref ref) {
  return NotificationLocalDatasourceImpl(
    prefs: ref.read(localStorageProvider),
  );
}

@Riverpod(keepAlive: true)
NotificationRemoteDatasourceImpl notificationRemoteDatasource(Ref ref) {
  return NotificationRemoteDatasourceImpl(
    localDatasource: ref.read(notificationLocalDatasourceProvider),
    client: ref.read(clientProvider),
  );
}

@Riverpod(keepAlive: true)
NotificationRepositoryImpl notificationRepositoryImpl(Ref ref) {
  return NotificationRepositoryImpl(
    remoteDatabase: ref.read(
      notificationRemoteDatasourceProvider,
    ),
  );
}

@Riverpod(keepAlive: true)
GetNotificationsUseCase getNotifications(Ref ref) {
  return GetNotificationsUseCase(
    notificationRepository: ref.read(notificationRepositoryImplProvider),
  );
}

@Riverpod(keepAlive: true)
GetUserNotificationSettingsUseCase getUserNotificationSettings(Ref ref) {
  return GetUserNotificationSettingsUseCase(
    notificationRepository: ref.read(notificationRepositoryImplProvider),
  );
}

@Riverpod(keepAlive: true)
UpdateUserNotificationSettingsUseCase updateUserNotificationSettings(Ref ref) {
  return UpdateUserNotificationSettingsUseCase(
    notificationRepository: ref.read(notificationRepositoryImplProvider),
  );
}

@Riverpod(keepAlive: true)
DeleteAllNotificationsUseCase deleteAllNotifications(Ref ref) {
  return DeleteAllNotificationsUseCase(
    notificationRepository: ref.read(notificationRepositoryImplProvider),
  );
}

@Riverpod(keepAlive: true)
DeleteNotificationUseCase deleteNotification(Ref ref) {
  return DeleteNotificationUseCase(
    notificationRepository: ref.read(notificationRepositoryImplProvider),
  );
}

@Riverpod(keepAlive: true)
MarkNotificationAsReadUseCase markNotificationAsRead(Ref ref) {
  return MarkNotificationAsReadUseCase(
    notificationRepository: ref.read(notificationRepositoryImplProvider),
  );
}

@Riverpod(keepAlive: true)
MarkAllNotificationsAsReadUseCase markAllNotificationAsRead(Ref ref) {
  return MarkAllNotificationsAsReadUseCase(
    notificationRepository: ref.read(notificationRepositoryImplProvider),
  );
}

@Riverpod(keepAlive: true)
GetUnreadNotificationsUseCase getUnreadNotifications(Ref ref) {
  return GetUnreadNotificationsUseCase(
    notificationRepository: ref.read(notificationRepositoryImplProvider),
  );
}
