// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_list_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(usersListService)
const usersListServiceProvider = UsersListServiceProvider._();

final class UsersListServiceProvider extends $FunctionalProvider<
    UsersListService,
    UsersListService,
    UsersListService> with $Provider<UsersListService> {
  const UsersListServiceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'usersListServiceProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$usersListServiceHash();

  @$internal
  @override
  $ProviderElement<UsersListService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UsersListService create(Ref ref) {
    return usersListService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UsersListService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UsersListService>(value),
    );
  }
}

String _$usersListServiceHash() => r'125d68440db5707cc3888b53e653b0f45b09bef7';

@ProviderFor(PaginatedUsersList)
const paginatedUsersListProvider = PaginatedUsersListFamily._();

final class PaginatedUsersListProvider
    extends $NotifierProvider<PaginatedUsersList, PagingStatus> {
  const PaginatedUsersListProvider._(
      {required PaginatedUsersListFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'paginatedUsersListProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$paginatedUsersListHash();

  @override
  String toString() {
    return r'paginatedUsersListProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PaginatedUsersList create() => PaginatedUsersList();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PagingStatus value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PagingStatus>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PaginatedUsersListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$paginatedUsersListHash() =>
    r'14eafed7688eb02f32b91328c9a8842a4176c1e6';

final class PaginatedUsersListFamily extends $Family
    with
        $ClassFamilyOverride<PaginatedUsersList, PagingStatus, PagingStatus,
            PagingStatus, String> {
  const PaginatedUsersListFamily._()
      : super(
          retry: null,
          name: r'paginatedUsersListProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: false,
        );

  PaginatedUsersListProvider call(
    String query,
  ) =>
      PaginatedUsersListProvider._(argument: query, from: this);

  @override
  String toString() => r'paginatedUsersListProvider';
}

abstract class _$PaginatedUsersList extends $Notifier<PagingStatus> {
  late final _$args = ref.$arg as String;
  String get query => _$args;

  PagingStatus build(
    String query,
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

@ProviderFor(SearchUsersListQuery)
const searchUsersListQueryProvider = SearchUsersListQueryProvider._();

final class SearchUsersListQueryProvider
    extends $NotifierProvider<SearchUsersListQuery, String> {
  const SearchUsersListQueryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'searchUsersListQueryProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$searchUsersListQueryHash();

  @$internal
  @override
  SearchUsersListQuery create() => SearchUsersListQuery();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$searchUsersListQueryHash() =>
    r'fa55e81a5cf037a95de90e1325b9ae4c566c8fbc';

abstract class _$SearchUsersListQuery extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String, String>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<String, String>, String, Object?, Object?>;
    element.handleValue(ref, created);
  }
}
