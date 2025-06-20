// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$postDetailHash() => r'6078267e5a3e27de3e6c7cb33b8adf23a7ef3ecd';

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

/// See also [postDetail].
@ProviderFor(postDetail)
const postDetailProvider = PostDetailFamily();

/// See also [postDetail].
class PostDetailFamily extends Family<AsyncValue<Post>> {
  /// See also [postDetail].
  const PostDetailFamily();

  /// See also [postDetail].
  PostDetailProvider call(
    int id,
    String draftType,
    Post? post,
  ) {
    return PostDetailProvider(
      id,
      draftType,
      post,
    );
  }

  @override
  PostDetailProvider getProviderOverride(
    covariant PostDetailProvider provider,
  ) {
    return call(
      provider.id,
      provider.draftType,
      provider.post,
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
  String? get name => r'postDetailProvider';
}

/// See also [postDetail].
class PostDetailProvider extends AutoDisposeFutureProvider<Post> {
  /// See also [postDetail].
  PostDetailProvider(
    int id,
    String draftType,
    Post? post,
  ) : this._internal(
          (ref) => postDetail(
            ref as PostDetailRef,
            id,
            draftType,
            post,
          ),
          from: postDetailProvider,
          name: r'postDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$postDetailHash,
          dependencies: PostDetailFamily._dependencies,
          allTransitiveDependencies:
              PostDetailFamily._allTransitiveDependencies,
          id: id,
          draftType: draftType,
          post: post,
        );

  PostDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.draftType,
    required this.post,
  }) : super.internal();

  final int id;
  final String draftType;
  final Post? post;

  @override
  Override overrideWith(
    FutureOr<Post> Function(PostDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PostDetailProvider._internal(
        (ref) => create(ref as PostDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        draftType: draftType,
        post: post,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Post> createElement() {
    return _PostDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PostDetailProvider &&
        other.id == id &&
        other.draftType == draftType &&
        other.post == post;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, draftType.hashCode);
    hash = _SystemHash.combine(hash, post.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PostDetailRef on AutoDisposeFutureProviderRef<Post> {
  /// The parameter `id` of this provider.
  int get id;

  /// The parameter `draftType` of this provider.
  String get draftType;

  /// The parameter `post` of this provider.
  Post? get post;
}

class _PostDetailProviderElement extends AutoDisposeFutureProviderElement<Post>
    with PostDetailRef {
  _PostDetailProviderElement(super.provider);

  @override
  int get id => (origin as PostDetailProvider).id;
  @override
  String get draftType => (origin as PostDetailProvider).draftType;
  @override
  Post? get post => (origin as PostDetailProvider).post;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
