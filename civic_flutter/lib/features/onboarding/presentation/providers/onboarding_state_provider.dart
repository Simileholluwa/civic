import 'package:civic_flutter/features/onboarding/data/datasources/local_database.dart';
import 'package:civic_flutter/features/onboarding/data/repositories/onboarding_repository_impl.dart';
import 'package:civic_flutter/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:civic_flutter/features/onboarding/domain/usecases/cache_first_timer_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final onBoardingLocalDatabaseProvider = Provider((ref) {
  return OnboardingLocalDatabaseImpl();
});

final onBoardingRepositoryProvider = Provider<OnboardingRepository>((ref) {
  return OnboardingRepositoryImpl(
    onboardingLocalDatabase: ref.read(
      onBoardingLocalDatabaseProvider,
    ),
  );
});

final cacheFirstTimeUseCaseProvider = Provider<CacheFirstTimerUseCase>((ref) {
  return CacheFirstTimerUseCase(
    onboardingRepository: ref.read(onBoardingRepositoryProvider),
  );
});

