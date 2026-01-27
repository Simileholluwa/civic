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
    extends
        $NotifierProvider<
          PaginatedProjectList,
          Raw<PagingController<int, Project>>
        > {
  const PaginatedProjectListProvider._({
    required PaginatedProjectListFamily super.from,
    required String super.argument,
  }) : super(
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
  Override overrideWithValue(Raw<PagingController<int, Project>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Raw<PagingController<int, Project>>>(
        value,
      ),
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
    r'9acc27296a15990ed1f97ec3840a80754a93332d';

final class PaginatedProjectListFamily extends $Family
    with
        $ClassFamilyOverride<
          PaginatedProjectList,
          Raw<PagingController<int, Project>>,
          Raw<PagingController<int, Project>>,
          Raw<PagingController<int, Project>>,
          String
        > {
  const PaginatedProjectListFamily._()
    : super(
        retry: null,
        name: r'paginatedProjectListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  PaginatedProjectListProvider call(String sortBy) =>
      PaginatedProjectListProvider._(argument: sortBy, from: this);

  @override
  String toString() => r'paginatedProjectListProvider';
}

abstract class _$PaginatedProjectList
    extends $Notifier<Raw<PagingController<int, Project>>> {
  late final _$args = ref.$arg as String;
  String get sortBy => _$args;

  Raw<PagingController<int, Project>> build(String sortBy);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref
            as $Ref<
              Raw<PagingController<int, Project>>,
              Raw<PagingController<int, Project>>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                Raw<PagingController<int, Project>>,
                Raw<PagingController<int, Project>>
              >,
              Raw<PagingController<int, Project>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
