// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CurrentActiveUser)
final currentActiveUserProvider = CurrentActiveUserProvider._();

final class CurrentActiveUserProvider
    extends $NotifierProvider<CurrentActiveUser, UserState> {
  CurrentActiveUserProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentActiveUserProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentActiveUserHash();

  @$internal
  @override
  CurrentActiveUser create() => CurrentActiveUser();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserState>(value),
    );
  }
}

String _$currentActiveUserHash() => r'f26ef958a2f6fcdef26b65ca4a3784a417244628';

abstract class _$CurrentActiveUser extends $Notifier<UserState> {
  UserState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<UserState, UserState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<UserState, UserState>,
              UserState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
