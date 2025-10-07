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
    extends $NotifierProvider<PaginatedPostList, PagingStatus> {
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
  Override overrideWithValue(PagingStatus value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PagingStatus>(value),
    );
  }
}

String _$paginatedPostListHash() => r'afbe8f90f2594a6048e40cbfab2c5403ab4df0df';

abstract class _$PaginatedPostList extends $Notifier<PagingStatus> {
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
