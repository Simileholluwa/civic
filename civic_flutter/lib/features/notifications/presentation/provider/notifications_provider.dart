import 'dart:developer';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/notifications/notifications.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notifications_provider.g.dart';

@riverpod
class Notif extends _$Notif {
  @override
  void build() {}

  Future<void> markAsRead(int notificationId) async {
    final markRead = ref.read(markNotificationAsReadProvider);
    final result = await markRead(
      MarkNotificationAsReadParams(
        notificationId,
      ),
    );
    result.fold(
      (l) {
        log(l.message);
        return;
      },
      (_) {
        return;
      },
    );
  }

  Future<void> markAllAsRead() async {
    final markAllRead = ref.read(markAllNotificationAsReadProvider);
    final result = await markAllRead(NoParams());
    result.fold(
      (l) {
        log(l.message);
        return;
      },
      (_) {
        return;
      },
    );
  }

  Future<void> deleteNotification(int notificationId) async {
    final delete = ref.read(deleteNotificationProvider);
    final result = await delete(
      DeleteNotificationParams(
        notificationId,
      ),
    );
    result.fold(
      (l) {
        log(l.message);
        return;
      },
      (_) {
        return;
      },
    );
  }

  Future<void> deleteAllNotification() async {
    final deleteAll = ref.read(deleteAllNotificationsProvider);
    final result = await deleteAll(NoParams());
    result.fold(
      (l) {
        log(l.message);
        return;
      },
      (_) {
        ref
            .read(paginatedNotificationsListProvider('').notifier)
            .removeAllNotifications();
        return;
      },
    );
  }
}
