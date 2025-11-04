import 'dart:async';

import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'initial_dependencies_provider.g.dart';

@riverpod
class BootStrap extends _$BootStrap {
  @override
  Future<void> build() async {
    final link = ref.keepAlive();
    try {
      await initialDependencies();
    } finally {
      link.close();
    }
  }

  Future<void> initialDependencies() async {
    await ref.read(localStorageProvider).init();
    await ref.read(sessionProvider).initialize();
    await ref.read(authUserProvider.notifier).init();
    await ref.read(fcmServiceImplProvider).init();
  }
}
