// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_video_player_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PostVideoPlayer)
final postVideoPlayerProvider = PostVideoPlayerFamily._();

final class PostVideoPlayerProvider
    extends $NotifierProvider<PostVideoPlayer, Raw<VideoPlayerController?>?> {
  PostVideoPlayerProvider._({
    required PostVideoPlayerFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'postVideoPlayerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$postVideoPlayerHash();

  @override
  String toString() {
    return r'postVideoPlayerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PostVideoPlayer create() => PostVideoPlayer();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Raw<VideoPlayerController?>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Raw<VideoPlayerController?>?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PostVideoPlayerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$postVideoPlayerHash() => r'26933f87d6b336040eca7c873f87788196e30d5f';

final class PostVideoPlayerFamily extends $Family
    with
        $ClassFamilyOverride<
          PostVideoPlayer,
          Raw<VideoPlayerController?>?,
          Raw<VideoPlayerController?>?,
          Raw<VideoPlayerController?>?,
          String
        > {
  PostVideoPlayerFamily._()
    : super(
        retry: null,
        name: r'postVideoPlayerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PostVideoPlayerProvider call(String videoUrl) =>
      PostVideoPlayerProvider._(argument: videoUrl, from: this);

  @override
  String toString() => r'postVideoPlayerProvider';
}

abstract class _$PostVideoPlayer
    extends $Notifier<Raw<VideoPlayerController?>?> {
  late final _$args = ref.$arg as String;
  String get videoUrl => _$args;

  Raw<VideoPlayerController?>? build(String videoUrl);
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
