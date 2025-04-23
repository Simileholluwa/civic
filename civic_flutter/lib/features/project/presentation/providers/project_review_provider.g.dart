// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_review_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$projectReviewProviderHash() =>
    r'0d03172434d8d2ec7f681335dfbb23fae9165401';

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

abstract class _$ProjectReviewProvider
    extends BuildlessAutoDisposeNotifier<ProjectReviewState> {
  late final ProjectReview? projectReview;

  ProjectReviewState build(
    ProjectReview? projectReview,
  );
}

/// See also [ProjectReviewProvider].
@ProviderFor(ProjectReviewProvider)
const projectReviewProviderProvider = ProjectReviewProviderFamily();

/// See also [ProjectReviewProvider].
class ProjectReviewProviderFamily extends Family<ProjectReviewState> {
  /// See also [ProjectReviewProvider].
  const ProjectReviewProviderFamily();

  /// See also [ProjectReviewProvider].
  ProjectReviewProviderProvider call(
    ProjectReview? projectReview,
  ) {
    return ProjectReviewProviderProvider(
      projectReview,
    );
  }

  @override
  ProjectReviewProviderProvider getProviderOverride(
    covariant ProjectReviewProviderProvider provider,
  ) {
    return call(
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
  String? get name => r'projectReviewProviderProvider';
}

/// See also [ProjectReviewProvider].
class ProjectReviewProviderProvider extends AutoDisposeNotifierProviderImpl<
    ProjectReviewProvider, ProjectReviewState> {
  /// See also [ProjectReviewProvider].
  ProjectReviewProviderProvider(
    ProjectReview? projectReview,
  ) : this._internal(
          () => ProjectReviewProvider()..projectReview = projectReview,
          from: projectReviewProviderProvider,
          name: r'projectReviewProviderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$projectReviewProviderHash,
          dependencies: ProjectReviewProviderFamily._dependencies,
          allTransitiveDependencies:
              ProjectReviewProviderFamily._allTransitiveDependencies,
          projectReview: projectReview,
        );

  ProjectReviewProviderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.projectReview,
  }) : super.internal();

  final ProjectReview? projectReview;

  @override
  ProjectReviewState runNotifierBuild(
    covariant ProjectReviewProvider notifier,
  ) {
    return notifier.build(
      projectReview,
    );
  }

  @override
  Override overrideWith(ProjectReviewProvider Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProjectReviewProviderProvider._internal(
        () => create()..projectReview = projectReview,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        projectReview: projectReview,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<ProjectReviewProvider, ProjectReviewState>
      createElement() {
    return _ProjectReviewProviderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectReviewProviderProvider &&
        other.projectReview == projectReview;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, projectReview.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ProjectReviewProviderRef
    on AutoDisposeNotifierProviderRef<ProjectReviewState> {
  /// The parameter `projectReview` of this provider.
  ProjectReview? get projectReview;
}

class _ProjectReviewProviderProviderElement
    extends AutoDisposeNotifierProviderElement<ProjectReviewProvider,
        ProjectReviewState> with ProjectReviewProviderRef {
  _ProjectReviewProviderProviderElement(super.provider);

  @override
  ProjectReview? get projectReview =>
      (origin as ProjectReviewProviderProvider).projectReview;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
