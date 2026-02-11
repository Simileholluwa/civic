// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(onboardingLocalDatabase)
final onboardingLocalDatabaseProvider = OnboardingLocalDatabaseProvider._();

final class OnboardingLocalDatabaseProvider
    extends
        $FunctionalProvider<
          OnboardingLocalDatabaseImpl,
          OnboardingLocalDatabaseImpl,
          OnboardingLocalDatabaseImpl
        >
    with $Provider<OnboardingLocalDatabaseImpl> {
  OnboardingLocalDatabaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'onboardingLocalDatabaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$onboardingLocalDatabaseHash();

  @$internal
  @override
  $ProviderElement<OnboardingLocalDatabaseImpl> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  OnboardingLocalDatabaseImpl create(Ref ref) {
    return onboardingLocalDatabase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OnboardingLocalDatabaseImpl value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OnboardingLocalDatabaseImpl>(value),
    );
  }
}

String _$onboardingLocalDatabaseHash() =>
    r'39edbcf22cef204e8b58801348bf0bab7cb5f2f6';

@ProviderFor(onboardingRepository)
final onboardingRepositoryProvider = OnboardingRepositoryProvider._();

final class OnboardingRepositoryProvider
    extends
        $FunctionalProvider<
          OnboardingRepositoryImpl,
          OnboardingRepositoryImpl,
          OnboardingRepositoryImpl
        >
    with $Provider<OnboardingRepositoryImpl> {
  OnboardingRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'onboardingRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$onboardingRepositoryHash();

  @$internal
  @override
  $ProviderElement<OnboardingRepositoryImpl> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  OnboardingRepositoryImpl create(Ref ref) {
    return onboardingRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OnboardingRepositoryImpl value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OnboardingRepositoryImpl>(value),
    );
  }
}

String _$onboardingRepositoryHash() =>
    r'a9b9e23c7e4cbe82938a3072e9fb4ade20fd83ef';

@ProviderFor(cacheFirstTimeUseCase)
final cacheFirstTimeUseCaseProvider = CacheFirstTimeUseCaseProvider._();

final class CacheFirstTimeUseCaseProvider
    extends
        $FunctionalProvider<
          CacheFirstTimerUseCase,
          CacheFirstTimerUseCase,
          CacheFirstTimerUseCase
        >
    with $Provider<CacheFirstTimerUseCase> {
  CacheFirstTimeUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cacheFirstTimeUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cacheFirstTimeUseCaseHash();

  @$internal
  @override
  $ProviderElement<CacheFirstTimerUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CacheFirstTimerUseCase create(Ref ref) {
    return cacheFirstTimeUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CacheFirstTimerUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CacheFirstTimerUseCase>(value),
    );
  }
}

String _$cacheFirstTimeUseCaseHash() =>
    r'984aa9394ffe95d8834500c910ed063ead53dc05';
