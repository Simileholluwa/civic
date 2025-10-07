// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_scroll_visibility_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AppScrollVisibility)
const appScrollVisibilityProvider = AppScrollVisibilityFamily._();

final class AppScrollVisibilityProvider
    extends $NotifierProvider<AppScrollVisibility, bool> {
  const AppScrollVisibilityProvider._(
      {required AppScrollVisibilityFamily super.from,
      required bool? super.argument})
      : super(
          retry: null,
          name: r'appScrollVisibilityProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$appScrollVisibilityHash();

  @override
  String toString() {
    return r'appScrollVisibilityProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  AppScrollVisibility create() => AppScrollVisibility();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AppScrollVisibilityProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$appScrollVisibilityHash() =>
    r'8dbead5d181bbbe3adfa68384c9e080c0cc08dee';

final class AppScrollVisibilityFamily extends $Family
    with $ClassFamilyOverride<AppScrollVisibility, bool, bool, bool, bool?> {
  const AppScrollVisibilityFamily._()
      : super(
          retry: null,
          name: r'appScrollVisibilityProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  AppScrollVisibilityProvider call(
    bool? value,
  ) =>
      AppScrollVisibilityProvider._(argument: value, from: this);

  @override
  String toString() => r'appScrollVisibilityProvider';
}

abstract class _$AppScrollVisibility extends $Notifier<bool> {
  late final _$args = ref.$arg as bool?;
  bool? get value => _$args;

  bool build(
    bool? value,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args,
    );
    final ref = this.ref as $Ref<bool, bool>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<bool, bool>, bool, Object?, Object?>;
    element.handleValue(ref, created);
  }
}
