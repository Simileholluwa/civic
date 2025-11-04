// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_paginated_review_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PaginatedProjectReviewList)
const paginatedProjectReviewListProvider = PaginatedProjectReviewListFamily._();

final class PaginatedProjectReviewListProvider
    extends $NotifierProvider<PaginatedProjectReviewList, PagingStatus> {
  const PaginatedProjectReviewListProvider._(
      {required PaginatedProjectReviewListFamily super.from,
      required int super.argument})
      : super(
          retry: null,
          name: r'paginatedProjectReviewListProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$paginatedProjectReviewListHash();

  @override
  String toString() {
    return r'paginatedProjectReviewListProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PaginatedProjectReviewList create() => PaginatedProjectReviewList();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PagingStatus value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PagingStatus>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PaginatedProjectReviewListProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$paginatedProjectReviewListHash() =>
    r'd5f53f8df2fb4b90094dd602c3fe38879d2d1b66';

final class PaginatedProjectReviewListFamily extends $Family
    with
        $ClassFamilyOverride<PaginatedProjectReviewList, PagingStatus,
            PagingStatus, PagingStatus, int> {
  const PaginatedProjectReviewListFamily._()
      : super(
          retry: null,
          name: r'paginatedProjectReviewListProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: false,
        );

  PaginatedProjectReviewListProvider call(
    int projectId,
  ) =>
      PaginatedProjectReviewListProvider._(argument: projectId, from: this);

  @override
  String toString() => r'paginatedProjectReviewListProvider';
}

abstract class _$PaginatedProjectReviewList extends $Notifier<PagingStatus> {
  late final _$args = ref.$arg as int;
  int get projectId => _$args;

  PagingStatus build(
    int projectId,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args,
    );
    final ref = this.ref as $Ref<PagingStatus, PagingStatus>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<PagingStatus, PagingStatus>,
        PagingStatus,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

@ProviderFor(ProjectReviewListQuery)
const projectReviewListQueryProvider = ProjectReviewListQueryProvider._();

final class ProjectReviewListQueryProvider
    extends $NotifierProvider<ProjectReviewListQuery, ProjectReviewQueryState> {
  const ProjectReviewListQueryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'projectReviewListQueryProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$projectReviewListQueryHash();

  @$internal
  @override
  ProjectReviewListQuery create() => ProjectReviewListQuery();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProjectReviewQueryState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProjectReviewQueryState>(value),
    );
  }
}

String _$projectReviewListQueryHash() =>
    r'f3afaeae241e7d4bdc5df0971cd269d5f9308ba1';

abstract class _$ProjectReviewListQuery
    extends $Notifier<ProjectReviewQueryState> {
  ProjectReviewQueryState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<ProjectReviewQueryState, ProjectReviewQueryState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<ProjectReviewQueryState, ProjectReviewQueryState>,
        ProjectReviewQueryState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
