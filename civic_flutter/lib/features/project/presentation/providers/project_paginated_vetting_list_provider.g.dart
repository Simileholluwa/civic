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
    extends $NotifierProvider<PaginatedProjectVettingList, PagingStatus> {
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
  Override overrideWithValue(PagingStatus value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PagingStatus>(value),
    );
  }
}

String _$paginatedProjectVettingListHash() =>
    r'6b36d16e7fef6925053a48c1bff526118752a1b3';

abstract class _$PaginatedProjectVettingList extends $Notifier<PagingStatus> {
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
