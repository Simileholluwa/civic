import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/notifications/notifications.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notifications_provider.g.dart';

@riverpod
class Notif extends _$Notif {
  @override
  NotificationCardState build() {
    return NotificationCardState();
  }

  void setTargetType(NotificationTargetType? targetType) {
    state = state.copyWith(
      targetType: targetType,
    );
  }

  void setUnread(bool? unread) {
    state = state.copyWith(unread: unread);
  }
}
