// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_comment_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getPostCommentHash() => r'824cc9e90999fcfc96292be13d6e679c4e4dcb9e';

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

/// See also [getPostComment].
@ProviderFor(getPostComment)
const getPostCommentProvider = GetPostCommentFamily();

/// See also [getPostComment].
class GetPostCommentFamily extends Family<AsyncValue<void>> {
  /// See also [getPostComment].
  const GetPostCommentFamily();

  /// See also [getPostComment].
  GetPostCommentProvider call(
    int commentId,
    bool isComment,
  ) {
    return GetPostCommentProvider(
      commentId,
      isComment,
    );
  }

  @override
  GetPostCommentProvider getProviderOverride(
    covariant GetPostCommentProvider provider,
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
  String? get name => r'getPostCommentProvider';
}

/// See also [getPostComment].
class GetPostCommentProvider extends AutoDisposeFutureProvider<void> {
  /// See also [getPostComment].
  GetPostCommentProvider(
    int commentId,
    bool isComment,
  ) : this._internal(
          (ref) => getPostComment(
            ref as GetPostCommentRef,
            commentId,
            isComment,
          ),
          from: getPostCommentProvider,
          name: r'getPostCommentProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getPostCommentHash,
          dependencies: GetPostCommentFamily._dependencies,
          allTransitiveDependencies:
              GetPostCommentFamily._allTransitiveDependencies,
          commentId: commentId,
          isComment: isComment,
        );

  GetPostCommentProvider._internal(
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
    FutureOr<void> Function(GetPostCommentRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetPostCommentProvider._internal(
        (ref) => create(ref as GetPostCommentRef),
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
  AutoDisposeFutureProviderElement<void> createElement() {
    return _GetPostCommentProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetPostCommentProvider &&
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
mixin GetPostCommentRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `commentId` of this provider.
  int get commentId;

  /// The parameter `isComment` of this provider.
  bool get isComment;
}

class _GetPostCommentProviderElement
    extends AutoDisposeFutureProviderElement<void> with GetPostCommentRef {
  _GetPostCommentProviderElement(super.provider);

  @override
  int get commentId => (origin as GetPostCommentProvider).commentId;
  @override
  bool get isComment => (origin as GetPostCommentProvider).isComment;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
