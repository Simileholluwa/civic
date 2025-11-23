// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_replies_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PaginatedRepliesList)
const paginatedRepliesListProvider = PaginatedRepliesListFamily._();

final class PaginatedRepliesListProvider extends $NotifierProvider<
    PaginatedRepliesList, PagingController<int, PostWithUserState>> {
  const PaginatedRepliesListProvider._(
      {required PaginatedRepliesListFamily super.from,
      required int super.argument})
      : super(
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
  Override overrideWithValue(PagingController<int, PostWithUserState> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<PagingController<int, PostWithUserState>>(value),
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
    r'5841ee6b9d102c973d5daa3e6f51506e85971fc8';

final class PaginatedRepliesListFamily extends $Family
    with
        $ClassFamilyOverride<
            PaginatedRepliesList,
            PagingController<int, PostWithUserState>,
            PagingController<int, PostWithUserState>,
            PagingController<int, PostWithUserState>,
            int> {
  const PaginatedRepliesListFamily._()
      : super(
          retry: null,
          name: r'paginatedRepliesListProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  PaginatedRepliesListProvider call(
    int commentId,
  ) =>
      PaginatedRepliesListProvider._(argument: commentId, from: this);

  @override
  String toString() => r'paginatedRepliesListProvider';
}

abstract class _$PaginatedRepliesList
    extends $Notifier<PagingController<int, PostWithUserState>> {
  late final _$args = ref.$arg as int;
  int get commentId => _$args;

  PagingController<int, PostWithUserState> build(
    int commentId,
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
