// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$postDetailHash() => r'78c0c21523462969d80e736bbd1acc0cf8d8ffb1';

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
class PostDetailFamily extends Family<AsyncValue<Post?>> {
  /// See also [postDetail].
  const PostDetailFamily();

  /// See also [postDetail].
  PostDetailProvider call(
    int id,
    bool isDraft,
    DraftPost? draftPost,
  ) {
    return PostDetailProvider(
      id,
      isDraft,
      draftPost,
    );
  }

  @override
  PostDetailProvider getProviderOverride(
    covariant PostDetailProvider provider,
  ) {
    return call(
      provider.id,
      provider.isDraft,
      provider.draftPost,
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
class PostDetailProvider extends AutoDisposeFutureProvider<Post?> {
  /// See also [postDetail].
  PostDetailProvider(
    int id,
    bool isDraft,
    DraftPost? draftPost,
  ) : this._internal(
          (ref) => postDetail(
            ref as PostDetailRef,
            id,
            isDraft,
            draftPost,
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
          isDraft: isDraft,
          draftPost: draftPost,
        );

  PostDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.isDraft,
    required this.draftPost,
  }) : super.internal();

  final int id;
  final bool isDraft;
  final DraftPost? draftPost;

  @override
  Override overrideWith(
    FutureOr<Post?> Function(PostDetailRef provider) create,
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
        isDraft: isDraft,
        draftPost: draftPost,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Post?> createElement() {
    return _PostDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PostDetailProvider &&
        other.id == id &&
        other.isDraft == isDraft &&
        other.draftPost == draftPost;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, isDraft.hashCode);
    hash = _SystemHash.combine(hash, draftPost.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PostDetailRef on AutoDisposeFutureProviderRef<Post?> {
  /// The parameter `id` of this provider.
  int get id;

  /// The parameter `isDraft` of this provider.
  bool get isDraft;

  /// The parameter `draftPost` of this provider.
  DraftPost? get draftPost;
}

class _PostDetailProviderElement extends AutoDisposeFutureProviderElement<Post?>
    with PostDetailRef {
  _PostDetailProviderElement(super.provider);

  @override
  int get id => (origin as PostDetailProvider).id;
  @override
  bool get isDraft => (origin as PostDetailProvider).isDraft;
  @override
  DraftPost? get draftPost => (origin as PostDetailProvider).draftPost;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
