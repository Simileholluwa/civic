// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_comment_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$paginatedCommentListHash() =>
    r'e75258a9839e6686b2815956c06518427d0409b2';

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

abstract class _$PaginatedCommentList
    extends BuildlessAutoDisposeNotifier<PagingStatus> {
  late final int postId;

  PagingStatus build(
    int postId,
  );
}

/// See also [PaginatedCommentList].
@ProviderFor(PaginatedCommentList)
const paginatedCommentListProvider = PaginatedCommentListFamily();

/// See also [PaginatedCommentList].
class PaginatedCommentListFamily extends Family<PagingStatus> {
  /// See also [PaginatedCommentList].
  const PaginatedCommentListFamily();

  /// See also [PaginatedCommentList].
  PaginatedCommentListProvider call(
    int postId,
  ) {
    return PaginatedCommentListProvider(
      postId,
    );
  }

  @override
  PaginatedCommentListProvider getProviderOverride(
    covariant PaginatedCommentListProvider provider,
  ) {
    return call(
      provider.postId,
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
  String? get name => r'paginatedCommentListProvider';
}

/// See also [PaginatedCommentList].
class PaginatedCommentListProvider extends AutoDisposeNotifierProviderImpl<
    PaginatedCommentList, PagingStatus> {
  /// See also [PaginatedCommentList].
  PaginatedCommentListProvider(
    int postId,
  ) : this._internal(
          () => PaginatedCommentList()..postId = postId,
          from: paginatedCommentListProvider,
          name: r'paginatedCommentListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$paginatedCommentListHash,
          dependencies: PaginatedCommentListFamily._dependencies,
          allTransitiveDependencies:
              PaginatedCommentListFamily._allTransitiveDependencies,
          postId: postId,
        );

  PaginatedCommentListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.postId,
  }) : super.internal();

  final int postId;

  @override
  PagingStatus runNotifierBuild(
    covariant PaginatedCommentList notifier,
  ) {
    return notifier.build(
      postId,
    );
  }

  @override
  Override overrideWith(PaginatedCommentList Function() create) {
    return ProviderOverride(
      origin: this,
      override: PaginatedCommentListProvider._internal(
        () => create()..postId = postId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        postId: postId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<PaginatedCommentList, PagingStatus>
      createElement() {
    return _PaginatedCommentListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PaginatedCommentListProvider && other.postId == postId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, postId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PaginatedCommentListRef on AutoDisposeNotifierProviderRef<PagingStatus> {
  /// The parameter `postId` of this provider.
  int get postId;
}

class _PaginatedCommentListProviderElement
    extends AutoDisposeNotifierProviderElement<PaginatedCommentList,
        PagingStatus> with PaginatedCommentListRef {
  _PaginatedCommentListProviderElement(super.provider);

  @override
  int get postId => (origin as PaginatedCommentListProvider).postId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
