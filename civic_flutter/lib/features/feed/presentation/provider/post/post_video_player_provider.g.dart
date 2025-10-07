// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_video_player_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PostVideoPlayer)
const postVideoPlayerProvider = PostVideoPlayerFamily._();

final class PostVideoPlayerProvider
    extends $NotifierProvider<PostVideoPlayer, Raw<VideoPlayerController?>?> {
  const PostVideoPlayerProvider._(
      {required PostVideoPlayerFamily super.from,
      required String super.argument})
      : super(
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

String _$postVideoPlayerHash() => r'a8b69c316a53550bcf7f83ac08f38c76a812737c';

final class PostVideoPlayerFamily extends $Family
    with
        $ClassFamilyOverride<
            PostVideoPlayer,
            Raw<VideoPlayerController?>?,
            Raw<VideoPlayerController?>?,
            Raw<VideoPlayerController?>?,
            String> {
  const PostVideoPlayerFamily._()
      : super(
          retry: null,
          name: r'postVideoPlayerProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  PostVideoPlayerProvider call(
    String videoUrl,
  ) =>
      PostVideoPlayerProvider._(argument: videoUrl, from: this);

  @override
  String toString() => r'postVideoPlayerProvider';
}

abstract class _$PostVideoPlayer
    extends $Notifier<Raw<VideoPlayerController?>?> {
  late final _$args = ref.$arg as String;
  String get videoUrl => _$args;

  Raw<VideoPlayerController?>? build(
    String videoUrl,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args,
    );
    final ref = this.ref
        as $Ref<Raw<VideoPlayerController?>?, Raw<VideoPlayerController?>?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<Raw<VideoPlayerController?>?, Raw<VideoPlayerController?>?>,
        Raw<VideoPlayerController?>?,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

@ProviderFor(getVideo)
const getVideoProvider = GetVideoFamily._();

final class GetVideoProvider
    extends $FunctionalProvider<AsyncValue<String>, String, FutureOr<String>>
    with $FutureModifier<String>, $FutureProvider<String> {
  const GetVideoProvider._(
      {required GetVideoFamily super.from, required String super.argument})
      : super(
          retry: null,
          name: r'getVideoProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getVideoHash();

  @override
  String toString() {
    return r'getVideoProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<String> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String> create(Ref ref) {
    final argument = this.argument as String;
    return getVideo(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GetVideoProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getVideoHash() => r'76a72c5a928893586f4f5c664b03f092f596979c';

final class GetVideoFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<String>, String> {
  const GetVideoFamily._()
      : super(
          retry: null,
          name: r'getVideoProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  GetVideoProvider call(
    String videoUrl,
  ) =>
      GetVideoProvider._(argument: videoUrl, from: this);

  @override
  String toString() => r'getVideoProvider';
}
