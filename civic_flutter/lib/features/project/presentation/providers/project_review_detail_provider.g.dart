// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_review_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(projectReviewDetail)
final projectReviewDetailProvider = ProjectReviewDetailFamily._();

final class ProjectReviewDetailProvider
    extends
        $FunctionalProvider<
          AsyncValue<ProjectReview?>,
          ProjectReview?,
          FutureOr<ProjectReview?>
        >
    with $FutureModifier<ProjectReview?>, $FutureProvider<ProjectReview?> {
  ProjectReviewDetailProvider._({
    required ProjectReviewDetailFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'projectReviewDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$projectReviewDetailHash();

  @override
  String toString() {
    return r'projectReviewDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<ProjectReview?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ProjectReview?> create(Ref ref) {
    final argument = this.argument as int;
    return projectReviewDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectReviewDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$projectReviewDetailHash() =>
    r'64f47b54793cadfb8035a7ca5c63e85ad7ccd342';

final class ProjectReviewDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<ProjectReview?>, int> {
  ProjectReviewDetailFamily._()
    : super(
        retry: null,
        name: r'projectReviewDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProjectReviewDetailProvider call(int id) =>
      ProjectReviewDetailProvider._(argument: id, from: this);

  @override
  String toString() => r'projectReviewDetailProvider';
}
