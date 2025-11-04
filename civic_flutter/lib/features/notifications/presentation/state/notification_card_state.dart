import 'package:civic_client/civic_client.dart';

class NotificationCardState {
  NotificationCardState({
    this.targetType,
    this.unread,
  });

  final NotificationTargetType? targetType;
  final bool? unread;

  NotificationCardState copyWith({
    Object? targetType = _noChange,
    Object? unread = _noChange,
  }) {
    return NotificationCardState(
      targetType: targetType == _noChange
          ? this.targetType
          : targetType as NotificationTargetType?,
      unread: unread == _noChange ? this.unread : unread as bool?,
    );
  }

  static const _noChange = Object();
}
