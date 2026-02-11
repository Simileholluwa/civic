// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_paginated_review_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PaginatedProjectReviewList)
final paginatedProjectReviewListProvider = PaginatedProjectReviewListFamily._();

final class PaginatedProjectReviewListProvider
    extends
        $NotifierProvider<
          PaginatedProjectReviewList,
          Raw<PagingController<int, ProjectReviewWithUserState>>
        > {
  PaginatedProjectReviewListProvider._({
    required PaginatedProjectReviewListFamily super.from,
    required int super.argument,
  }) : super(
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
  Override overrideWithValue(
    Raw<PagingController<int, ProjectReviewWithUserState>> value,
  ) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<
            Raw<PagingController<int, ProjectReviewWithUserState>>
          >(value),
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
    r'43f34dc03f022fc76ac3f3ca1d4bad151f8b1c5a';

final class PaginatedProjectReviewListFamily extends $Family
    with
        $ClassFamilyOverride<
          PaginatedProjectReviewList,
          Raw<PagingController<int, ProjectReviewWithUserState>>,
          Raw<PagingController<int, ProjectReviewWithUserState>>,
          Raw<PagingController<int, ProjectReviewWithUserState>>,
          int
        > {
  PaginatedProjectReviewListFamily._()
    : super(
        retry: null,
        name: r'paginatedProjectReviewListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  PaginatedProjectReviewListProvider call(int projectId) =>
      PaginatedProjectReviewListProvider._(argument: projectId, from: this);

  @override
  String toString() => r'paginatedProjectReviewListProvider';
}

abstract class _$PaginatedProjectReviewList
    extends $Notifier<Raw<PagingController<int, ProjectReviewWithUserState>>> {
  late final _$args = ref.$arg as int;
  int get projectId => _$args;

  Raw<PagingController<int, ProjectReviewWithUserState>> build(int projectId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              Raw<PagingController<int, ProjectReviewWithUserState>>,
              Raw<PagingController<int, ProjectReviewWithUserState>>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                Raw<PagingController<int, ProjectReviewWithUserState>>,
                Raw<PagingController<int, ProjectReviewWithUserState>>
              >,
              Raw<PagingController<int, ProjectReviewWithUserState>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

@ProviderFor(ProjectReviewListQuery)
final projectReviewListQueryProvider = ProjectReviewListQueryProvider._();

final class ProjectReviewListQueryProvider
    extends $NotifierProvider<ProjectReviewListQuery, ProjectReviewQueryState> {
  ProjectReviewListQueryProvider._()
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
    r'4edccbda8093f407eb315a8221b2f6ec4a92e98e';

abstract class _$ProjectReviewListQuery
    extends $Notifier<ProjectReviewQueryState> {
  ProjectReviewQueryState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<ProjectReviewQueryState, ProjectReviewQueryState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ProjectReviewQueryState, ProjectReviewQueryState>,
              ProjectReviewQueryState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
