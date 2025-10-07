// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_review_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProjectReviewProvider)
const projectReviewProviderProvider = ProjectReviewProviderFamily._();

final class ProjectReviewProviderProvider
    extends $NotifierProvider<ProjectReviewProvider, ProjectReviewState> {
  const ProjectReviewProviderProvider._(
      {required ProjectReviewProviderFamily super.from,
      required ProjectReview? super.argument})
      : super(
          retry: null,
          name: r'projectReviewProviderProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$projectReviewProviderHash();

  @override
  String toString() {
    return r'projectReviewProviderProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ProjectReviewProvider create() => ProjectReviewProvider();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProjectReviewState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProjectReviewState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectReviewProviderProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$projectReviewProviderHash() =>
    r'a53d8940fb63bdec8e7c5c63f94b2d164d45653b';

final class ProjectReviewProviderFamily extends $Family
    with
        $ClassFamilyOverride<ProjectReviewProvider, ProjectReviewState,
            ProjectReviewState, ProjectReviewState, ProjectReview?> {
  const ProjectReviewProviderFamily._()
      : super(
          retry: null,
          name: r'projectReviewProviderProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  ProjectReviewProviderProvider call(
    ProjectReview? projectReview,
  ) =>
      ProjectReviewProviderProvider._(argument: projectReview, from: this);

  @override
  String toString() => r'projectReviewProviderProvider';
}

abstract class _$ProjectReviewProvider extends $Notifier<ProjectReviewState> {
  late final _$args = ref.$arg as ProjectReview?;
  ProjectReview? get projectReview => _$args;

  ProjectReviewState build(
    ProjectReview? projectReview,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args,
    );
    final ref = this.ref as $Ref<ProjectReviewState, ProjectReviewState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<ProjectReviewState, ProjectReviewState>,
        ProjectReviewState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
