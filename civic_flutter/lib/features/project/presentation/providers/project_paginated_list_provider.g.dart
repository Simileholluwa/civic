// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_paginated_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PaginatedProjectList)
final paginatedProjectListProvider = PaginatedProjectListFamily._();

final class PaginatedProjectListProvider
    extends
        $NotifierProvider<
          PaginatedProjectList,
          Raw<PagingController<int, ProjectWithUserState>>
        > {
  PaginatedProjectListProvider._({
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
  Override overrideWithValue(
    Raw<PagingController<int, ProjectWithUserState>> value,
  ) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<Raw<PagingController<int, ProjectWithUserState>>>(
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
    r'9997598f0e3487ddf0ea1889cf493615593c4a07';

final class PaginatedProjectListFamily extends $Family
    with
        $ClassFamilyOverride<
          PaginatedProjectList,
          Raw<PagingController<int, ProjectWithUserState>>,
          Raw<PagingController<int, ProjectWithUserState>>,
          Raw<PagingController<int, ProjectWithUserState>>,
          String
        > {
  PaginatedProjectListFamily._()
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
    extends $Notifier<Raw<PagingController<int, ProjectWithUserState>>> {
  late final _$args = ref.$arg as String;
  String get sortBy => _$args;

  Raw<PagingController<int, ProjectWithUserState>> build(String sortBy);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              Raw<PagingController<int, ProjectWithUserState>>,
              Raw<PagingController<int, ProjectWithUserState>>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                Raw<PagingController<int, ProjectWithUserState>>,
                Raw<PagingController<int, ProjectWithUserState>>
              >,
              Raw<PagingController<int, ProjectWithUserState>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
