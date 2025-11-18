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

final class PaginatedProjectBookmarksListProvider extends $NotifierProvider<
    PaginatedProjectBookmarksList, PagingController<int, Project>> {
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
  Override overrideWithValue(PagingController<int, Project> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<PagingController<int, Project>>(value),
    );
  }
}

String _$paginatedProjectBookmarksListHash() =>
    r'ca3473d9ed68ba3175c9f255988172db09c55b9f';

abstract class _$PaginatedProjectBookmarksList
    extends $Notifier<PagingController<int, Project>> {
  PagingController<int, Project> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref
        as $Ref<PagingController<int, Project>, PagingController<int, Project>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<PagingController<int, Project>,
            PagingController<int, Project>>,
        PagingController<int, Project>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
