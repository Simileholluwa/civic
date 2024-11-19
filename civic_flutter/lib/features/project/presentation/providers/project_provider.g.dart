// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$projectProviderHash() => r'551d94e0ba915ebcadd87a596867de05c85da37e';

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

abstract class _$ProjectProvider
    extends BuildlessAutoDisposeNotifier<ProjectState> {
  late final Project? project;

  ProjectState build(
    Project? project,
  );
}

/// See also [ProjectProvider].
@ProviderFor(ProjectProvider)
const projectProviderProvider = ProjectProviderFamily();

/// See also [ProjectProvider].
class ProjectProviderFamily extends Family<ProjectState> {
  /// See also [ProjectProvider].
  const ProjectProviderFamily();

  /// See also [ProjectProvider].
  ProjectProviderProvider call(
    Project? project,
  ) {
    return ProjectProviderProvider(
      project,
    );
  }

  @override
  ProjectProviderProvider getProviderOverride(
    covariant ProjectProviderProvider provider,
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
  String? get name => r'projectProviderProvider';
}

/// See also [ProjectProvider].
class ProjectProviderProvider
    extends AutoDisposeNotifierProviderImpl<ProjectProvider, ProjectState> {
  /// See also [ProjectProvider].
  ProjectProviderProvider(
    Project? project,
  ) : this._internal(
          () => ProjectProvider()..project = project,
          from: projectProviderProvider,
          name: r'projectProviderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$projectProviderHash,
          dependencies: ProjectProviderFamily._dependencies,
          allTransitiveDependencies:
              ProjectProviderFamily._allTransitiveDependencies,
          project: project,
        );

  ProjectProviderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.project,
  }) : super.internal();

  final Project? project;

  @override
  ProjectState runNotifierBuild(
    covariant ProjectProvider notifier,
  ) {
    return notifier.build(
      project,
    );
  }

  @override
  Override overrideWith(ProjectProvider Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProjectProviderProvider._internal(
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
  AutoDisposeNotifierProviderElement<ProjectProvider, ProjectState>
      createElement() {
    return _ProjectProviderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectProviderProvider && other.project == project;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, project.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ProjectProviderRef on AutoDisposeNotifierProviderRef<ProjectState> {
  /// The parameter `project` of this provider.
  Project? get project;
}

class _ProjectProviderProviderElement
    extends AutoDisposeNotifierProviderElement<ProjectProvider, ProjectState>
    with ProjectProviderRef {
  _ProjectProviderProviderElement(super.provider);

  @override
  Project? get project => (origin as ProjectProviderProvider).project;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
