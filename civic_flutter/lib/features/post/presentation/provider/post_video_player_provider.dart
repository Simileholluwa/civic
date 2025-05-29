import 'dart:io';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:video_player/video_player.dart';
part 'post_video_player_provider.g.dart';

@riverpod
class PostVideoPlayer extends _$PostVideoPlayer {
  @override
  Raw<VideoPlayerController?> build(String videoUrl) {
    ref.onDispose(() {
      state?.dispose();
    });
    var videoFile = '';
    final regex = RegExp(r'\b(https?://[^\s/$.?#].[^\s]*)\b');
    final isUrlVideo = regex.hasMatch(videoUrl);
    if (isUrlVideo) {
      final data = ref.watch(
        getVideoProvider(
          videoUrl,
        ),
      );
      data.when(
        data: (value) {
          videoFile = value;
        },
        loading: () {
          videoFile = '';
        },
        error: (error, stack) {
          videoFile = '';
        },
      );
    } else {
      videoFile = videoUrl;
    }
    if (videoFile.isNotEmpty) {
      final file = File(
        videoFile,
      );
      final player = VideoPlayerController?.file(
        file,
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
