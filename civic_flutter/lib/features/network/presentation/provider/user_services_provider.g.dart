// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_services_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userRemoteDatasource)
const userRemoteDatasourceProvider = UserRemoteDatasourceProvider._();

final class UserRemoteDatasourceProvider extends $FunctionalProvider<
    UserRemoteDatasourceImpl,
    UserRemoteDatasourceImpl,
    UserRemoteDatasourceImpl> with $Provider<UserRemoteDatasourceImpl> {
  const UserRemoteDatasourceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'userRemoteDatasourceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$userRemoteDatasourceHash();

  @$internal
  @override
  $ProviderElement<UserRemoteDatasourceImpl> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

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
    r'd976a11dbd329f87a917eb9a0bb0d16133996c47';

@ProviderFor(userRepositoryImpl)
const userRepositoryImplProvider = UserRepositoryImplProvider._();

final class UserRepositoryImplProvider extends $FunctionalProvider<
    UserRepositoryImpl,
    UserRepositoryImpl,
    UserRepositoryImpl> with $Provider<UserRepositoryImpl> {
  const UserRepositoryImplProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'userRepositoryImplProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$userRepositoryImplHash();

  @$internal
  @override
  $ProviderElement<UserRepositoryImpl> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

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
    r'159779279f4333e95fe754a9d2ab195dbd3d861a';

@ProviderFor(toggleFollow)
const toggleFollowProvider = ToggleFollowProvider._();

final class ToggleFollowProvider extends $FunctionalProvider<
    ToggleFollowUseCase,
    ToggleFollowUseCase,
    ToggleFollowUseCase> with $Provider<ToggleFollowUseCase> {
  const ToggleFollowProvider._()
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
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

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
const fetchUserProvider = FetchUserProvider._();

final class FetchUserProvider
    extends $FunctionalProvider<GetUserUseCase, GetUserUseCase, GetUserUseCase>
    with $Provider<GetUserUseCase> {
  const FetchUserProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'fetchUserProvider',
          isAutoDispose: true,
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

String _$fetchUserHash() => r'0183ce54db7382a8413345f8fed7d0ce4e4cd511';
