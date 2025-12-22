import 'dart:async';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/notifications/notifications.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'unread_notifications_count_provider.g.dart';

@Riverpod(keepAlive: true)
class UnreadNotificationsCount extends _$UnreadNotificationsCount {
  bool _initialized = false;

  void setCount(int value) {
    state = value < 0 ? 0 : value;
  }

  Future<void> _init() async {
    if (_initialized) return;
    _initialized = true;
    final usecase = ref.read(getUnreadNotificationsProvider);
    final result = await usecase(
      NoParams(),
    );
    result.fold(
      (_) {},
      setCount,
    );
  }

  @override
  int build() {
    unawaited(_init());
    return 0;
  }
}
