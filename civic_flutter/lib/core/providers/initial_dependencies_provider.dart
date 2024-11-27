import 'package:civic_flutter/core/core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'initial_dependencies_provider.g.dart';

@riverpod
class BootStrap extends _$BootStrap {
  @override
  bool build() {
    initialDependencies();
    return true;
  }

  Future<void> initialDependencies() async {
    await ref.read(localStorageProvider).init();
    state = false;
  }
}
