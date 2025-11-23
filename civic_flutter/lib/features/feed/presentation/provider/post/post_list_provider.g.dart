// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PaginatedPostList)
const paginatedPostListProvider = PaginatedPostListProvider._();

final class PaginatedPostListProvider extends $NotifierProvider<
    PaginatedPostList, PagingController<int, PostWithUserState>> {
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
  Override overrideWithValue(PagingController<int, PostWithUserState> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<PagingController<int, PostWithUserState>>(value),
    );
  }
}

String _$paginatedPostListHash() => r'2124ed5c0c96c97ac6e167b25546e0f2e2449a6b';

abstract class _$PaginatedPostList
    extends $Notifier<PagingController<int, PostWithUserState>> {
  PagingController<int, PostWithUserState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<PagingController<int, PostWithUserState>,
        PagingController<int, PostWithUserState>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<PagingController<int, PostWithUserState>,
            PagingController<int, PostWithUserState>>,
        PagingController<int, PostWithUserState>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
