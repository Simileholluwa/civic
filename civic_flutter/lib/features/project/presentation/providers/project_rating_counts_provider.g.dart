// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_rating_counts_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProjectOverallRatingCounts)
const projectOverallRatingCountsProvider = ProjectOverallRatingCountsFamily._();

final class ProjectOverallRatingCountsProvider
    extends
        $NotifierProvider<
          ProjectOverallRatingCounts,
          ProjectOverallRatingState
        > {
  const ProjectOverallRatingCountsProvider._({
    required ProjectOverallRatingCountsFamily super.from,
    required Project? super.argument,
  }) : super(
         retry: null,
         name: r'projectOverallRatingCountsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$projectOverallRatingCountsHash();

  @override
  String toString() {
    return r'projectOverallRatingCountsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ProjectOverallRatingCounts create() => ProjectOverallRatingCounts();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProjectOverallRatingState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProjectOverallRatingState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectOverallRatingCountsProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$projectOverallRatingCountsHash() =>
    r'9b6d9311e1566dc20452ddd0d6c3f82fd5cc5164';

final class ProjectOverallRatingCountsFamily extends $Family
    with
        $ClassFamilyOverride<
          ProjectOverallRatingCounts,
          ProjectOverallRatingState,
          ProjectOverallRatingState,
          ProjectOverallRatingState,
          Project?
        > {
  const ProjectOverallRatingCountsFamily._()
    : super(
        retry: null,
        name: r'projectOverallRatingCountsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProjectOverallRatingCountsProvider call(Project? project) =>
      ProjectOverallRatingCountsProvider._(argument: project, from: this);

  @override
  String toString() => r'projectOverallRatingCountsProvider';
}

abstract class _$ProjectOverallRatingCounts
    extends $Notifier<ProjectOverallRatingState> {
  late final _$args = ref.$arg as Project?;
  Project? get project => _$args;

  ProjectOverallRatingState build(Project? project);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref as $Ref<ProjectOverallRatingState, ProjectOverallRatingState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ProjectOverallRatingState, ProjectOverallRatingState>,
              ProjectOverallRatingState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
