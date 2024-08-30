// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mediaHash() => r'a2f1dfdcbd7417b9737e629eb852e7fdf3d9a6ae';

/// See also [Media].
@ProviderFor(Media)
final mediaProvider = AutoDisposeNotifierProvider<Media, List<String>>.internal(
  Media.new,
  name: r'mediaProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$mediaHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Media = AutoDisposeNotifier<List<String>>;
String _$mediaVideoPlayerHash() => r'fb5a9080253ed42b87e10a26146465f2d3ebeb4d';

/// See also [MediaVideoPlayer].
@ProviderFor(MediaVideoPlayer)
final mediaVideoPlayerProvider = AutoDisposeNotifierProvider<MediaVideoPlayer,
    Raw<VideoPlayerController>>.internal(
  MediaVideoPlayer.new,
  name: r'mediaVideoPlayerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$mediaVideoPlayerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MediaVideoPlayer = AutoDisposeNotifier<Raw<VideoPlayerController>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
