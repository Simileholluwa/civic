//ignore_for_file: avoid_build_context_in_providers,

import 'dart:io';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:video_player/video_player.dart';

part 'media_provider.g.dart';

@riverpod
class MediaVideoPlayer extends _$MediaVideoPlayer {
  @override
  Raw<VideoPlayerController?> build(String? videoUrl) {
    if (videoUrl != null) {
      final regex = RegExp(r'\b(https?://[^\s/$.?#].[^\s]*)\b');
      final isUrlVideo = regex.hasMatch(videoUrl);
      if (isUrlVideo) {
        final player = VideoPlayerController?.networkUrl(
          Uri.parse(videoUrl),
        )..initialize().then((_) {
            state?.pause();
            state?.setLooping(true);
            ref.notifyListeners();
          });

        return player;
      }
      final videoFile = File(
        videoUrl,
      );
      final player = VideoPlayerController?.file(
        videoFile,
      )..initialize().then((_) {
          state?.pause();
          state?.setLooping(true);
          ref.notifyListeners();
        });

      return player;
    } else {
      return null;
    }
  }

  void pausePlay() {
    if (state != null) {
      if (state!.value.isPlaying) {
        state!.pause();
      } else {
        state!.play();
      }
      ref.notifyListeners();
    }
  }

  void muteUnmute() {
    if (state != null) {
      if (state!.value.volume > 0) {
        state!.setVolume(0);
      } else {
        state!.setVolume(1);
      }
      ref.notifyListeners();
    }
  }

  void dispose() {
    if (state != null) {
      state!.dispose();
      ref.notifyListeners();
    }
  }

  void pause() {
    if (state != null) {
      if (state!.value.isPlaying) {
        state!.pause();
      }
    }
  }
}
