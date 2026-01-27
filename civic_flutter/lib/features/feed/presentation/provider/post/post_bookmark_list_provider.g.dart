// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_bookmark_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PaginatedPostBookmarkList)
const paginatedPostBookmarkListProvider = PaginatedPostBookmarkListProvider._();

final class PaginatedPostBookmarkListProvider
    extends
        $NotifierProvider<
          PaginatedPostBookmarkList,
          Raw<PagingController<int, PostWithUserState>>
        > {
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
  Override overrideWithValue(
    Raw<PagingController<int, PostWithUserState>> value,
  ) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<Raw<PagingController<int, PostWithUserState>>>(
            value,
          ),
    );
  }
}

String _$paginatedPostBookmarkListHash() =>
    r'7b82f24f696cfb62b9ef76d30909b5bc89241e35';

abstract class _$PaginatedPostBookmarkList
    extends $Notifier<Raw<PagingController<int, PostWithUserState>>> {
  Raw<PagingController<int, PostWithUserState>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              Raw<PagingController<int, PostWithUserState>>,
              Raw<PagingController<int, PostWithUserState>>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                Raw<PagingController<int, PostWithUserState>>,
                Raw<PagingController<int, PostWithUserState>>
              >,
              Raw<PagingController<int, PostWithUserState>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
