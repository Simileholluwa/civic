// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MediaVideoPlayer)
final mediaVideoPlayerProvider = MediaVideoPlayerFamily._();

final class MediaVideoPlayerProvider
    extends $NotifierProvider<MediaVideoPlayer, Raw<VideoPlayerController?>?> {
  MediaVideoPlayerProvider._({
    required MediaVideoPlayerFamily super.from,
    required String? super.argument,
  }) : super(
         retry: null,
         name: r'mediaVideoPlayerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$mediaVideoPlayerHash();

  @override
  String toString() {
    return r'mediaVideoPlayerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  MediaVideoPlayer create() => MediaVideoPlayer();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Raw<VideoPlayerController?>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Raw<VideoPlayerController?>?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MediaVideoPlayerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$mediaVideoPlayerHash() => r'186319a1c893cf3b19d23b5d507f12280ef2d7bf';

final class MediaVideoPlayerFamily extends $Family
    with
        $ClassFamilyOverride<
          MediaVideoPlayer,
          Raw<VideoPlayerController?>?,
          Raw<VideoPlayerController?>?,
          Raw<VideoPlayerController?>?,
          String?
        > {
  MediaVideoPlayerFamily._()
    : super(
        retry: null,
        name: r'mediaVideoPlayerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MediaVideoPlayerProvider call(String? videoUrl) =>
      MediaVideoPlayerProvider._(argument: videoUrl, from: this);

  @override
  String toString() => r'mediaVideoPlayerProvider';
}

abstract class _$MediaVideoPlayer
    extends $Notifier<Raw<VideoPlayerController?>?> {
  late final _$args = ref.$arg as String?;
  String? get videoUrl => _$args;

  Raw<VideoPlayerController?>? build(String? videoUrl);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<Raw<VideoPlayerController?>?, Raw<VideoPlayerController?>?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                Raw<VideoPlayerController?>?,
                Raw<VideoPlayerController?>?
              >,
              Raw<VideoPlayerController?>?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
