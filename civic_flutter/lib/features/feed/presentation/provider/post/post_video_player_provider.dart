import 'dart:io';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:video_player/video_player.dart';
part 'post_video_player_provider.g.dart';

@riverpod
class PostVideoPlayer extends _$PostVideoPlayer {
  @override
  Raw<VideoPlayerController?> build(String videoUrl) {
    ref.onDispose(() async {
      await state?.dispose();
    });
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
    } else {
      final player = VideoPlayerController?.file(
        File(videoUrl),
      )..initialize().then((_) async {
          await state?.pause();
          await state?.setLooping(true);
          ref.notifyListeners();
        });

      return player;
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

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    if (hours > 0) {
      return '${twoDigits(hours)}:${twoDigits(minutes)}:${twoDigits(seconds)}';
    } else {
      return '${twoDigits(minutes)}:${twoDigits(seconds)}';
    }
  }
}

@riverpod
Future<String> getVideo(Ref ref, String videoUrl) async {
  final fileInfo = await DefaultCacheManager().getFileFromCache(videoUrl);
  if (fileInfo == null) {
    final file = await DefaultCacheManager().getSingleFile(videoUrl);
    return file.path;
  } else {
    return fileInfo.file.path;
  }
}
