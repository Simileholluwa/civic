// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_review_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$projectReviewDetailHash() =>
    r'932dd5682fd24d7c5e6d7a09068631d3094a1fda';

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

/// See also [projectReviewDetail].
@ProviderFor(projectReviewDetail)
const projectReviewDetailProvider = ProjectReviewDetailFamily();

/// See also [projectReviewDetail].
class ProjectReviewDetailFamily extends Family<AsyncValue<ProjectReview?>> {
  /// See also [projectReviewDetail].
  const ProjectReviewDetailFamily();

  /// See also [projectReviewDetail].
  ProjectReviewDetailProvider call(
    int id,
  ) {
    return ProjectReviewDetailProvider(
      id,
    );
  }

  @override
  ProjectReviewDetailProvider getProviderOverride(
    covariant ProjectReviewDetailProvider provider,
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
  String? get name => r'projectReviewDetailProvider';
}

/// See also [projectReviewDetail].
class ProjectReviewDetailProvider
    extends AutoDisposeFutureProvider<ProjectReview?> {
  /// See also [projectReviewDetail].
  ProjectReviewDetailProvider(
    int id,
  ) : this._internal(
          (ref) => projectReviewDetail(
            ref as ProjectReviewDetailRef,
            id,
          ),
          from: projectReviewDetailProvider,
          name: r'projectReviewDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$projectReviewDetailHash,
          dependencies: ProjectReviewDetailFamily._dependencies,
          allTransitiveDependencies:
              ProjectReviewDetailFamily._allTransitiveDependencies,
          id: id,
        );

  ProjectReviewDetailProvider._internal(
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
    FutureOr<ProjectReview?> Function(ProjectReviewDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProjectReviewDetailProvider._internal(
        (ref) => create(ref as ProjectReviewDetailRef),
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
  AutoDisposeFutureProviderElement<ProjectReview?> createElement() {
    return _ProjectReviewDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectReviewDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ProjectReviewDetailRef on AutoDisposeFutureProviderRef<ProjectReview?> {
  /// The parameter `id` of this provider.
  int get id;
}

class _ProjectReviewDetailProviderElement
    extends AutoDisposeFutureProviderElement<ProjectReview?>
    with ProjectReviewDetailRef {
  _ProjectReviewDetailProviderElement(super.provider);

  @override
  int get id => (origin as ProjectReviewDetailProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
