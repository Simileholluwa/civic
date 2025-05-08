// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stream_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$projectStreamHash() => r'3867216eb4304c6ca0ec942f1e0bb090930fb6b3';

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

/// See also [projectStream].
@ProviderFor(projectStream)
const projectStreamProvider = ProjectStreamFamily();

/// See also [projectStream].
class ProjectStreamFamily extends Family<AsyncValue<Project>> {
  /// See also [projectStream].
  const ProjectStreamFamily();

  /// See also [projectStream].
  ProjectStreamProvider call(
    int projectId,
    Project? project,
  ) {
    return ProjectStreamProvider(
      projectId,
      project,
    );
  }

  @override
  ProjectStreamProvider getProviderOverride(
    covariant ProjectStreamProvider provider,
  ) {
    return call(
      provider.projectId,
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
  String? get name => r'projectStreamProvider';
}

/// See also [projectStream].
class ProjectStreamProvider extends StreamProvider<Project> {
  /// See also [projectStream].
  ProjectStreamProvider(
    int projectId,
    Project? project,
  ) : this._internal(
          (ref) => projectStream(
            ref as ProjectStreamRef,
            projectId,
            project,
          ),
          from: projectStreamProvider,
          name: r'projectStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$projectStreamHash,
          dependencies: ProjectStreamFamily._dependencies,
          allTransitiveDependencies:
              ProjectStreamFamily._allTransitiveDependencies,
          projectId: projectId,
          project: project,
        );

  ProjectStreamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.projectId,
    required this.project,
  }) : super.internal();

  final int projectId;
  final Project? project;

