// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$usersListHash() => r'a3dcd733edc6fe0f75aaa802d17bf913c079eeb3';

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

abstract class _$UsersList extends BuildlessNotifier<PagingStatus> {
  late final String query;

  PagingStatus build(
    String query,
  );
}

/// See also [UsersList].
@ProviderFor(UsersList)
const usersListProvider = UsersListFamily();

/// See also [UsersList].
class UsersListFamily extends Family<PagingStatus> {
  /// See also [UsersList].
  const UsersListFamily();

  /// See also [UsersList].
  UsersListProvider call(
    String query,
  ) {
    return UsersListProvider(
      query,
    );
  }

  @override
  UsersListProvider getProviderOverride(
    covariant UsersListProvider provider,
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
  String? get name => r'usersListProvider';
}

/// See also [UsersList].
class UsersListProvider extends NotifierProviderImpl<UsersList, PagingStatus> {
  /// See also [UsersList].
  UsersListProvider(
    String query,
  ) : this._internal(
          () => UsersList()..query = query,
          from: usersListProvider,
          name: r'usersListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$usersListHash,
          dependencies: UsersListFamily._dependencies,
          allTransitiveDependencies: UsersListFamily._allTransitiveDependencies,
          query: query,
        );

  UsersListProvider._internal(
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
    covariant UsersList notifier,
  ) {
    return notifier.build(
      query,
    );
  }

  @override
  Override overrideWith(UsersList Function() create) {
    return ProviderOverride(
      origin: this,
      override: UsersListProvider._internal(
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
  NotifierProviderElement<UsersList, PagingStatus> createElement() {
    return _UsersListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UsersListProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UsersListRef on NotifierProviderRef<PagingStatus> {
  /// The parameter `query` of this provider.
  String get query;
}

class _UsersListProviderElement
    extends NotifierProviderElement<UsersList, PagingStatus> with UsersListRef {
  _UsersListProviderElement(super.provider);

  @override
  String get query => (origin as UsersListProvider).query;
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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
