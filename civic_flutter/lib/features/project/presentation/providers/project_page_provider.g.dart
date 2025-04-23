// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_page_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$projectCurrentPageHash() =>
    r'0a0e5d45727c4e1f4503554c9d6adc22bc2b9d0d';

/// See also [ProjectCurrentPage].
@ProviderFor(ProjectCurrentPage)
final projectCurrentPageProvider =
    AutoDisposeNotifierProvider<ProjectCurrentPage, int>.internal(
  ProjectCurrentPage.new,
  name: r'projectCurrentPageProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$projectCurrentPageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProjectCurrentPage = AutoDisposeNotifier<int>;
String _$projectPageControllerHash() =>
    r'51b1a2cac9bd393263a473f7221276400b82ee84';

/// See also [ProjectPageController].
@ProviderFor(ProjectPageController)
final projectPageControllerProvider = AutoDisposeNotifierProvider<
    ProjectPageController, Raw<PageController>>.internal(
  ProjectPageController.new,
  name: r'projectPageControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$projectPageControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProjectPageController = AutoDisposeNotifier<Raw<PageController>>;
String _$projectTabControllerHash() =>
    r'6ea2f06e38261e90691973b4b5f55899a4f865a0';

/// See also [ProjectTabController].
@ProviderFor(ProjectTabController)
final projectTabControllerProvider = AutoDisposeNotifierProvider<
    ProjectTabController, Raw<TabController>>.internal(
  ProjectTabController.new,
  name: r'projectTabControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$projectTabControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProjectTabController = AutoDisposeNotifier<Raw<TabController>>;
String _$projectDetailsTabControllerHash() =>
    r'45dac648e3020293da6190f682a4e778a5c635da';

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

abstract class _$ProjectDetailsTabController
    extends BuildlessAutoDisposeNotifier<Raw<TabController>> {
  late final String? tabName;

  Raw<TabController> build(
    String? tabName,
  );
}

/// See also [ProjectDetailsTabController].
@ProviderFor(ProjectDetailsTabController)
const projectDetailsTabControllerProvider = ProjectDetailsTabControllerFamily();

/// See also [ProjectDetailsTabController].
class ProjectDetailsTabControllerFamily extends Family<Raw<TabController>> {
  /// See also [ProjectDetailsTabController].
  const ProjectDetailsTabControllerFamily();

  /// See also [ProjectDetailsTabController].
  ProjectDetailsTabControllerProvider call(
    String? tabName,
  ) {
    return ProjectDetailsTabControllerProvider(
      tabName,
    );
  }

  @override
  ProjectDetailsTabControllerProvider getProviderOverride(
    covariant ProjectDetailsTabControllerProvider provider,
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
  String? get name => r'projectDetailsTabControllerProvider';
}

/// See also [ProjectDetailsTabController].
class ProjectDetailsTabControllerProvider
    extends AutoDisposeNotifierProviderImpl<ProjectDetailsTabController,
        Raw<TabController>> {
  /// See also [ProjectDetailsTabController].
  ProjectDetailsTabControllerProvider(
    String? tabName,
  ) : this._internal(
          () => ProjectDetailsTabController()..tabName = tabName,
          from: projectDetailsTabControllerProvider,
          name: r'projectDetailsTabControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$projectDetailsTabControllerHash,
          dependencies: ProjectDetailsTabControllerFamily._dependencies,
          allTransitiveDependencies:
              ProjectDetailsTabControllerFamily._allTransitiveDependencies,
          tabName: tabName,
        );

  ProjectDetailsTabControllerProvider._internal(
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
  Raw<TabController> runNotifierBuild(
    covariant ProjectDetailsTabController notifier,
  ) {
    return notifier.build(
      tabName,
    );
  }

  @override
  Override overrideWith(ProjectDetailsTabController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProjectDetailsTabControllerProvider._internal(
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
  AutoDisposeNotifierProviderElement<ProjectDetailsTabController,
      Raw<TabController>> createElement() {
    return _ProjectDetailsTabControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectDetailsTabControllerProvider &&
        other.tabName == tabName;
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
mixin ProjectDetailsTabControllerRef
    on AutoDisposeNotifierProviderRef<Raw<TabController>> {
  /// The parameter `tabName` of this provider.
  String? get tabName;
}

class _ProjectDetailsTabControllerProviderElement
    extends AutoDisposeNotifierProviderElement<ProjectDetailsTabController,
        Raw<TabController>> with ProjectDetailsTabControllerRef {
  _ProjectDetailsTabControllerProviderElement(super.provider);

  @override
  String? get tabName =>
      (origin as ProjectDetailsTabControllerProvider).tabName;
}

String _$projectDetailCurrentPageHash() =>
    r'a0ceaa7d102a7b23b0b0d4614f740fbea9f736e8';

/// See also [ProjectDetailCurrentPage].
@ProviderFor(ProjectDetailCurrentPage)
final projectDetailCurrentPageProvider =
    AutoDisposeNotifierProvider<ProjectDetailCurrentPage, int>.internal(
  ProjectDetailCurrentPage.new,
  name: r'projectDetailCurrentPageProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$projectDetailCurrentPageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProjectDetailCurrentPage = AutoDisposeNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
