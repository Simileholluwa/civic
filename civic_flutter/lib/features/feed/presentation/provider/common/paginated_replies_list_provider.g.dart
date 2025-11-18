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
    PaginatedRepliesList, PagingController<int, Post>> {
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
  Override overrideWithValue(PagingController<int, Post> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PagingController<int, Post>>(value),
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
    r'000b4c295d4450a8498eae72daf484aef067f883';

final class PaginatedRepliesListFamily extends $Family
    with
        $ClassFamilyOverride<PaginatedRepliesList, PagingController<int, Post>,
            PagingController<int, Post>, PagingController<int, Post>, int> {
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
    extends $Notifier<PagingController<int, Post>> {
  late final _$args = ref.$arg as int;
  int get commentId => _$args;

  PagingController<int, Post> build(
    int commentId,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args,
    );
    final ref = this.ref
        as $Ref<PagingController<int, Post>, PagingController<int, Post>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<PagingController<int, Post>, PagingController<int, Post>>,
        PagingController<int, Post>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
