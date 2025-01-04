// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_video_player_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getVideoHash() => r'76a72c5a928893586f4f5c664b03f092f596979c';

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

/// See also [getVideo].
@ProviderFor(getVideo)
const getVideoProvider = GetVideoFamily();

/// See also [getVideo].
class GetVideoFamily extends Family<AsyncValue<String>> {
  /// See also [getVideo].
  const GetVideoFamily();

  /// See also [getVideo].
  GetVideoProvider call(
    String videoUrl,
  ) {
    return GetVideoProvider(
      videoUrl,
    );
  }

  @override
  GetVideoProvider getProviderOverride(
    covariant GetVideoProvider provider,
  ) {
    return call(
      provider.videoUrl,
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
  String? get name => r'getVideoProvider';
}

/// See also [getVideo].
class GetVideoProvider extends AutoDisposeFutureProvider<String> {
  /// See also [getVideo].
  GetVideoProvider(
    String videoUrl,
  ) : this._internal(
          (ref) => getVideo(
            ref as GetVideoRef,
            videoUrl,
          ),
          from: getVideoProvider,
          name: r'getVideoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getVideoHash,
          dependencies: GetVideoFamily._dependencies,
          allTransitiveDependencies: GetVideoFamily._allTransitiveDependencies,
          videoUrl: videoUrl,
        );

  GetVideoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.videoUrl,
  }) : super.internal();

  final String videoUrl;

  @override
  Override overrideWith(
    FutureOr<String> Function(GetVideoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetVideoProvider._internal(
        (ref) => create(ref as GetVideoRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        videoUrl: videoUrl,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _GetVideoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetVideoProvider && other.videoUrl == videoUrl;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, videoUrl.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetVideoRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `videoUrl` of this provider.
  String get videoUrl;
}

class _GetVideoProviderElement extends AutoDisposeFutureProviderElement<String>
    with GetVideoRef {
  _GetVideoProviderElement(super.provider);

  @override
  String get videoUrl => (origin as GetVideoProvider).videoUrl;
}

String _$postVideoPlayerHash() => r'0a09868f6b9937d3ebad76848c734a48f3032ce3';

abstract class _$PostVideoPlayer
    extends BuildlessAutoDisposeNotifier<Raw<VideoPlayerController?>> {
  late final String videoUrl;

  Raw<VideoPlayerController?> build(
    String videoUrl,
  );
}

/// See also [PostVideoPlayer].
@ProviderFor(PostVideoPlayer)
const postVideoPlayerProvider = PostVideoPlayerFamily();

/// See also [PostVideoPlayer].
class PostVideoPlayerFamily extends Family<Raw<VideoPlayerController?>> {
  /// See also [PostVideoPlayer].
  const PostVideoPlayerFamily();

  /// See also [PostVideoPlayer].
  PostVideoPlayerProvider call(
    String videoUrl,
  ) {
    return PostVideoPlayerProvider(
      videoUrl,
    );
  }

  @override
  PostVideoPlayerProvider getProviderOverride(
    covariant PostVideoPlayerProvider provider,
  ) {
    return call(
      provider.videoUrl,
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
  String? get name => r'postVideoPlayerProvider';
}

/// See also [PostVideoPlayer].
class PostVideoPlayerProvider extends AutoDisposeNotifierProviderImpl<
    PostVideoPlayer, Raw<VideoPlayerController?>> {
  /// See also [PostVideoPlayer].
  PostVideoPlayerProvider(
    String videoUrl,
  ) : this._internal(
          () => PostVideoPlayer()..videoUrl = videoUrl,
          from: postVideoPlayerProvider,
          name: r'postVideoPlayerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$postVideoPlayerHash,
          dependencies: PostVideoPlayerFamily._dependencies,
          allTransitiveDependencies:
              PostVideoPlayerFamily._allTransitiveDependencies,
          videoUrl: videoUrl,
        );

  PostVideoPlayerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.videoUrl,
  }) : super.internal();

  final String videoUrl;

  @override
  Raw<VideoPlayerController?> runNotifierBuild(
    covariant PostVideoPlayer notifier,
  ) {
    return notifier.build(
      videoUrl,
    );
  }

  @override
  Override overrideWith(PostVideoPlayer Function() create) {
    return ProviderOverride(
      origin: this,
      override: PostVideoPlayerProvider._internal(
        () => create()..videoUrl = videoUrl,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        videoUrl: videoUrl,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<PostVideoPlayer,
      Raw<VideoPlayerController?>> createElement() {
    return _PostVideoPlayerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PostVideoPlayerProvider && other.videoUrl == videoUrl;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, videoUrl.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PostVideoPlayerRef
    on AutoDisposeNotifierProviderRef<Raw<VideoPlayerController?>> {
  /// The parameter `videoUrl` of this provider.
  String get videoUrl;
}

class _PostVideoPlayerProviderElement
    extends AutoDisposeNotifierProviderElement<PostVideoPlayer,
        Raw<VideoPlayerController?>> with PostVideoPlayerRef {
  _PostVideoPlayerProviderElement(super.provider);

  @override
  String get videoUrl => (origin as PostVideoPlayerProvider).videoUrl;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
