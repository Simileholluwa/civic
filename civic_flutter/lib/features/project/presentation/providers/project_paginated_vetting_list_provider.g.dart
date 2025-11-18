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

final class PaginatedProjectVettingListProvider extends $NotifierProvider<
    PaginatedProjectVettingList, PagingController<int, ProjectVetting>> {
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
  Override overrideWithValue(PagingController<int, ProjectVetting> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<PagingController<int, ProjectVetting>>(value),
    );
  }
}

String _$paginatedProjectVettingListHash() =>
    r'95fc788fc430334ac0e427ad5ac0891b63dcaccd';

abstract class _$PaginatedProjectVettingList
    extends $Notifier<PagingController<int, ProjectVetting>> {
  PagingController<int, ProjectVetting> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<PagingController<int, ProjectVetting>,
        PagingController<int, ProjectVetting>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<PagingController<int, ProjectVetting>,
            PagingController<int, ProjectVetting>>,
        PagingController<int, ProjectVetting>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
