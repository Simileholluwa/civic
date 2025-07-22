// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_paginated_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$paginatedProjectListHash() =>
    r'ba4f867ff10dc6b6b234d8352cdf64eda5ef62f6';

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

abstract class _$PaginatedProjectList extends BuildlessNotifier<PagingStatus> {
  late final String sortBy;

  PagingStatus build(
    String sortBy,
  );
}

/// See also [PaginatedProjectList].
@ProviderFor(PaginatedProjectList)
const paginatedProjectListProvider = PaginatedProjectListFamily();

/// See also [PaginatedProjectList].
class PaginatedProjectListFamily extends Family<PagingStatus> {
  /// See also [PaginatedProjectList].
  const PaginatedProjectListFamily();

  /// See also [PaginatedProjectList].
  PaginatedProjectListProvider call(
    String sortBy,
  ) {
    return PaginatedProjectListProvider(
      sortBy,
    );
  }

  @override
  PaginatedProjectListProvider getProviderOverride(
    covariant PaginatedProjectListProvider provider,
  ) {
    return call(
      provider.sortBy,
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
  String? get name => r'paginatedProjectListProvider';
}

/// See also [PaginatedProjectList].
class PaginatedProjectListProvider
    extends NotifierProviderImpl<PaginatedProjectList, PagingStatus> {
  /// See also [PaginatedProjectList].
  PaginatedProjectListProvider(
    String sortBy,
  ) : this._internal(
          () => PaginatedProjectList()..sortBy = sortBy,
          from: paginatedProjectListProvider,
          name: r'paginatedProjectListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$paginatedProjectListHash,
          dependencies: PaginatedProjectListFamily._dependencies,
          allTransitiveDependencies:
              PaginatedProjectListFamily._allTransitiveDependencies,
          sortBy: sortBy,
        );

  PaginatedProjectListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sortBy,
  }) : super.internal();

  final String sortBy;

  @override
  PagingStatus runNotifierBuild(
    covariant PaginatedProjectList notifier,
  ) {
    return notifier.build(
      sortBy,
    );
  }

  @override
  Override overrideWith(PaginatedProjectList Function() create) {
    return ProviderOverride(
      origin: this,
      override: PaginatedProjectListProvider._internal(
        () => create()..sortBy = sortBy,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sortBy: sortBy,
      ),
    );
  }

  @override
  NotifierProviderElement<PaginatedProjectList, PagingStatus> createElement() {
    return _PaginatedProjectListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PaginatedProjectListProvider && other.sortBy == sortBy;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sortBy.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PaginatedProjectListRef on NotifierProviderRef<PagingStatus> {
  /// The parameter `sortBy` of this provider.
  String get sortBy;
}

class _PaginatedProjectListProviderElement
    extends NotifierProviderElement<PaginatedProjectList, PagingStatus>
    with PaginatedProjectListRef {
  _PaginatedProjectListProviderElement(super.provider);

  @override
  String get sortBy => (origin as PaginatedProjectListProvider).sortBy;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
