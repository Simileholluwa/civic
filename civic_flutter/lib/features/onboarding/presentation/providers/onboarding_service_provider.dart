import 'package:civic_flutter/core/providers/local_storage_provider.dart';
import 'package:civic_flutter/features/onboarding/data/datasources/local_database.dart';
import 'package:civic_flutter/features/onboarding/data/repositories/onboarding_repository_impl.dart';
import 'package:civic_flutter/features/onboarding/domain/usecases/cache_first_timer_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'onboarding_service_provider.g.dart';

@riverpod
OnboardingLocalDatabaseImpl onboardingLocalDatabase(OnboardingLocalDatabaseRef ref) {
  return OnboardingLocalDatabaseImpl(
    localStorage: ref.read(
      localStorageProvider,
    ),
  );
}

@riverpod
OnboardingRepositoryImpl onboardingRepository(OnboardingRepositoryRef ref) {
  return OnboardingRepositoryImpl(
    localDatabase: ref.read(
      onboardingLocalDatabaseProvider,
    ),
  );
}

@riverpod
CacheFirstTimerUseCase cacheFirstTimeUseCase(CacheFirstTimeUseCaseRef ref) {
  return CacheFirstTimerUseCase(
    onboardingRepository: ref.read(onboardingRepositoryProvider),
  );
}

