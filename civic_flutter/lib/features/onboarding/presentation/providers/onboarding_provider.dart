import 'package:civic_flutter/core/usecases/usecase.dart';
import 'package:civic_flutter/features/onboarding/onboarding.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding_provider.g.dart';

@Riverpod(keepAlive: true)
class Onboarding extends _$Onboarding {
  @override
  void build() {}

  Future<void> cacheFirstTimer() async {
    final cacheFirstTimer = ref.read(
      cacheFirstTimeUseCaseProvider,
    );
    await cacheFirstTimer(
      NoParams(),
    );
  }
}
