// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bottom_nav_visibility_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BottomNavVisibility)
const bottomNavVisibilityProvider = BottomNavVisibilityProvider._();

final class BottomNavVisibilityProvider
    extends $NotifierProvider<BottomNavVisibility, bool> {
  const BottomNavVisibilityProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bottomNavVisibilityProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bottomNavVisibilityHash();

  @$internal
  @override
  BottomNavVisibility create() => BottomNavVisibility();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$bottomNavVisibilityHash() =>
    r'0d0afcc32828cfd9008ddaf1a95465122c3ad5f3';

abstract class _$BottomNavVisibility extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
