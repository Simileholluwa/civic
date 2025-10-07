import 'dart:io';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:video_player/video_player.dart';

part 'media_provider.g.dart';

@riverpod
class MediaVideoPlayer extends _$MediaVideoPlayer {
  @override
  Raw<VideoPlayerController?> build(String? videoUrl) {
    ref.onDispose(() async {
      await state?.dispose();
    });
    if (videoUrl != null) {
      final regex = RegExp(r'\b(https?://[^\s/$.?#].[^\s]*)\b');
      final isUrlVideo = regex.hasMatch(videoUrl);
      if (isUrlVideo) {
        final player = VideoPlayerController?.networkUrl(
          Uri.parse(videoUrl),
        )..initialize().then((_) async {
            await state?.pause();
            await state?.setLooping(true);
            ref.notifyListeners();
          });

        return player;
      }
      final videoFile = File(
        videoUrl,
      );
      final player = VideoPlayerController?.file(
        videoFile,
      )..initialize().then((_) async {
          await state?.pause();
          await state?.setLooping(true);
          ref.notifyListeners();
        });

      return player;
    } else {
      return null;
    }
  }

  Future<void> pausePlay() async {
    if (state != null) {
      if (state!.value.isPlaying) {
        await state!.pause();
      } else {
        await state!.play();
      }
      ref.notifyListeners();
    }
  }

  Future<void> muteUnmute() async {
    if (state != null) {
      if (state!.value.volume > 0) {
        await state!.setVolume(0);
      } else {
        await state!.setVolume(1);
      }
      ref.notifyListeners();
    }
  }

  Future<void> dispose() async {
    if (state != null) {
      await state!.dispose();
      ref.notifyListeners();
    }
  }

  Future<void> pause() async {
    if (state != null) {
      if (state!.value.isPlaying) {
        await state!.pause();
      }
    }
  }
}
