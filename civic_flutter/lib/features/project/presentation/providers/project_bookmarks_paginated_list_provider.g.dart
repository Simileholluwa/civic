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
          Raw<PagingController<int, Project>>
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
  Override overrideWithValue(Raw<PagingController<int, Project>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Raw<PagingController<int, Project>>>(
        value,
      ),
    );
  }
}

String _$paginatedProjectBookmarksListHash() =>
    r'8cc404496897b17f3d0cdf170ca33065f73a523d';

abstract class _$PaginatedProjectBookmarksList
    extends $Notifier<Raw<PagingController<int, Project>>> {
  Raw<PagingController<int, Project>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              Raw<PagingController<int, Project>>,
              Raw<PagingController<int, Project>>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                Raw<PagingController<int, Project>>,
                Raw<PagingController<int, Project>>
              >,
              Raw<PagingController<int, Project>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
