// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_paginated_vetting_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PaginatedProjectVettingList)
final paginatedProjectVettingListProvider =
    PaginatedProjectVettingListProvider._();

final class PaginatedProjectVettingListProvider
    extends
        $NotifierProvider<
          PaginatedProjectVettingList,
          Raw<PagingController<int, ProjectVettingWithUserState>>
        > {
  PaginatedProjectVettingListProvider._()
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
  Override overrideWithValue(
    Raw<PagingController<int, ProjectVettingWithUserState>> value,
  ) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<
            Raw<PagingController<int, ProjectVettingWithUserState>>
          >(value),
    );
  }
}

String _$paginatedProjectVettingListHash() =>
    r'c2e28812116749deac8ec633ad34d2c498a0d5c3';

abstract class _$PaginatedProjectVettingList
    extends $Notifier<Raw<PagingController<int, ProjectVettingWithUserState>>> {
  Raw<PagingController<int, ProjectVettingWithUserState>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              Raw<PagingController<int, ProjectVettingWithUserState>>,
              Raw<PagingController<int, ProjectVettingWithUserState>>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                Raw<PagingController<int, ProjectVettingWithUserState>>,
                Raw<PagingController<int, ProjectVettingWithUserState>>
              >,
              Raw<PagingController<int, ProjectVettingWithUserState>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
