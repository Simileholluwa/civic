// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AuthUser)
const authUserProvider = AuthUserProvider._();

final class AuthUserProvider
    extends $NotifierProvider<AuthUser, AuthUserState> {
  const AuthUserProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'authUserProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$authUserHash();

  @$internal
  @override
  AuthUser create() => AuthUser();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthUserState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthUserState>(value),
    );
  }
}

String _$authUserHash() => r'c0e4bb41f1e9be0c2c9082ad8c8a7af6ba6aad2c';

abstract class _$AuthUser extends $Notifier<AuthUserState> {
  AuthUserState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AuthUserState, AuthUserState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AuthUserState, AuthUserState>,
        AuthUserState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
