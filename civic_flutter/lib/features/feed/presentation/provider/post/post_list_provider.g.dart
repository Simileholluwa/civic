// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PaginatedPostList)
const paginatedPostListProvider = PaginatedPostListProvider._();

final class PaginatedPostListProvider
    extends $NotifierProvider<PaginatedPostList, PagingController<int, Post>> {
  const PaginatedPostListProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'paginatedPostListProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$paginatedPostListHash();

  @$internal
  @override
  PaginatedPostList create() => PaginatedPostList();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PagingController<int, Post> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PagingController<int, Post>>(value),
    );
  }
}

String _$paginatedPostListHash() => r'3a7ddc47f87b3a1d6b61c216062b2188c5ae7357';

abstract class _$PaginatedPostList
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
