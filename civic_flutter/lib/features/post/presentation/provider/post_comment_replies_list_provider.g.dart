// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_comment_replies_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$paginatedPostCommentRepliesListHash() =>
    r'b29b02333cb66b484e7d08fd62da9cf6b2f3be0f';

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

abstract class _$PaginatedPostCommentRepliesList
    extends BuildlessAutoDisposeNotifier<PagingStatus> {
  late final int commentId;

  PagingStatus build(
    int commentId,
  );
}

/// See also [PaginatedPostCommentRepliesList].
@ProviderFor(PaginatedPostCommentRepliesList)
const paginatedPostCommentRepliesListProvider =
    PaginatedPostCommentRepliesListFamily();

/// See also [PaginatedPostCommentRepliesList].
class PaginatedPostCommentRepliesListFamily extends Family<PagingStatus> {
  /// See also [PaginatedPostCommentRepliesList].
  const PaginatedPostCommentRepliesListFamily();

  /// See also [PaginatedPostCommentRepliesList].
  PaginatedPostCommentRepliesListProvider call(
    int commentId,
  ) {
    return PaginatedPostCommentRepliesListProvider(
      commentId,
    );
  }

  @override
  PaginatedPostCommentRepliesListProvider getProviderOverride(
    covariant PaginatedPostCommentRepliesListProvider provider,
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
  String? get name => r'paginatedPostCommentRepliesListProvider';
}

/// See also [PaginatedPostCommentRepliesList].
class PaginatedPostCommentRepliesListProvider
    extends AutoDisposeNotifierProviderImpl<PaginatedPostCommentRepliesList,
        PagingStatus> {
  /// See also [PaginatedPostCommentRepliesList].
  PaginatedPostCommentRepliesListProvider(
    int commentId,
  ) : this._internal(
          () => PaginatedPostCommentRepliesList()..commentId = commentId,
          from: paginatedPostCommentRepliesListProvider,
          name: r'paginatedPostCommentRepliesListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$paginatedPostCommentRepliesListHash,
          dependencies: PaginatedPostCommentRepliesListFamily._dependencies,
          allTransitiveDependencies:
              PaginatedPostCommentRepliesListFamily._allTransitiveDependencies,
          commentId: commentId,
        );

  PaginatedPostCommentRepliesListProvider._internal(
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
    covariant PaginatedPostCommentRepliesList notifier,
  ) {
    return notifier.build(
      commentId,
    );
  }

  @override
  Override overrideWith(PaginatedPostCommentRepliesList Function() create) {
    return ProviderOverride(
      origin: this,
      override: PaginatedPostCommentRepliesListProvider._internal(
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
  AutoDisposeNotifierProviderElement<PaginatedPostCommentRepliesList,
      PagingStatus> createElement() {
    return _PaginatedPostCommentRepliesListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PaginatedPostCommentRepliesListProvider &&
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
mixin PaginatedPostCommentRepliesListRef
    on AutoDisposeNotifierProviderRef<PagingStatus> {
  /// The parameter `commentId` of this provider.
  int get commentId;
}

class _PaginatedPostCommentRepliesListProviderElement
    extends AutoDisposeNotifierProviderElement<PaginatedPostCommentRepliesList,
        PagingStatus> with PaginatedPostCommentRepliesListRef {
  _PaginatedPostCommentRepliesListProviderElement(super.provider);

  @override
  int get commentId =>
      (origin as PaginatedPostCommentRepliesListProvider).commentId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
