// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CurrentActiveUser)
const currentActiveUserProvider = CurrentActiveUserProvider._();

final class CurrentActiveUserProvider
    extends $NotifierProvider<CurrentActiveUser, UserState> {
  const CurrentActiveUserProvider._()
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

String _$currentActiveUserHash() => r'ab84756f7d59ae7fe0ac7bd521cbfd7fbb0ae694';

abstract class _$CurrentActiveUser extends $Notifier<UserState> {
  UserState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<UserState, UserState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<UserState, UserState>, UserState, Object?, Object?>;
    element.handleValue(ref, created);
  }
}
