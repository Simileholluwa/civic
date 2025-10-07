// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_review_reaction_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ReviewReaction)
const reviewReactionProvider = ReviewReactionFamily._();

final class ReviewReactionProvider
    extends $NotifierProvider<ReviewReaction, ProjectReviewReactionState> {
  const ReviewReactionProvider._(
      {required ReviewReactionFamily super.from,
      required ProjectReview super.argument})
      : super(
          retry: null,
          name: r'reviewReactionProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$reviewReactionHash();

  @override
  String toString() {
    return r'reviewReactionProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ReviewReaction create() => ReviewReaction();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProjectReviewReactionState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProjectReviewReactionState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ReviewReactionProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$reviewReactionHash() => r'786587b67f4669dab9afe3585ae2e46800c7a82c';

final class ReviewReactionFamily extends $Family
    with
        $ClassFamilyOverride<
            ReviewReaction,
            ProjectReviewReactionState,
            ProjectReviewReactionState,
            ProjectReviewReactionState,
            ProjectReview> {
  const ReviewReactionFamily._()
      : super(
          retry: null,
          name: r'reviewReactionProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  ReviewReactionProvider call(
    ProjectReview projectReview,
  ) =>
      ReviewReactionProvider._(argument: projectReview, from: this);

  @override
  String toString() => r'reviewReactionProvider';
}

abstract class _$ReviewReaction extends $Notifier<ProjectReviewReactionState> {
  late final _$args = ref.$arg as ProjectReview;
  ProjectReview get projectReview => _$args;

  ProjectReviewReactionState build(
    ProjectReview projectReview,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args,
    );
    final ref = this.ref
        as $Ref<ProjectReviewReactionState, ProjectReviewReactionState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<ProjectReviewReactionState, ProjectReviewReactionState>,
        ProjectReviewReactionState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
