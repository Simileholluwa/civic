// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_paginated_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PaginatedProjectList)
const paginatedProjectListProvider = PaginatedProjectListFamily._();

final class PaginatedProjectListProvider
    extends $NotifierProvider<PaginatedProjectList, PagingStatus> {
  const PaginatedProjectListProvider._(
      {required PaginatedProjectListFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'paginatedProjectListProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$paginatedProjectListHash();

  @override
  String toString() {
    return r'paginatedProjectListProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PaginatedProjectList create() => PaginatedProjectList();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PagingStatus value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PagingStatus>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PaginatedProjectListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$paginatedProjectListHash() =>
    r'fdb7087e4b88b8adfc7e54bd7c74e9d2070032c9';

final class PaginatedProjectListFamily extends $Family
    with
        $ClassFamilyOverride<PaginatedProjectList, PagingStatus, PagingStatus,
            PagingStatus, String> {
  const PaginatedProjectListFamily._()
      : super(
          retry: null,
          name: r'paginatedProjectListProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: false,
        );

  PaginatedProjectListProvider call(
    String sortBy,
  ) =>
      PaginatedProjectListProvider._(argument: sortBy, from: this);

  @override
  String toString() => r'paginatedProjectListProvider';
}

abstract class _$PaginatedProjectList extends $Notifier<PagingStatus> {
  late final _$args = ref.$arg as String;
  String get sortBy => _$args;

  PagingStatus build(
    String sortBy,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args,
    );
    final ref = this.ref as $Ref<PagingStatus, PagingStatus>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<PagingStatus, PagingStatus>,
        PagingStatus,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
