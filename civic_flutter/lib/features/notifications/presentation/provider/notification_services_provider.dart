// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/notifications/notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'notification_services_provider.g.dart';

@riverpod
NotificationRemoteDatasourceImpl notificationRemoteDatasource(Ref ref) {
  return NotificationRemoteDatasourceImpl(
    client: ref.read(clientProvider),
  );
}

@riverpod
NotificationRepositoryImpl notificationRepositoryImpl(Ref ref) {
  return NotificationRepositoryImpl(
    remoteDatabase: ref.read(
      notificationRemoteDatasourceProvider,
    ),
  );
}

@riverpod
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