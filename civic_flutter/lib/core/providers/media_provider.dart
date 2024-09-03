//ignore_for_file: avoid_build_context_in_providers,

import 'dart:io';

import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/helpers/image_helper.dart';
import 'package:civic_flutter/core/toasts_messages/toast_messages.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:video_player/video_player.dart';

part 'media_provider.g.dart';

@riverpod
class Media extends _$Media {
  static final imageHelper = ImageHelper();
  static const int maxImageCount = 10;
  static const int maxVideoSizeInMb = 10;

  @override
  List<String> build() {
    return <String>[];
  }

  void setDraftImage(List<String> images) {
    state = [...images];
  }

  void setVideo(String video) {
    state = [video];
    ref.read(mediaVideoPlayerProvider);
  }

  Future<void> takeVideo() async {
    final imageHelper = ImageHelper();
    final video = await imageHelper.takeVideo();
    if (video != null) {
      setVideo(video.path);
    }
  }

  Future<void> pickVideo(
    BuildContext context,
  ) async {
    final imageHelper = ImageHelper();
    final video = await imageHelper.pickVideo();
    if (video != null) {
      final fileSizeInBytes = await video.length();
      final fileSizeInMB = fileSizeInBytes ~/ (1024 * 1024);
      if (fileSizeInMB > 20) {
        if (context.mounted) {
          TToastMessages.infoToast(
            'File size must be less than 20MB.',
          );
          return;
        }
      }
      setVideo(video.path);
    }
  }

  Future<void> takePicture() async {
    if (state.length >= maxImageCount) return;
    final image = await imageHelper.takeImage();
    if (image != null && state.length < 10) {
      if (isVideo()) {
        state = [];
      }
      state = [...state, image.path];
    }
  }

  Future<void> pickPicture(
    BuildContext context,
  ) async {
    if (state.length >= maxImageCount) return;
    final imageLength = maxImageCount - state.length;
    final image = await imageHelper.pickImage(
      multipleImages: imageLength > 1 ? true : false,
    );
    if (image != null) {
      if (isVideo()) {
        state = [];
      }
      var imagePaths = <String>[];
      for (final img in image) {
        imagePaths.add(img.path);
      }
      state = [...state, ...imagePaths.take(imageLength)];
      if (context.mounted && image.length > imageLength) {
        TToastMessages.infoToast(
          'A maximum of 10 images can be uploaded.',
        );
      }
    }
  }

  void removeImageAtIndex(index) {
    var images = state;
    if (images.length == 1) state = [];
    images.removeAt(index);
    state = [...images];
  }

  String hintText(String username) {
    if (isImages()) {
      return '$username, caption your images';
    } else if (isImage()) {
      return '$username, caption your image';
    } else if (isVideo()) {
      return '$username, caption your video';
    } else {
      return "$username, what's happening in politics? Tap here to start typing.";
    }
  }

  bool isImages() {
    if (state.isNotEmpty &&
        state.length > 1 &&
        THelperFunctions.isImage(state.first)) {
      return true;
    }
    return false;
  }

  bool isImage() {
    if (state.isNotEmpty && THelperFunctions.isImage(state.first)) {
      return true;
    }
    return false;
  }

  bool isVideo() {
    if (state.isNotEmpty && THelperFunctions.isVideo(state.first)) {
      return true;
    }
    return false;
  }

  void clearMedia() {
    state = <String>[];
  }
}

@riverpod
class MediaVideoPlayer extends _$MediaVideoPlayer {
  @override
  Raw<VideoPlayerController?> build() {
    if (ref.watch(mediaProvider).isNotEmpty &&
        THelperFunctions.isVideo(ref.watch(mediaProvider).first)) {
      final videoFile = File(
        ref.watch(mediaProvider).first,
      );

      final player = VideoPlayerController?.file(videoFile)
        ..initialize().then((_) {
          state?.setVolume(0);
          state?.play();
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
}
