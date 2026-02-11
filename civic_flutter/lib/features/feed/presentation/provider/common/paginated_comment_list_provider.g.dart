// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_comment_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PaginatedCommentList)
final paginatedCommentListProvider = PaginatedCommentListFamily._();

final class PaginatedCommentListProvider
    extends
        $NotifierProvider<
          PaginatedCommentList,
          Raw<PagingController<int, PostWithUserState>>
        > {
  PaginatedCommentListProvider._({
    required PaginatedCommentListFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'paginatedCommentListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$paginatedCommentListHash();

  @override
  String toString() {
    return r'paginatedCommentListProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PaginatedCommentList create() => PaginatedCommentList();

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
    return other is PaginatedCommentListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$paginatedCommentListHash() =>
    r'696aa491a7142df0324fe03b1e56510742f9c20e';

final class PaginatedCommentListFamily extends $Family
    with
        $ClassFamilyOverride<
          PaginatedCommentList,
          Raw<PagingController<int, PostWithUserState>>,
          Raw<PagingController<int, PostWithUserState>>,
          Raw<PagingController<int, PostWithUserState>>,
          int
        > {
  PaginatedCommentListFamily._()
    : super(
        retry: null,
        name: r'paginatedCommentListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PaginatedCommentListProvider call(int postId) =>
      PaginatedCommentListProvider._(argument: postId, from: this);

  @override
  String toString() => r'paginatedCommentListProvider';
}

abstract class _$PaginatedCommentList
    extends $Notifier<Raw<PagingController<int, PostWithUserState>>> {
  late final _$args = ref.$arg as int;
  int get postId => _$args;

  Raw<PagingController<int, PostWithUserState>> build(int postId);
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
