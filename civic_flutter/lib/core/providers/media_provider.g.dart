// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mediaHash() => r'95057458a81c0f8e024da21abc5ab6977ced5874';

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
String _$mediaVideoPlayerHash() => r'36f612133cda42b00d4245daf3ec7b5a35805608';

/// See also [MediaVideoPlayer].
@ProviderFor(MediaVideoPlayer)
final mediaVideoPlayerProvider = AutoDisposeNotifierProvider<MediaVideoPlayer,
    Raw<VideoPlayerController?>>.internal(
  MediaVideoPlayer.new,
  name: r'mediaVideoPlayerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$mediaVideoPlayerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MediaVideoPlayer = AutoDisposeNotifier<Raw<VideoPlayerController?>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
