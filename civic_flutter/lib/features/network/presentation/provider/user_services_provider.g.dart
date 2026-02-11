// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_services_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userRemoteDatasource)
final userRemoteDatasourceProvider = UserRemoteDatasourceProvider._();

final class UserRemoteDatasourceProvider
    extends
        $FunctionalProvider<
          UserRemoteDatasourceImpl,
          UserRemoteDatasourceImpl,
          UserRemoteDatasourceImpl
        >
    with $Provider<UserRemoteDatasourceImpl> {
  UserRemoteDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userRemoteDatasourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userRemoteDatasourceHash();

  @$internal
  @override
  $ProviderElement<UserRemoteDatasourceImpl> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UserRemoteDatasourceImpl create(Ref ref) {
    return userRemoteDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserRemoteDatasourceImpl value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserRemoteDatasourceImpl>(value),
    );
  }
}

String _$userRemoteDatasourceHash() =>
    r'd28c0f4412c6e46fb529c4faea9360b7383f41d6';

@ProviderFor(userRepositoryImpl)
final userRepositoryImplProvider = UserRepositoryImplProvider._();

final class UserRepositoryImplProvider
    extends
        $FunctionalProvider<
          UserRepositoryImpl,
          UserRepositoryImpl,
          UserRepositoryImpl
        >
    with $Provider<UserRepositoryImpl> {
  UserRepositoryImplProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userRepositoryImplProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userRepositoryImplHash();

  @$internal
  @override
  $ProviderElement<UserRepositoryImpl> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UserRepositoryImpl create(Ref ref) {
    return userRepositoryImpl(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserRepositoryImpl value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserRepositoryImpl>(value),
    );
  }
}

String _$userRepositoryImplHash() =>
    r'cf9bfc43f7e25882a5bb5390fd8b022e99864b39';

@ProviderFor(toggleFollow)
final toggleFollowProvider = ToggleFollowProvider._();

final class ToggleFollowProvider
    extends
        $FunctionalProvider<
          ToggleFollowUseCase,
          ToggleFollowUseCase,
          ToggleFollowUseCase
        >
    with $Provider<ToggleFollowUseCase> {
  ToggleFollowProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'toggleFollowProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$toggleFollowHash();

  @$internal
  @override
  $ProviderElement<ToggleFollowUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ToggleFollowUseCase create(Ref ref) {
    return toggleFollow(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ToggleFollowUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ToggleFollowUseCase>(value),
    );
  }
}

String _$toggleFollowHash() => r'3d297be2f1e897d875b8e18ec73fcb94885f8d75';

@ProviderFor(fetchUser)
final fetchUserProvider = FetchUserProvider._();

final class FetchUserProvider
    extends $FunctionalProvider<GetUserUseCase, GetUserUseCase, GetUserUseCase>
    with $Provider<GetUserUseCase> {
  FetchUserProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchUserProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchUserHash();

  @$internal
  @override
  $ProviderElement<GetUserUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetUserUseCase create(Ref ref) {
    return fetchUser(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetUserUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetUserUseCase>(value),
    );
  }
}

String _$fetchUserHash() => r'64743921d7e730ae3f953ffa4d90d7e7cf00fa8e';