  @override
  Override overrideWith(
    Stream<Project> Function(ProjectStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProjectStreamProvider._internal(
        (ref) => create(ref as ProjectStreamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        projectId: projectId,
        project: project,
      ),
    );
  }

  @override
  StreamProviderElement<Project> createElement() {
    return _ProjectStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectStreamProvider &&
        other.projectId == projectId &&
        other.project == project;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, projectId.hashCode);
    hash = _SystemHash.combine(hash, project.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ProjectStreamRef on StreamProviderRef<Project> {
  /// The parameter `projectId` of this provider.
  int get projectId;

  /// The parameter `project` of this provider.
  Project? get project;
}

class _ProjectStreamProviderElement extends StreamProviderElement<Project>
    with ProjectStreamRef {
  _ProjectStreamProviderElement(super.provider);

  @override
  int get projectId => (origin as ProjectStreamProvider).projectId;
  @override
  Project? get project => (origin as ProjectStreamProvider).project;
}

String _$projectReviewStreamHash() =>
    r'bc35376124017c77050ad7c9964c56da25a02c1a';

/// See also [projectReviewStream].
@ProviderFor(projectReviewStream)
const projectReviewStreamProvider = ProjectReviewStreamFamily();

/// See also [projectReviewStream].
class ProjectReviewStreamFamily extends Family<AsyncValue<ProjectReview>> {
  /// See also [projectReviewStream].
  const ProjectReviewStreamFamily();

  /// See also [projectReviewStream].
  ProjectReviewStreamProvider call(
    int projectReviewId,
    ProjectReview? projectReview,
  ) {
    return ProjectReviewStreamProvider(
      projectReviewId,
      projectReview,
    );
  }

  @override
  ProjectReviewStreamProvider getProviderOverride(
    covariant ProjectReviewStreamProvider provider,
  ) {
    return call(
      provider.projectReviewId,
      provider.projectReview,
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
  String? get name => r'projectReviewStreamProvider';
}

/// See also [projectReviewStream].
class ProjectReviewStreamProvider extends StreamProvider<ProjectReview> {
  /// See also [projectReviewStream].
  ProjectReviewStreamProvider(
    int projectReviewId,
    ProjectReview? projectReview,
  ) : this._internal(
          (ref) => projectReviewStream(
            ref as ProjectReviewStreamRef,
            projectReviewId,
            projectReview,
          ),
          from: projectReviewStreamProvider,
          name: r'projectReviewStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$projectReviewStreamHash,
          dependencies: ProjectReviewStreamFamily._dependencies,
          allTransitiveDependencies:
              ProjectReviewStreamFamily._allTransitiveDependencies,
          projectReviewId: projectReviewId,
          projectReview: projectReview,
        );

  ProjectReviewStreamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.projectReviewId,
    required this.projectReview,
  }) : super.internal();

  final int projectReviewId;
  final ProjectReview? projectReview;

  @override
  Override overrideWith(
    Stream<ProjectReview> Function(ProjectReviewStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProjectReviewStreamProvider._internal(
        (ref) => create(ref as ProjectReviewStreamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        projectReviewId: projectReviewId,
        projectReview: projectReview,
      ),
    );
  }

  @override
  StreamProviderElement<ProjectReview> createElement() {
    return _ProjectReviewStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectReviewStreamProvider &&
        other.projectReviewId == projectReviewId &&
        other.projectReview == projectReview;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, projectReviewId.hashCode);
    hash = _SystemHash.combine(hash, projectReview.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ProjectReviewStreamRef on StreamProviderRef<ProjectReview> {
  /// The parameter `projectReviewId` of this provider.
  int get projectReviewId;

  /// The parameter `projectReview` of this provider.
  ProjectReview? get projectReview;
}

class _ProjectReviewStreamProviderElement
    extends StreamProviderElement<ProjectReview> with ProjectReviewStreamRef {
  _ProjectReviewStreamProviderElement(super.provider);

  @override
  int get projectReviewId =>
      (origin as ProjectReviewStreamProvider).projectReviewId;
  @override
  ProjectReview? get projectReview =>
      (origin as ProjectReviewStreamProvider).projectReview;
}

String _$projectVettingStreamHash() =>
    r'609f5ae979383fa563f25ace1b2ba9667326a710';

/// See also [projectVettingStream].
@ProviderFor(projectVettingStream)
const projectVettingStreamProvider = ProjectVettingStreamFamily();

/// See also [projectVettingStream].
class ProjectVettingStreamFamily extends Family<AsyncValue<ProjectVetting>> {
  /// See also [projectVettingStream].
  const ProjectVettingStreamFamily();

  /// See also [projectVettingStream].
  ProjectVettingStreamProvider call(
    int vettingId,
    ProjectVetting? projectVetting,
  ) {
    return ProjectVettingStreamProvider(
      vettingId,
      projectVetting,
    );
  }

  @override
  ProjectVettingStreamProvider getProviderOverride(
    covariant ProjectVettingStreamProvider provider,
  ) {
    return call(
      provider.vettingId,
      provider.projectVetting,
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
  String? get name => r'projectVettingStreamProvider';
}

/// See also [projectVettingStream].
class ProjectVettingStreamProvider extends StreamProvider<ProjectVetting> {
  /// See also [projectVettingStream].
  ProjectVettingStreamProvider(
    int vettingId,
    ProjectVetting? projectVetting,
  ) : this._internal(
          (ref) => projectVettingStream(
            ref as ProjectVettingStreamRef,
            vettingId,
            projectVetting,
          ),
          from: projectVettingStreamProvider,
          name: r'projectVettingStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$projectVettingStreamHash,
          dependencies: ProjectVettingStreamFamily._dependencies,
          allTransitiveDependencies:
              ProjectVettingStreamFamily._allTransitiveDependencies,
          vettingId: vettingId,
          projectVetting: projectVetting,
        );

  ProjectVettingStreamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.vettingId,
    required this.projectVetting,
  }) : super.internal();

  final int vettingId;
  final ProjectVetting? projectVetting;

  @override
  Override overrideWith(
    Stream<ProjectVetting> Function(ProjectVettingStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProjectVettingStreamProvider._internal(
        (ref) => create(ref as ProjectVettingStreamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        vettingId: vettingId,
        projectVetting: projectVetting,
      ),
    );
  }

  @override
  StreamProviderElement<ProjectVetting> createElement() {
    return _ProjectVettingStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectVettingStreamProvider &&
        other.vettingId == vettingId &&
        other.projectVetting == projectVetting;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, vettingId.hashCode);
    hash = _SystemHash.combine(hash, projectVetting.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ProjectVettingStreamRef on StreamProviderRef<ProjectVetting> {
  /// The parameter `vettingId` of this provider.
  int get vettingId;

  /// The parameter `projectVetting` of this provider.
  ProjectVetting? get projectVetting;
}

class _ProjectVettingStreamProviderElement
    extends StreamProviderElement<ProjectVetting> with ProjectVettingStreamRef {
  _ProjectVettingStreamProviderElement(super.provider);

  @override
  int get vettingId => (origin as ProjectVettingStreamProvider).vettingId;
  @override
  ProjectVetting? get projectVetting =>
      (origin as ProjectVettingStreamProvider).projectVetting;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
