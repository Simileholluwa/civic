// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_review_reaction_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$reviewReactionHash() => r'60f7ff6b925df5b0775ea495ab97e45b6539335e';

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

abstract class _$ReviewReaction
    extends BuildlessAutoDisposeNotifier<ProjectReviewReactionState> {
  late final ProjectReview projectReview;

  ProjectReviewReactionState build(
    ProjectReview projectReview,
  );
}

/// See also [ReviewReaction].
@ProviderFor(ReviewReaction)
const reviewReactionProvider = ReviewReactionFamily();

/// See also [ReviewReaction].
class ReviewReactionFamily extends Family<ProjectReviewReactionState> {
  /// See also [ReviewReaction].
  const ReviewReactionFamily();

  /// See also [ReviewReaction].
  ReviewReactionProvider call(
    ProjectReview projectReview,
  ) {
    return ReviewReactionProvider(
      projectReview,
    );
  }

  @override
  ReviewReactionProvider getProviderOverride(
    covariant ReviewReactionProvider provider,
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
  String? get name => r'reviewReactionProvider';
}

/// See also [ReviewReaction].
class ReviewReactionProvider extends AutoDisposeNotifierProviderImpl<
    ReviewReaction, ProjectReviewReactionState> {
  /// See also [ReviewReaction].
  ReviewReactionProvider(
    ProjectReview projectReview,
  ) : this._internal(
          () => ReviewReaction()..projectReview = projectReview,
          from: reviewReactionProvider,
          name: r'reviewReactionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$reviewReactionHash,
          dependencies: ReviewReactionFamily._dependencies,
          allTransitiveDependencies:
              ReviewReactionFamily._allTransitiveDependencies,
          projectReview: projectReview,
        );

  ReviewReactionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.projectReview,
  }) : super.internal();

  final ProjectReview projectReview;

  @override
  ProjectReviewReactionState runNotifierBuild(
    covariant ReviewReaction notifier,
  ) {
    return notifier.build(
      projectReview,
    );
  }

  @override
  Override overrideWith(ReviewReaction Function() create) {
    return ProviderOverride(
      origin: this,
      override: ReviewReactionProvider._internal(
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
  AutoDisposeNotifierProviderElement<ReviewReaction, ProjectReviewReactionState>
      createElement() {
    return _ReviewReactionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ReviewReactionProvider &&
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
mixin ReviewReactionRef
    on AutoDisposeNotifierProviderRef<ProjectReviewReactionState> {
  /// The parameter `projectReview` of this provider.
  ProjectReview get projectReview;
}

class _ReviewReactionProviderElement extends AutoDisposeNotifierProviderElement<
    ReviewReaction, ProjectReviewReactionState> with ReviewReactionRef {
  _ReviewReactionProviderElement(super.provider);

  @override
  ProjectReview get projectReview =>
      (origin as ReviewReactionProvider).projectReview;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
