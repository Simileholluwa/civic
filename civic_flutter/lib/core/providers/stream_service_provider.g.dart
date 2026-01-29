// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stream_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(projectReviewStream)
const projectReviewStreamProvider = ProjectReviewStreamFamily._();

final class ProjectReviewStreamProvider
    extends
        $FunctionalProvider<
          AsyncValue<ProjectReview>,
          ProjectReview,
          Stream<ProjectReview>
        >
    with $FutureModifier<ProjectReview>, $StreamProvider<ProjectReview> {
  const ProjectReviewStreamProvider._({
    required ProjectReviewStreamFamily super.from,
    required (int, ProjectReview?) super.argument,
  }) : super(
         retry: null,
         name: r'projectReviewStreamProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$projectReviewStreamHash();

  @override
  String toString() {
    return r'projectReviewStreamProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $StreamProviderElement<ProjectReview> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<ProjectReview> create(Ref ref) {
    final argument = this.argument as (int, ProjectReview?);
    return projectReviewStream(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectReviewStreamProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$projectReviewStreamHash() =>
    r'bc35376124017c77050ad7c9964c56da25a02c1a';

final class ProjectReviewStreamFamily extends $Family
    with
        $FunctionalFamilyOverride<
          Stream<ProjectReview>,
          (int, ProjectReview?)
        > {
  const ProjectReviewStreamFamily._()
    : super(
        retry: null,
        name: r'projectReviewStreamProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  ProjectReviewStreamProvider call(
    int projectReviewId,
    ProjectReview? projectReview,
  ) => ProjectReviewStreamProvider._(
    argument: (projectReviewId, projectReview),
    from: this,
  );

  @override
  String toString() => r'projectReviewStreamProvider';
}

@ProviderFor(projectVettingStream)
const projectVettingStreamProvider = ProjectVettingStreamFamily._();

final class ProjectVettingStreamProvider
    extends
        $FunctionalProvider<
          AsyncValue<ProjectVetting>,
          ProjectVetting,
          Stream<ProjectVetting>
        >
    with $FutureModifier<ProjectVetting>, $StreamProvider<ProjectVetting> {
  const ProjectVettingStreamProvider._({
    required ProjectVettingStreamFamily super.from,
    required (int, ProjectVetting?) super.argument,
  }) : super(
         retry: null,
         name: r'projectVettingStreamProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$projectVettingStreamHash();

  @override
  String toString() {
    return r'projectVettingStreamProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $StreamProviderElement<ProjectVetting> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<ProjectVetting> create(Ref ref) {
    final argument = this.argument as (int, ProjectVetting?);
    return projectVettingStream(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectVettingStreamProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$projectVettingStreamHash() =>
    r'609f5ae979383fa563f25ace1b2ba9667326a710';

final class ProjectVettingStreamFamily extends $Family
    with
        $FunctionalFamilyOverride<
          Stream<ProjectVetting>,
          (int, ProjectVetting?)
        > {
  const ProjectVettingStreamFamily._()
    : super(
        retry: null,
        name: r'projectVettingStreamProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  ProjectVettingStreamProvider call(
    int vettingId,
    ProjectVetting? projectVetting,
  ) => ProjectVettingStreamProvider._(
    argument: (vettingId, projectVetting),
    from: this,
  );

  @override
  String toString() => r'projectVettingStreamProvider';
}
