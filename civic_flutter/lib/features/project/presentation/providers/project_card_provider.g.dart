// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_card_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$projectCardWidgetHash() => r'00066fc5fc7dd244aa353bf67141f6cbb02275b7';

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

abstract class _$ProjectCardWidget
    extends BuildlessAutoDisposeNotifier<ProjectCardState> {
  late final Project project;

  ProjectCardState build(
    Project project,
  );
}

/// See also [ProjectCardWidget].
@ProviderFor(ProjectCardWidget)
const projectCardWidgetProvider = ProjectCardWidgetFamily();

/// See also [ProjectCardWidget].
class ProjectCardWidgetFamily extends Family<ProjectCardState> {
  /// See also [ProjectCardWidget].
  const ProjectCardWidgetFamily();

  /// See also [ProjectCardWidget].
  ProjectCardWidgetProvider call(
    Project project,
  ) {
    return ProjectCardWidgetProvider(
      project,
    );
  }

  @override
  ProjectCardWidgetProvider getProviderOverride(
    covariant ProjectCardWidgetProvider provider,
  ) {
    return call(
      provider.project,
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
  String? get name => r'projectCardWidgetProvider';
}

/// See also [ProjectCardWidget].
class ProjectCardWidgetProvider extends AutoDisposeNotifierProviderImpl<
    ProjectCardWidget, ProjectCardState> {
  /// See also [ProjectCardWidget].
  ProjectCardWidgetProvider(
    Project project,
  ) : this._internal(
          () => ProjectCardWidget()..project = project,
          from: projectCardWidgetProvider,
          name: r'projectCardWidgetProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$projectCardWidgetHash,
          dependencies: ProjectCardWidgetFamily._dependencies,
          allTransitiveDependencies:
              ProjectCardWidgetFamily._allTransitiveDependencies,
          project: project,
        );

  ProjectCardWidgetProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.project,
  }) : super.internal();

  final Project project;

  @override
  ProjectCardState runNotifierBuild(
    covariant ProjectCardWidget notifier,
  ) {
    return notifier.build(
      project,
    );
  }

  @override
  Override overrideWith(ProjectCardWidget Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProjectCardWidgetProvider._internal(
        () => create()..project = project,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        project: project,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<ProjectCardWidget, ProjectCardState>
      createElement() {
    return _ProjectCardWidgetProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectCardWidgetProvider && other.project == project;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, project.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ProjectCardWidgetRef on AutoDisposeNotifierProviderRef<ProjectCardState> {
  /// The parameter `project` of this provider.
  Project get project;
}

class _ProjectCardWidgetProviderElement
    extends AutoDisposeNotifierProviderElement<ProjectCardWidget,
        ProjectCardState> with ProjectCardWidgetRef {
  _ProjectCardWidgetProviderElement(super.provider);

  @override
  Project get project => (origin as ProjectCardWidgetProvider).project;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
