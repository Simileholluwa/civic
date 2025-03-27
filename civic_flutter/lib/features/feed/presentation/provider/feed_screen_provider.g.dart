// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_screen_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$feedCurrentPageHash() => r'0908dbff448414f2ba3209cfa15911310e0e6dd4';

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

abstract class _$FeedCurrentPage extends BuildlessAutoDisposeNotifier<int> {
  late final String? tabName;

  int build(
    String? tabName,
  );
}

/// See also [FeedCurrentPage].
@ProviderFor(FeedCurrentPage)
const feedCurrentPageProvider = FeedCurrentPageFamily();

/// See also [FeedCurrentPage].
class FeedCurrentPageFamily extends Family<int> {
  /// See also [FeedCurrentPage].
  const FeedCurrentPageFamily();

  /// See also [FeedCurrentPage].
  FeedCurrentPageProvider call(
    String? tabName,
  ) {
    return FeedCurrentPageProvider(
      tabName,
    );
  }

  @override
  FeedCurrentPageProvider getProviderOverride(
    covariant FeedCurrentPageProvider provider,
  ) {
    return call(
      provider.tabName,
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
  String? get name => r'feedCurrentPageProvider';
}

/// See also [FeedCurrentPage].
class FeedCurrentPageProvider
    extends AutoDisposeNotifierProviderImpl<FeedCurrentPage, int> {
  /// See also [FeedCurrentPage].
  FeedCurrentPageProvider(
    String? tabName,
  ) : this._internal(
          () => FeedCurrentPage()..tabName = tabName,
          from: feedCurrentPageProvider,
          name: r'feedCurrentPageProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$feedCurrentPageHash,
          dependencies: FeedCurrentPageFamily._dependencies,
          allTransitiveDependencies:
              FeedCurrentPageFamily._allTransitiveDependencies,
          tabName: tabName,
        );

  FeedCurrentPageProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tabName,
  }) : super.internal();

  final String? tabName;

  @override
  int runNotifierBuild(
    covariant FeedCurrentPage notifier,
  ) {
    return notifier.build(
      tabName,
    );
  }

  @override
  Override overrideWith(FeedCurrentPage Function() create) {
    return ProviderOverride(
      origin: this,
      override: FeedCurrentPageProvider._internal(
        () => create()..tabName = tabName,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tabName: tabName,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<FeedCurrentPage, int> createElement() {
    return _FeedCurrentPageProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FeedCurrentPageProvider && other.tabName == tabName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tabName.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FeedCurrentPageRef on AutoDisposeNotifierProviderRef<int> {
  /// The parameter `tabName` of this provider.
  String? get tabName;
}

class _FeedCurrentPageProviderElement
    extends AutoDisposeNotifierProviderElement<FeedCurrentPage, int>
    with FeedCurrentPageRef {
  _FeedCurrentPageProviderElement(super.provider);

  @override
  String? get tabName => (origin as FeedCurrentPageProvider).tabName;
}

String _$feedPageControllerHash() =>
    r'0acea77395ad46acd45eb7b11090028c5d2c8df6';

abstract class _$FeedPageController
    extends BuildlessAutoDisposeNotifier<Raw<PageController>> {
  late final String? tabName;

  Raw<PageController> build(
    String? tabName,
  );
}

/// See also [FeedPageController].
@ProviderFor(FeedPageController)
const feedPageControllerProvider = FeedPageControllerFamily();

/// See also [FeedPageController].
class FeedPageControllerFamily extends Family<Raw<PageController>> {
  /// See also [FeedPageController].
  const FeedPageControllerFamily();

  /// See also [FeedPageController].
  FeedPageControllerProvider call(
    String? tabName,
  ) {
    return FeedPageControllerProvider(
      tabName,
    );
  }

  @override
  FeedPageControllerProvider getProviderOverride(
    covariant FeedPageControllerProvider provider,
  ) {
    return call(
      provider.tabName,
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
  String? get name => r'feedPageControllerProvider';
}

/// See also [FeedPageController].
class FeedPageControllerProvider extends AutoDisposeNotifierProviderImpl<
    FeedPageController, Raw<PageController>> {
  /// See also [FeedPageController].
  FeedPageControllerProvider(
    String? tabName,
  ) : this._internal(
          () => FeedPageController()..tabName = tabName,
          from: feedPageControllerProvider,
          name: r'feedPageControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$feedPageControllerHash,
          dependencies: FeedPageControllerFamily._dependencies,
          allTransitiveDependencies:
              FeedPageControllerFamily._allTransitiveDependencies,
          tabName: tabName,
        );

  FeedPageControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tabName,
  }) : super.internal();

  final String? tabName;

  @override
  Raw<PageController> runNotifierBuild(
    covariant FeedPageController notifier,
  ) {
    return notifier.build(
      tabName,
    );
  }

  @override
  Override overrideWith(FeedPageController Function() create) {
    return ProviderOverride(
      origin: this,
      override: FeedPageControllerProvider._internal(
        () => create()..tabName = tabName,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tabName: tabName,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<FeedPageController, Raw<PageController>>
      createElement() {
    return _FeedPageControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FeedPageControllerProvider && other.tabName == tabName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tabName.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FeedPageControllerRef
    on AutoDisposeNotifierProviderRef<Raw<PageController>> {
  /// The parameter `tabName` of this provider.
  String? get tabName;
}

class _FeedPageControllerProviderElement
    extends AutoDisposeNotifierProviderElement<FeedPageController,
        Raw<PageController>> with FeedPageControllerRef {
  _FeedPageControllerProviderElement(super.provider);

  @override
  String? get tabName => (origin as FeedPageControllerProvider).tabName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
