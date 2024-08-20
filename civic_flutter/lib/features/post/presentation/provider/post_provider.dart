//ignore_for_file: avoid_build_context_in_providers

import 'dart:developer';

import 'package:civic_flutter/core/helpers/image_helper.dart';
import 'package:civic_flutter/core/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'post_provider.g.dart';

@Riverpod(keepAlive: true)
class Post extends _$Post {
  @override
  bool build() => true;

  Future<void> takeVideo() async {
    final imageHelper = ImageHelper();
    final video = await imageHelper.takeVideo();
    if (video != null) {
      log(video.path);
    }
  }

  Future<void> takePicture() async {
    final imageHelper = ImageHelper();
    final image = await imageHelper.takeImage();
    if (image != null) {
      log(image.path);
    }
  }

  Future<void> pickPicture(bool multipleImages) async {
    final imageHelper = ImageHelper();
    final image = await imageHelper.pickImage(multipleImages: multipleImages);
    if (image != null) {
      log(
        image.toString(),
      );
    }
  }

  Future<void> pickVideo() async {
    final imageHelper = ImageHelper();
    final image = await imageHelper.pickVideo();
    if (image != null) {
      log(
        image.path,
      );
    }
  }

  void pickMedia(
    BuildContext context,
    RequestType requestType,
    int maxCount,
    bool isAddMedia,
    List<XFile> pickedAssets,
  ) {
    context.pushNamed(
      AppRoutes.pickMedia,
      extra: {
        'requestType': requestType,
        'maxCount': maxCount,
        'isAddMedia': isAddMedia,
        'pickedAssets': pickedAssets,
      },
    );
  }
}
