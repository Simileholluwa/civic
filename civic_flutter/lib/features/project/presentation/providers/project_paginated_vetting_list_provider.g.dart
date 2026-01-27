// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_paginated_vetting_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PaginatedProjectVettingList)
const paginatedProjectVettingListProvider =
    PaginatedProjectVettingListProvider._();

final class PaginatedProjectVettingListProvider
    extends
        $NotifierProvider<
          PaginatedProjectVettingList,
          Raw<PagingController<int, ProjectVetting>>
        > {
  const PaginatedProjectVettingListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'paginatedProjectVettingListProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$paginatedProjectVettingListHash();

  @$internal
  @override
  PaginatedProjectVettingList create() => PaginatedProjectVettingList();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Raw<PagingController<int, ProjectVetting>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<Raw<PagingController<int, ProjectVetting>>>(value),
    );
  }
}

String _$paginatedProjectVettingListHash() =>
    r'42c7cc03f88829b9d2c5bef3421b2bf468c375f2';

abstract class _$PaginatedProjectVettingList
    extends $Notifier<Raw<PagingController<int, ProjectVetting>>> {
  Raw<PagingController<int, ProjectVetting>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              Raw<PagingController<int, ProjectVetting>>,
              Raw<PagingController<int, ProjectVetting>>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                Raw<PagingController<int, ProjectVetting>>,
                Raw<PagingController<int, ProjectVetting>>
              >,
              Raw<PagingController<int, ProjectVetting>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
