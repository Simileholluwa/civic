// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_comment_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getCommentHash() => r'fe3d3046939b7d2d362475b83848126eb589145e';

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

/// See also [getComment].
@ProviderFor(getComment)
const getCommentProvider = GetCommentFamily();

/// See also [getComment].
class GetCommentFamily extends Family<AsyncValue<Post>> {
  /// See also [getComment].
  const GetCommentFamily();

  /// See also [getComment].
  GetCommentProvider call(
    int commentId,
    bool isComment,
  ) {
    return GetCommentProvider(
      commentId,
      isComment,
    );
  }

  @override
  GetCommentProvider getProviderOverride(
    covariant GetCommentProvider provider,
  ) {
    return call(
      provider.commentId,
      provider.isComment,
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
  String? get name => r'getCommentProvider';
}

/// See also [getComment].
class GetCommentProvider extends AutoDisposeFutureProvider<Post> {
  /// See also [getComment].
  GetCommentProvider(
    int commentId,
    bool isComment,
  ) : this._internal(
          (ref) => getComment(
            ref as GetCommentRef,
            commentId,
            isComment,
          ),
          from: getCommentProvider,
          name: r'getCommentProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getCommentHash,
          dependencies: GetCommentFamily._dependencies,
          allTransitiveDependencies:
              GetCommentFamily._allTransitiveDependencies,
          commentId: commentId,
          isComment: isComment,
        );

  GetCommentProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.commentId,
    required this.isComment,
  }) : super.internal();

  final int commentId;
  final bool isComment;

  @override
  Override overrideWith(
    FutureOr<Post> Function(GetCommentRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetCommentProvider._internal(
        (ref) => create(ref as GetCommentRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        commentId: commentId,
        isComment: isComment,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Post> createElement() {
    return _GetCommentProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetCommentProvider &&
        other.commentId == commentId &&
        other.isComment == isComment;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, commentId.hashCode);
    hash = _SystemHash.combine(hash, isComment.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetCommentRef on AutoDisposeFutureProviderRef<Post> {
  /// The parameter `commentId` of this provider.
  int get commentId;

  /// The parameter `isComment` of this provider.
  bool get isComment;
}

class _GetCommentProviderElement extends AutoDisposeFutureProviderElement<Post>
    with GetCommentRef {
  _GetCommentProviderElement(super.provider);

  @override
  int get commentId => (origin as GetCommentProvider).commentId;
  @override
  bool get isComment => (origin as GetCommentProvider).isComment;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
