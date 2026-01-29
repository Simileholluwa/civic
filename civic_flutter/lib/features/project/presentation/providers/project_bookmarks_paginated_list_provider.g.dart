// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_bookmarks_paginated_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PaginatedProjectBookmarksList)
const paginatedProjectBookmarksListProvider =
    PaginatedProjectBookmarksListProvider._();

final class PaginatedProjectBookmarksListProvider
    extends
        $NotifierProvider<
          PaginatedProjectBookmarksList,
          Raw<PagingController<int, ProjectWithUserState>>
        > {
  const PaginatedProjectBookmarksListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'paginatedProjectBookmarksListProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$paginatedProjectBookmarksListHash();

  @$internal
  @override
  PaginatedProjectBookmarksList create() => PaginatedProjectBookmarksList();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(
    Raw<PagingController<int, ProjectWithUserState>> value,
  ) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<Raw<PagingController<int, ProjectWithUserState>>>(
            value,
          ),
    );
  }
}

String _$paginatedProjectBookmarksListHash() =>
    r'0b2685f805310ef43e02a9ddbec3bc4addb2e347';

abstract class _$PaginatedProjectBookmarksList
    extends $Notifier<Raw<PagingController<int, ProjectWithUserState>>> {
  Raw<PagingController<int, ProjectWithUserState>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              Raw<PagingController<int, ProjectWithUserState>>,
              Raw<PagingController<int, ProjectWithUserState>>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                Raw<PagingController<int, ProjectWithUserState>>,
                Raw<PagingController<int, ProjectWithUserState>>
              >,
              Raw<PagingController<int, ProjectWithUserState>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
