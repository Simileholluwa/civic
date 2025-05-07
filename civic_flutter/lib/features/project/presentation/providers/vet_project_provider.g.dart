// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vet_project_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$projectVetHash() => r'c7030ce5af134f078a7938a8fd9bf24792c26562';

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

abstract class _$ProjectVet
    extends BuildlessAutoDisposeNotifier<VetProjectState> {
  late final ProjectVetting? projectVetting;

  VetProjectState build(
    ProjectVetting? projectVetting,
  );
}

/// See also [ProjectVet].
@ProviderFor(ProjectVet)
const projectVetProvider = ProjectVetFamily();

/// See also [ProjectVet].
class ProjectVetFamily extends Family<VetProjectState> {
  /// See also [ProjectVet].
  const ProjectVetFamily();

  /// See also [ProjectVet].
  ProjectVetProvider call(
    ProjectVetting? projectVetting,
  ) {
    return ProjectVetProvider(
      projectVetting,
    );
  }

  @override
  ProjectVetProvider getProviderOverride(
    covariant ProjectVetProvider provider,
  ) {
    return call(
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
  String? get name => r'projectVetProvider';
}

/// See also [ProjectVet].
class ProjectVetProvider
    extends AutoDisposeNotifierProviderImpl<ProjectVet, VetProjectState> {
  /// See also [ProjectVet].
  ProjectVetProvider(
    ProjectVetting? projectVetting,
  ) : this._internal(
          () => ProjectVet()..projectVetting = projectVetting,
          from: projectVetProvider,
          name: r'projectVetProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$projectVetHash,
          dependencies: ProjectVetFamily._dependencies,
          allTransitiveDependencies:
              ProjectVetFamily._allTransitiveDependencies,
          projectVetting: projectVetting,
        );

  ProjectVetProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.projectVetting,
  }) : super.internal();

  final ProjectVetting? projectVetting;

  @override
  VetProjectState runNotifierBuild(
    covariant ProjectVet notifier,
  ) {
    return notifier.build(
      projectVetting,
    );
  }

  @override
  Override overrideWith(ProjectVet Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProjectVetProvider._internal(
        () => create()..projectVetting = projectVetting,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        projectVetting: projectVetting,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<ProjectVet, VetProjectState>
      createElement() {
    return _ProjectVetProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectVetProvider &&
        other.projectVetting == projectVetting;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, projectVetting.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ProjectVetRef on AutoDisposeNotifierProviderRef<VetProjectState> {
  /// The parameter `projectVetting` of this provider.
  ProjectVetting? get projectVetting;
}

class _ProjectVetProviderElement
    extends AutoDisposeNotifierProviderElement<ProjectVet, VetProjectState>
    with ProjectVetRef {
  _ProjectVetProviderElement(super.provider);

  @override
  ProjectVetting? get projectVetting =>
      (origin as ProjectVetProvider).projectVetting;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
