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
    PaginatedPostBookmarkList, PagingController<int, PostWithUserState>> {
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
  Override overrideWithValue(PagingController<int, PostWithUserState> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<PagingController<int, PostWithUserState>>(value),
    );
  }
}

String _$paginatedPostBookmarkListHash() =>
    r'd729c079f43cccb67efda9859b75a09b14a431f5';

abstract class _$PaginatedPostBookmarkList
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
