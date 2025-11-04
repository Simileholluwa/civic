// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_replies_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PaginatedRepliesList)
const paginatedRepliesListProvider = PaginatedRepliesListFamily._();

final class PaginatedRepliesListProvider
    extends $NotifierProvider<PaginatedRepliesList, PagingStatus> {
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
  Override overrideWithValue(PagingStatus value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PagingStatus>(value),
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
    r'372b1a5426a495f101ef856407c2e1a9aac0c054';

final class PaginatedRepliesListFamily extends $Family
    with
        $ClassFamilyOverride<PaginatedRepliesList, PagingStatus, PagingStatus,
            PagingStatus, int> {
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

abstract class _$PaginatedRepliesList extends $Notifier<PagingStatus> {
  late final _$args = ref.$arg as int;
  int get commentId => _$args;

  PagingStatus build(
    int commentId,
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
