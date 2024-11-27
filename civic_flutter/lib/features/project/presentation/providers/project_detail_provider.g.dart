// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$projectDetailHash() => r'fafc27a5ae52df973ea6a4a9c6da2ad7b50e5608';

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

/// See also [projectDetail].
@ProviderFor(projectDetail)
const projectDetailProvider = ProjectDetailFamily();

/// See also [projectDetail].
class ProjectDetailFamily extends Family<AsyncValue<Project?>> {
  /// See also [projectDetail].
  const ProjectDetailFamily();

  /// See also [projectDetail].
  ProjectDetailProvider call(
    int id,
  ) {
    return ProjectDetailProvider(
      id,
    );
  }

  @override
  ProjectDetailProvider getProviderOverride(
    covariant ProjectDetailProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'projectDetailProvider';
}

/// See also [projectDetail].
class ProjectDetailProvider extends AutoDisposeFutureProvider<Project?> {
  /// See also [projectDetail].
  ProjectDetailProvider(
    int id,
  ) : this._internal(
          (ref) => projectDetail(
            ref as ProjectDetailRef,
            id,
          ),
          from: projectDetailProvider,
          name: r'projectDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$projectDetailHash,
          dependencies: ProjectDetailFamily._dependencies,
          allTransitiveDependencies:
              ProjectDetailFamily._allTransitiveDependencies,
          id: id,
        );

  ProjectDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<Project?> Function(ProjectDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProjectDetailProvider._internal(
        (ref) => create(ref as ProjectDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Project?> createElement() {
    return _ProjectDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ProjectDetailRef on AutoDisposeFutureProviderRef<Project?> {
  /// The parameter `id` of this provider.
  int get id;
}

class _ProjectDetailProviderElement
    extends AutoDisposeFutureProviderElement<Project?> with ProjectDetailRef {
  _ProjectDetailProviderElement(super.provider);

  @override
  int get id => (origin as ProjectDetailProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
