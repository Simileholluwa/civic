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
    extends $NotifierProvider<PaginatedPostBookmarkList, PagingStatus> {
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
  Override overrideWithValue(PagingStatus value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PagingStatus>(value),
    );
  }
}

String _$paginatedPostBookmarkListHash() =>
    r'3875adc5ae0245009f2b2147b9e4b758da920c81';

abstract class _$PaginatedPostBookmarkList extends $Notifier<PagingStatus> {
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
