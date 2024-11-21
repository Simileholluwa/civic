// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mediaVideoPlayerHash() => r'058c9525173b8c0221e60b084127646ac2f1b5f5';

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

abstract class _$MediaVideoPlayer
    extends BuildlessAutoDisposeNotifier<Raw<VideoPlayerController?>> {
  late final String? videoUrl;

  Raw<VideoPlayerController?> build(
    String? videoUrl,
  );
}

/// See also [MediaVideoPlayer].
@ProviderFor(MediaVideoPlayer)
const mediaVideoPlayerProvider = MediaVideoPlayerFamily();

/// See also [MediaVideoPlayer].
class MediaVideoPlayerFamily extends Family<Raw<VideoPlayerController?>> {
  /// See also [MediaVideoPlayer].
  const MediaVideoPlayerFamily();

  /// See also [MediaVideoPlayer].
  MediaVideoPlayerProvider call(
    String? videoUrl,
  ) {
    return MediaVideoPlayerProvider(
      videoUrl,
    );
  }

  @override
  MediaVideoPlayerProvider getProviderOverride(
    covariant MediaVideoPlayerProvider provider,
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
  String? get name => r'mediaVideoPlayerProvider';
}

/// See also [MediaVideoPlayer].
class MediaVideoPlayerProvider extends AutoDisposeNotifierProviderImpl<
    MediaVideoPlayer, Raw<VideoPlayerController?>> {
  /// See also [MediaVideoPlayer].
  MediaVideoPlayerProvider(
    String? videoUrl,
  ) : this._internal(
          () => MediaVideoPlayer()..videoUrl = videoUrl,
          from: mediaVideoPlayerProvider,
          name: r'mediaVideoPlayerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$mediaVideoPlayerHash,
          dependencies: MediaVideoPlayerFamily._dependencies,
          allTransitiveDependencies:
              MediaVideoPlayerFamily._allTransitiveDependencies,
          videoUrl: videoUrl,
        );

  MediaVideoPlayerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.videoUrl,
  }) : super.internal();

  final String? videoUrl;

  @override
  Raw<VideoPlayerController?> runNotifierBuild(
    covariant MediaVideoPlayer notifier,
  ) {
    return notifier.build(
      videoUrl,
    );
  }

  @override
  Override overrideWith(MediaVideoPlayer Function() create) {
    return ProviderOverride(
      origin: this,
      override: MediaVideoPlayerProvider._internal(
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
  AutoDisposeNotifierProviderElement<MediaVideoPlayer,
      Raw<VideoPlayerController?>> createElement() {
    return _MediaVideoPlayerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MediaVideoPlayerProvider && other.videoUrl == videoUrl;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, videoUrl.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MediaVideoPlayerRef
    on AutoDisposeNotifierProviderRef<Raw<VideoPlayerController?>> {
  /// The parameter `videoUrl` of this provider.
  String? get videoUrl;
}

class _MediaVideoPlayerProviderElement
    extends AutoDisposeNotifierProviderElement<MediaVideoPlayer,
        Raw<VideoPlayerController?>> with MediaVideoPlayerRef {
  _MediaVideoPlayerProviderElement(super.provider);

  @override
  String? get videoUrl => (origin as MediaVideoPlayerProvider).videoUrl;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
