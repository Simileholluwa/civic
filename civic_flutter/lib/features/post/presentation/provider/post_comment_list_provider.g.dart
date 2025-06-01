// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_comment_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$paginatedPostCommentListHash() =>
    r'db3ade6f99cd116164b7a9b8a3dfdbdfaf4c4598';

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

abstract class _$PaginatedPostCommentList
    extends BuildlessAutoDisposeNotifier<PagingStatus> {
  late final int postId;

  PagingStatus build(
    int postId,
  );
}

/// See also [PaginatedPostCommentList].
@ProviderFor(PaginatedPostCommentList)
const paginatedPostCommentListProvider = PaginatedPostCommentListFamily();

/// See also [PaginatedPostCommentList].
class PaginatedPostCommentListFamily extends Family<PagingStatus> {
  /// See also [PaginatedPostCommentList].
  const PaginatedPostCommentListFamily();

  /// See also [PaginatedPostCommentList].
  PaginatedPostCommentListProvider call(
    int postId,
  ) {
    return PaginatedPostCommentListProvider(
      postId,
    );
  }

  @override
  PaginatedPostCommentListProvider getProviderOverride(
    covariant PaginatedPostCommentListProvider provider,
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
  String? get name => r'paginatedPostCommentListProvider';
}

/// See also [PaginatedPostCommentList].
class PaginatedPostCommentListProvider extends AutoDisposeNotifierProviderImpl<
    PaginatedPostCommentList, PagingStatus> {
  /// See also [PaginatedPostCommentList].
  PaginatedPostCommentListProvider(
    int postId,
  ) : this._internal(
          () => PaginatedPostCommentList()..postId = postId,
          from: paginatedPostCommentListProvider,
          name: r'paginatedPostCommentListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$paginatedPostCommentListHash,
          dependencies: PaginatedPostCommentListFamily._dependencies,
          allTransitiveDependencies:
              PaginatedPostCommentListFamily._allTransitiveDependencies,
          postId: postId,
        );

  PaginatedPostCommentListProvider._internal(
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
    covariant PaginatedPostCommentList notifier,
  ) {
    return notifier.build(
      postId,
    );
  }

  @override
  Override overrideWith(PaginatedPostCommentList Function() create) {
    return ProviderOverride(
      origin: this,
      override: PaginatedPostCommentListProvider._internal(
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
  AutoDisposeNotifierProviderElement<PaginatedPostCommentList, PagingStatus>
      createElement() {
    return _PaginatedPostCommentListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PaginatedPostCommentListProvider && other.postId == postId;
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
mixin PaginatedPostCommentListRef
    on AutoDisposeNotifierProviderRef<PagingStatus> {
  /// The parameter `postId` of this provider.
  int get postId;
}

class _PaginatedPostCommentListProviderElement
    extends AutoDisposeNotifierProviderElement<PaginatedPostCommentList,
        PagingStatus> with PaginatedPostCommentListRef {
  _PaginatedPostCommentListProviderElement(super.provider);

  @override
  int get postId => (origin as PaginatedPostCommentListProvider).postId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
