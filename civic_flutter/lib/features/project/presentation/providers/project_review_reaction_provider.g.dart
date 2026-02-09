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
  const ReviewReactionProvider._({
    required ReviewReactionFamily super.from,
    required ProjectReviewWithUserStateKey? super.argument,
  }) : super(
         retry: null,
         name: r'reviewReactionProvider',
         isAutoDispose: false,
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

String _$reviewReactionHash() => r'782f985b1f6285d202fec4745783b1fd7867fda7';

final class ReviewReactionFamily extends $Family
    with
        $ClassFamilyOverride<
          ReviewReaction,
          ProjectReviewReactionState,
          ProjectReviewReactionState,
          ProjectReviewReactionState,
          ProjectReviewWithUserStateKey?
        > {
  const ReviewReactionFamily._()
    : super(
        retry: null,
        name: r'reviewReactionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  ReviewReactionProvider call(ProjectReviewWithUserStateKey? key) =>
      ReviewReactionProvider._(argument: key, from: this);

  @override
  String toString() => r'reviewReactionProvider';
}

abstract class _$ReviewReaction extends $Notifier<ProjectReviewReactionState> {
  late final _$args = ref.$arg as ProjectReviewWithUserStateKey?;
  ProjectReviewWithUserStateKey? get key => _$args;

  ProjectReviewReactionState build(ProjectReviewWithUserStateKey? key);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref
            as $Ref<ProjectReviewReactionState, ProjectReviewReactionState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                ProjectReviewReactionState,
                ProjectReviewReactionState
              >,
              ProjectReviewReactionState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
