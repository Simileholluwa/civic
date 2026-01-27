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
    extends
        $NotifierProvider<
          PaginatedPostList,
          Raw<PagingController<int, PostWithUserState>>
        > {
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

String _$paginatedPostListHash() => r'9caaabb6895c12eacbec0bee4e07fcb1dbb59b79';

abstract class _$PaginatedPostList
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
