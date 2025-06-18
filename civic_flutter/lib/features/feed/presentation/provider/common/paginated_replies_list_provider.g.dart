// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_replies_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$paginatedRepliesListHash() =>
    r'bc505662cd24f662fb4e4c0d9f7997e6c8e18f90';

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

abstract class _$PaginatedRepliesList
    extends BuildlessAutoDisposeNotifier<PagingStatus> {
  late final int commentId;

  PagingStatus build(
    int commentId,
  );
}

/// See also [PaginatedRepliesList].
@ProviderFor(PaginatedRepliesList)
const paginatedRepliesListProvider = PaginatedRepliesListFamily();

/// See also [PaginatedRepliesList].
class PaginatedRepliesListFamily extends Family<PagingStatus> {
  /// See also [PaginatedRepliesList].
  const PaginatedRepliesListFamily();

  /// See also [PaginatedRepliesList].
  PaginatedRepliesListProvider call(
    int commentId,
  ) {
    return PaginatedRepliesListProvider(
      commentId,
    );
  }

  @override
  PaginatedRepliesListProvider getProviderOverride(
    covariant PaginatedRepliesListProvider provider,
  ) {
    return call(
      provider.commentId,
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
  String? get name => r'paginatedRepliesListProvider';
}

/// See also [PaginatedRepliesList].
class PaginatedRepliesListProvider extends AutoDisposeNotifierProviderImpl<
    PaginatedRepliesList, PagingStatus> {
  /// See also [PaginatedRepliesList].
  PaginatedRepliesListProvider(
    int commentId,
  ) : this._internal(
          () => PaginatedRepliesList()..commentId = commentId,
          from: paginatedRepliesListProvider,
          name: r'paginatedRepliesListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$paginatedRepliesListHash,
          dependencies: PaginatedRepliesListFamily._dependencies,
          allTransitiveDependencies:
              PaginatedRepliesListFamily._allTransitiveDependencies,
          commentId: commentId,
        );

  PaginatedRepliesListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.commentId,
  }) : super.internal();

  final int commentId;

  @override
  PagingStatus runNotifierBuild(
    covariant PaginatedRepliesList notifier,
  ) {
    return notifier.build(
      commentId,
    );
  }

  @override
  Override overrideWith(PaginatedRepliesList Function() create) {
    return ProviderOverride(
      origin: this,
      override: PaginatedRepliesListProvider._internal(
        () => create()..commentId = commentId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        commentId: commentId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<PaginatedRepliesList, PagingStatus>
      createElement() {
    return _PaginatedRepliesListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PaginatedRepliesListProvider &&
        other.commentId == commentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, commentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PaginatedRepliesListRef on AutoDisposeNotifierProviderRef<PagingStatus> {
  /// The parameter `commentId` of this provider.
  int get commentId;
}

class _PaginatedRepliesListProviderElement
    extends AutoDisposeNotifierProviderElement<PaginatedRepliesList,
        PagingStatus> with PaginatedRepliesListRef {
  _PaginatedRepliesListProviderElement(super.provider);

  @override
  int get commentId => (origin as PaginatedRepliesListProvider).commentId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
