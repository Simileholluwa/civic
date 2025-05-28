// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_scroll_visibility_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appScrollVisibilityHash() =>
    r'8dbead5d181bbbe3adfa68384c9e080c0cc08dee';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$AppScrollVisibility
    extends BuildlessAutoDisposeNotifier<bool> {
  late final bool? value;

  bool build(
    bool? value,
  );
}

/// See also [AppScrollVisibility].
@ProviderFor(AppScrollVisibility)
const appScrollVisibilityProvider = AppScrollVisibilityFamily();

/// See also [AppScrollVisibility].
class AppScrollVisibilityFamily extends Family<bool> {
  /// See also [AppScrollVisibility].
  const AppScrollVisibilityFamily();

  /// See also [AppScrollVisibility].
  AppScrollVisibilityProvider call(
    bool? value,
  ) {
    return AppScrollVisibilityProvider(
      value,
    );
  }

  @override
  AppScrollVisibilityProvider getProviderOverride(
    covariant AppScrollVisibilityProvider provider,
  ) {
    return call(
      provider.value,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'appScrollVisibilityProvider';
}

/// See also [AppScrollVisibility].
class AppScrollVisibilityProvider
    extends AutoDisposeNotifierProviderImpl<AppScrollVisibility, bool> {
  /// See also [AppScrollVisibility].
  AppScrollVisibilityProvider(
    bool? value,
  ) : this._internal(
          () => AppScrollVisibility()..value = value,
          from: appScrollVisibilityProvider,
          name: r'appScrollVisibilityProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$appScrollVisibilityHash,
          dependencies: AppScrollVisibilityFamily._dependencies,
          allTransitiveDependencies:
              AppScrollVisibilityFamily._allTransitiveDependencies,
          value: value,
        );

  AppScrollVisibilityProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.value,
  }) : super.internal();

  final bool? value;

  @override
  bool runNotifierBuild(
    covariant AppScrollVisibility notifier,
  ) {
    return notifier.build(
      value,
    );
  }

  @override
  Override overrideWith(AppScrollVisibility Function() create) {
    return ProviderOverride(
      origin: this,
      override: AppScrollVisibilityProvider._internal(
        () => create()..value = value,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        value: value,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<AppScrollVisibility, bool>
      createElement() {
    return _AppScrollVisibilityProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AppScrollVisibilityProvider && other.value == value;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, value.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AppScrollVisibilityRef on AutoDisposeNotifierProviderRef<bool> {
  /// The parameter `value` of this provider.
  bool? get value;
}

class _AppScrollVisibilityProviderElement
    extends AutoDisposeNotifierProviderElement<AppScrollVisibility, bool>
    with AppScrollVisibilityRef {
  _AppScrollVisibilityProviderElement(super.provider);

  @override
  bool? get value => (origin as AppScrollVisibilityProvider).value;
}

String _$appBottomNavigationVisibilityHash() =>
    r'04b0c21e6d5600913743bfcc78ca0c413d6712f0';

abstract class _$AppBottomNavigationVisibility
    extends BuildlessAutoDisposeNotifier<bool> {
  late final bool? value;

  bool build(
    bool? value,
  );
}

/// See also [AppBottomNavigationVisibility].
@ProviderFor(AppBottomNavigationVisibility)
const appBottomNavigationVisibilityProvider =
    AppBottomNavigationVisibilityFamily();

/// See also [AppBottomNavigationVisibility].
class AppBottomNavigationVisibilityFamily extends Family<bool> {
  /// See also [AppBottomNavigationVisibility].
  const AppBottomNavigationVisibilityFamily();

  /// See also [AppBottomNavigationVisibility].
  AppBottomNavigationVisibilityProvider call(
    bool? value,
  ) {
    return AppBottomNavigationVisibilityProvider(
      value,
    );
  }

  @override
  AppBottomNavigationVisibilityProvider getProviderOverride(
    covariant AppBottomNavigationVisibilityProvider provider,
  ) {
    return call(
      provider.value,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'appBottomNavigationVisibilityProvider';
}

/// See also [AppBottomNavigationVisibility].
class AppBottomNavigationVisibilityProvider
    extends AutoDisposeNotifierProviderImpl<AppBottomNavigationVisibility,
        bool> {
  /// See also [AppBottomNavigationVisibility].
  AppBottomNavigationVisibilityProvider(
    bool? value,
  ) : this._internal(
          () => AppBottomNavigationVisibility()..value = value,
          from: appBottomNavigationVisibilityProvider,
          name: r'appBottomNavigationVisibilityProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$appBottomNavigationVisibilityHash,
          dependencies: AppBottomNavigationVisibilityFamily._dependencies,
          allTransitiveDependencies:
              AppBottomNavigationVisibilityFamily._allTransitiveDependencies,
          value: value,
        );

  AppBottomNavigationVisibilityProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.value,
  }) : super.internal();

  final bool? value;

  @override
  bool runNotifierBuild(
    covariant AppBottomNavigationVisibility notifier,
  ) {
    return notifier.build(
      value,
    );
  }

  @override
  Override overrideWith(AppBottomNavigationVisibility Function() create) {
    return ProviderOverride(
      origin: this,
      override: AppBottomNavigationVisibilityProvider._internal(
        () => create()..value = value,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        value: value,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<AppBottomNavigationVisibility, bool>
      createElement() {
    return _AppBottomNavigationVisibilityProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AppBottomNavigationVisibilityProvider &&
        other.value == value;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, value.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AppBottomNavigationVisibilityRef on AutoDisposeNotifierProviderRef<bool> {
  /// The parameter `value` of this provider.
  bool? get value;
}

class _AppBottomNavigationVisibilityProviderElement
    extends AutoDisposeNotifierProviderElement<AppBottomNavigationVisibility,
        bool> with AppBottomNavigationVisibilityRef {
  _AppBottomNavigationVisibilityProviderElement(super.provider);

  @override
  bool? get value => (origin as AppBottomNavigationVisibilityProvider).value;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
