import 'dart:async';

import 'package:civic_flutter/core/core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'unread_notifications_count_provider.g.dart';

@riverpod
class UnreadNotificationsCount extends _$UnreadNotificationsCount {
  int _count = 0;
  bool _initialized = false;
  int get count => _count;
  set count(int value) {
    _count = value < 0 ? 0 : value;
    state = _count;
  }

  Future<void> _init() async {
    if (_initialized) return;
    _initialized = true;
    try {
      final client = ref.read(clientProvider);
      final initial = await client.notification.getUnreadNotificationCount();
      count = initial;
    } on Exception catch (_) {}
  }

  @override
  int build() {
    unawaited(_init());
    return _count;
  }
}
