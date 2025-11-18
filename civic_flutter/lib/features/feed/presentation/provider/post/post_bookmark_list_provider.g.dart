// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_bookmark_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PaginatedPostBookmarkList)
const paginatedPostBookmarkListProvider = PaginatedPostBookmarkListProvider._();

final class PaginatedPostBookmarkListProvider extends $NotifierProvider<
    PaginatedPostBookmarkList, PagingController<int, Post>> {
  const PaginatedPostBookmarkListProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'paginatedPostBookmarkListProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$paginatedPostBookmarkListHash();

  @$internal
  @override
  PaginatedPostBookmarkList create() => PaginatedPostBookmarkList();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PagingController<int, Post> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PagingController<int, Post>>(value),
    );
  }
}

String _$paginatedPostBookmarkListHash() =>
    r'22341602e954dd28b8b9a3b123754f06befb34c5';

abstract class _$PaginatedPostBookmarkList
    extends $Notifier<PagingController<int, Post>> {
  PagingController<int, Post> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref
        as $Ref<PagingController<int, Post>, PagingController<int, Post>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<PagingController<int, Post>, PagingController<int, Post>>,
        PagingController<int, Post>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
