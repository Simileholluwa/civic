import 'package:civic_flutter/core/providers/local_storage_provider.dart';
import 'package:civic_flutter/features/onboarding/data/datasources/local_database.dart';
import 'package:civic_flutter/features/onboarding/data/repositories/onboarding_repository_impl.dart';
import 'package:civic_flutter/features/onboarding/domain/usecases/cache_first_timer_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
part 'onboarding_service_provider.g.dart';

@riverpod
OnboardingLocalDatabaseImpl onboardingLocalDatabase(Ref ref) {
  return OnboardingLocalDatabaseImpl(
    localStorage: ref.read(
      localStorageProvider,
    ),
  );
}

@riverpod
OnboardingRepositoryImpl onboardingRepository(Ref ref) {
  return OnboardingRepositoryImpl(
    localDatabase: ref.read(
      onboardingLocalDatabaseProvider,
    ),
  );
}

@riverpod
CacheFirstTimerUseCase cacheFirstTimeUseCase(Ref ref) {
  return CacheFirstTimerUseCase(
    onboardingRepository: ref.read(onboardingRepositoryProvider),
  );
}

