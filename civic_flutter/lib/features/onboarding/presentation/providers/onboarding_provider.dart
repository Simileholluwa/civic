// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
// ignore_for_file: avoid_build_context_in_providers
import 'package:civic_flutter/core/usecases/usecase.dart';
import 'package:civic_flutter/features/onboarding/presentation/states/onboarding_state.dart';
import 'package:civic_flutter/features/onboarding/presentation/providers/onboarding_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'onboarding_provider.g.dart';

@Riverpod(keepAlive: true)
class Onboarding extends _$Onboarding {
  @override
  OnboardingState build() {
    return OnboardingStateInitial();
  }

  Future<void> cacheFirstTimer() async {
    final cacheFirstTimer = ref.read(
      cacheFirstTimeUseCaseProvider,
    );
    final result = await cacheFirstTimer(
      NoParams(),
    );
    result.fold(
      (error) => null,
      (r) => null,
    );
  }
}
