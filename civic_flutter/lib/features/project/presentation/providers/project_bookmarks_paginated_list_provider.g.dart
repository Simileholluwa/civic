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
    extends $NotifierProvider<PaginatedProjectBookmarksList, PagingStatus> {
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
  Override overrideWithValue(PagingStatus value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PagingStatus>(value),
    );
  }
}

String _$paginatedProjectBookmarksListHash() =>
    r'5889d4a4393f06df59bb093312f59aef02575c75';

abstract class _$PaginatedProjectBookmarksList extends $Notifier<PagingStatus> {
  PagingStatus build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<PagingStatus, PagingStatus>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<PagingStatus, PagingStatus>,
        PagingStatus,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
