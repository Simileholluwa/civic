// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_comment_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PaginatedCommentList)
const paginatedCommentListProvider = PaginatedCommentListFamily._();

final class PaginatedCommentListProvider extends $NotifierProvider<
    PaginatedCommentList, PagingController<int, PostWithUserState>> {
  const PaginatedCommentListProvider._(
      {required PaginatedCommentListFamily super.from,
      required int super.argument})
      : super(
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
  Override overrideWithValue(PagingController<int, PostWithUserState> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<PagingController<int, PostWithUserState>>(value),
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
    r'bd54b686320d0830ef9aa2b067a6f51056600307';

final class PaginatedCommentListFamily extends $Family
    with
        $ClassFamilyOverride<
            PaginatedCommentList,
            PagingController<int, PostWithUserState>,
            PagingController<int, PostWithUserState>,
            PagingController<int, PostWithUserState>,
            int> {
  const PaginatedCommentListFamily._()
      : super(
          retry: null,
          name: r'paginatedCommentListProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  PaginatedCommentListProvider call(
    int postId,
  ) =>
      PaginatedCommentListProvider._(argument: postId, from: this);

  @override
  String toString() => r'paginatedCommentListProvider';
}

abstract class _$PaginatedCommentList
    extends $Notifier<PagingController<int, PostWithUserState>> {
  late final _$args = ref.$arg as int;
  int get postId => _$args;

  PagingController<int, PostWithUserState> build(
    int postId,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args,
    );
    final ref = this.ref as $Ref<PagingController<int, PostWithUserState>,
        PagingController<int, PostWithUserState>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<PagingController<int, PostWithUserState>,
            PagingController<int, PostWithUserState>>,
        PagingController<int, PostWithUserState>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
