// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_replies_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PaginatedRepliesList)
final paginatedRepliesListProvider = PaginatedRepliesListFamily._();

final class PaginatedRepliesListProvider
    extends
        $NotifierProvider<
          PaginatedRepliesList,
          Raw<PagingController<int, PostWithUserState>>
        > {
  PaginatedRepliesListProvider._({
    required PaginatedRepliesListFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'paginatedRepliesListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$paginatedRepliesListHash();

  @override
  String toString() {
    return r'paginatedRepliesListProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PaginatedRepliesList create() => PaginatedRepliesList();

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

  @override
  bool operator ==(Object other) {
    return other is PaginatedRepliesListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$paginatedRepliesListHash() =>
    r'a2b843854e5cd07fa30bdcb970e0c90e71d3c71c';

final class PaginatedRepliesListFamily extends $Family
    with
        $ClassFamilyOverride<
          PaginatedRepliesList,
          Raw<PagingController<int, PostWithUserState>>,
          Raw<PagingController<int, PostWithUserState>>,
          Raw<PagingController<int, PostWithUserState>>,
          int
        > {
  PaginatedRepliesListFamily._()
    : super(
        retry: null,
        name: r'paginatedRepliesListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PaginatedRepliesListProvider call(int commentId) =>
      PaginatedRepliesListProvider._(argument: commentId, from: this);

  @override
  String toString() => r'paginatedRepliesListProvider';
}

abstract class _$PaginatedRepliesList
    extends $Notifier<Raw<PagingController<int, PostWithUserState>>> {
  late final _$args = ref.$arg as int;
  int get commentId => _$args;

  Raw<PagingController<int, PostWithUserState>> build(int commentId);
  @$mustCallSuper
  @override
  void runBuild() {
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
    element.handleCreate(ref, () => build(_$args));
  }
}
