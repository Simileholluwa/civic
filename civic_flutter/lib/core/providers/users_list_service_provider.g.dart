// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_list_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$usersListServiceHash() => r'125d68440db5707cc3888b53e653b0f45b09bef7';

/// See also [usersListService].
@ProviderFor(usersListService)
final usersListServiceProvider = Provider<UsersListService>.internal(
  usersListService,
  name: r'usersListServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$usersListServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UsersListServiceRef = ProviderRef<UsersListService>;
String _$paginatedUsersListHash() =>
    r'ddb905fa927e0526eca9bead40851ce5cd752b01';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$PaginatedUsersList extends BuildlessNotifier<PagingStatus> {
  late final String query;

  PagingStatus build(
    String query,
  );
}

/// See also [PaginatedUsersList].
@ProviderFor(PaginatedUsersList)
const paginatedUsersListProvider = PaginatedUsersListFamily();

/// See also [PaginatedUsersList].
class PaginatedUsersListFamily extends Family<PagingStatus> {
  /// See also [PaginatedUsersList].
  const PaginatedUsersListFamily();

  /// See also [PaginatedUsersList].
  PaginatedUsersListProvider call(
    String query,
  ) {
    return PaginatedUsersListProvider(
      query,
    );
  }

  @override
  PaginatedUsersListProvider getProviderOverride(
    covariant PaginatedUsersListProvider provider,
  ) {
    return call(
      provider.query,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'paginatedUsersListProvider';
}

/// See also [PaginatedUsersList].
class PaginatedUsersListProvider
    extends NotifierProviderImpl<PaginatedUsersList, PagingStatus> {
  /// See also [PaginatedUsersList].
  PaginatedUsersListProvider(
    String query,
  ) : this._internal(
          () => PaginatedUsersList()..query = query,
          from: paginatedUsersListProvider,
          name: r'paginatedUsersListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$paginatedUsersListHash,
          dependencies: PaginatedUsersListFamily._dependencies,
          allTransitiveDependencies:
              PaginatedUsersListFamily._allTransitiveDependencies,
          query: query,
        );

  PaginatedUsersListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final String query;

  @override
  PagingStatus runNotifierBuild(
    covariant PaginatedUsersList notifier,
  ) {
    return notifier.build(
      query,
    );
  }

  @override
  Override overrideWith(PaginatedUsersList Function() create) {
    return ProviderOverride(
      origin: this,
      override: PaginatedUsersListProvider._internal(
        () => create()..query = query,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
      ),
    );
  }

  @override
  NotifierProviderElement<PaginatedUsersList, PagingStatus> createElement() {
    return _PaginatedUsersListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PaginatedUsersListProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PaginatedUsersListRef on NotifierProviderRef<PagingStatus> {
  /// The parameter `query` of this provider.
  String get query;
}

class _PaginatedUsersListProviderElement
    extends NotifierProviderElement<PaginatedUsersList, PagingStatus>
    with PaginatedUsersListRef {
  _PaginatedUsersListProviderElement(super.provider);

  @override
  String get query => (origin as PaginatedUsersListProvider).query;
}

String _$searchUsersListQueryHash() =>
    r'1f0723b0b2729a6277dd118e74684ab85037f479';

/// See also [SearchUsersListQuery].
@ProviderFor(SearchUsersListQuery)
final searchUsersListQueryProvider =
    NotifierProvider<SearchUsersListQuery, String>.internal(
  SearchUsersListQuery.new,
  name: r'searchUsersListQueryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$searchUsersListQueryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchUsersListQuery = Notifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
