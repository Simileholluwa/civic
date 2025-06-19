// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$feedHash() => r'8a336d7975e0ef53c11129cc07c8045c6ceecd5f';

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

abstract class _$Feed extends BuildlessAutoDisposeNotifier<FeedState> {
  late final Post? post;

  FeedState build(
    Post? post,
  );
}

/// See also [Feed].
@ProviderFor(Feed)
const feedProvider = FeedFamily();

/// See also [Feed].
class FeedFamily extends Family<FeedState> {
  /// See also [Feed].
  const FeedFamily();

  /// See also [Feed].
  FeedProvider call(
    Post? post,
  ) {
    return FeedProvider(
      post,
    );
  }

  @override
  FeedProvider getProviderOverride(
    covariant FeedProvider provider,
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
  String? get name => r'feedProvider';
}

/// See also [Feed].
class FeedProvider extends AutoDisposeNotifierProviderImpl<Feed, FeedState> {
  /// See also [Feed].
  FeedProvider(
    Post? post,
  ) : this._internal(
          () => Feed()..post = post,
          from: feedProvider,
          name: r'feedProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$feedHash,
          dependencies: FeedFamily._dependencies,
          allTransitiveDependencies: FeedFamily._allTransitiveDependencies,
          post: post,
        );

  FeedProvider._internal(
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
  FeedState runNotifierBuild(
    covariant Feed notifier,
  ) {
    return notifier.build(
      post,
    );
  }

  @override
  Override overrideWith(Feed Function() create) {
    return ProviderOverride(
      origin: this,
      override: FeedProvider._internal(
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
  AutoDisposeNotifierProviderElement<Feed, FeedState> createElement() {
    return _FeedProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FeedProvider && other.post == post;
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
mixin FeedRef on AutoDisposeNotifierProviderRef<FeedState> {
  /// The parameter `post` of this provider.
  Post? get post;
}

class _FeedProviderElement
    extends AutoDisposeNotifierProviderElement<Feed, FeedState> with FeedRef {
  _FeedProviderElement(super.provider);

  @override
  Post? get post => (origin as FeedProvider).post;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
