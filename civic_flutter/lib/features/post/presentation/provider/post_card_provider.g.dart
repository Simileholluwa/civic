// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_card_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$postCardWidgetHash() => r'202f2e11d9db95965f816f9bea6831d9385a182e';

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

abstract class _$PostCardWidget extends BuildlessNotifier<PostCardState> {
  late final Post? post;

  PostCardState build(
    Post? post,
  );
}

/// See also [PostCardWidget].
@ProviderFor(PostCardWidget)
const postCardWidgetProvider = PostCardWidgetFamily();

/// See also [PostCardWidget].
class PostCardWidgetFamily extends Family<PostCardState> {
  /// See also [PostCardWidget].
  const PostCardWidgetFamily();

  /// See also [PostCardWidget].
  PostCardWidgetProvider call(
    Post? post,
  ) {
    return PostCardWidgetProvider(
      post,
    );
  }

  @override
  PostCardWidgetProvider getProviderOverride(
    covariant PostCardWidgetProvider provider,
  ) {
    return call(
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
  String? get name => r'postCardWidgetProvider';
}

/// See also [PostCardWidget].
class PostCardWidgetProvider
    extends NotifierProviderImpl<PostCardWidget, PostCardState> {
  /// See also [PostCardWidget].
  PostCardWidgetProvider(
    Post? post,
  ) : this._internal(
          () => PostCardWidget()..post = post,
          from: postCardWidgetProvider,
          name: r'postCardWidgetProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$postCardWidgetHash,
          dependencies: PostCardWidgetFamily._dependencies,
          allTransitiveDependencies:
              PostCardWidgetFamily._allTransitiveDependencies,
          post: post,
        );

  PostCardWidgetProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.post,
  }) : super.internal();

  final Post? post;

  @override
  PostCardState runNotifierBuild(
    covariant PostCardWidget notifier,
  ) {
    return notifier.build(
      post,
    );
  }

  @override
  Override overrideWith(PostCardWidget Function() create) {
    return ProviderOverride(
      origin: this,
      override: PostCardWidgetProvider._internal(
        () => create()..post = post,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        post: post,
      ),
    );
  }

  @override
  NotifierProviderElement<PostCardWidget, PostCardState> createElement() {
    return _PostCardWidgetProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PostCardWidgetProvider && other.post == post;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, post.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PostCardWidgetRef on NotifierProviderRef<PostCardState> {
  /// The parameter `post` of this provider.
  Post? get post;
}

class _PostCardWidgetProviderElement
    extends NotifierProviderElement<PostCardWidget, PostCardState>
    with PostCardWidgetRef {
  _PostCardWidgetProviderElement(super.provider);

  @override
  Post? get post => (origin as PostCardWidgetProvider).post;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
