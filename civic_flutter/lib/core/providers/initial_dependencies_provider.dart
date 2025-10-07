import 'dart:async';

import 'package:civic_flutter/core/core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'initial_dependencies_provider.g.dart';

@riverpod
class BootStrap extends _$BootStrap {
  @override
  Future<void> build() async {
    await initialDependencies();
  }

  Future<void> initialDependencies() async {
    await ref.read(localStorageProvider).init();
    await ref.read(sessionProvider).initialize();
  }
}
