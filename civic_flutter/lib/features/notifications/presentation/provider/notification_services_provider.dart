import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/notifications/notifications.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'notification_services_provider.g.dart';

@Riverpod(keepAlive: true)
NotificationRemoteDatasourceImpl notificationRemoteDatasource(Ref ref) {
  return NotificationRemoteDatasourceImpl(
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

@riverpod
DeleteAllNotificationsUseCase deleteAllNotifications(Ref ref) {
  return DeleteAllNotificationsUseCase(
    notificationRepository: ref.read(notificationRepositoryImplProvider),
  );
}

@riverpod
DeleteNotificationUseCase deleteNotification(Ref ref) {
  return DeleteNotificationUseCase(
    notificationRepository: ref.read(notificationRepositoryImplProvider),
  );
}

@riverpod
MarkNotificationAsReadUseCase markNotificationAsRead(Ref ref) {
  return MarkNotificationAsReadUseCase(
    notificationRepository: ref.read(notificationRepositoryImplProvider),
  );
}

@riverpod
MarkAllNotificationsAsReadUseCase markAllNotificationAsRead(Ref ref) {
  return MarkAllNotificationsAsReadUseCase(
    notificationRepository: ref.read(notificationRepositoryImplProvider),
  );
}
