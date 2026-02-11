// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_review_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProjectReviewProvider)
final projectReviewProviderProvider = ProjectReviewProviderFamily._();

final class ProjectReviewProviderProvider
    extends $NotifierProvider<ProjectReviewProvider, ProjectReviewState> {
  ProjectReviewProviderProvider._({
    required ProjectReviewProviderFamily super.from,
    required ProjectReview? super.argument,
  }) : super(
         retry: null,
         name: r'projectReviewProviderProvider',
         isAutoDispose: false,
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
    r'4e432fa6712658a971948b64750ac1c2ffc230b1';

final class ProjectReviewProviderFamily extends $Family
    with
        $ClassFamilyOverride<
          ProjectReviewProvider,
          ProjectReviewState,
          ProjectReviewState,
          ProjectReviewState,
          ProjectReview?
        > {
  ProjectReviewProviderFamily._()
    : super(
        retry: null,
        name: r'projectReviewProviderProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  ProjectReviewProviderProvider call(ProjectReview? projectReview) =>
      ProjectReviewProviderProvider._(argument: projectReview, from: this);

  @override
  String toString() => r'projectReviewProviderProvider';
}

abstract class _$ProjectReviewProvider extends $Notifier<ProjectReviewState> {
  late final _$args = ref.$arg as ProjectReview?;
  ProjectReview? get projectReview => _$args;

  ProjectReviewState build(ProjectReview? projectReview);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ProjectReviewState, ProjectReviewState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ProjectReviewState, ProjectReviewState>,
              ProjectReviewState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
