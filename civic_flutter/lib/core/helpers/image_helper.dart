import 'dart:io';

import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageHelper {
  ImageHelper({
    ImagePicker? imagePicker,
    ImageCropper? imageCropper,
  })  : _imagePicker = imagePicker ?? ImagePicker(),
        _imageCropper = imageCropper ?? ImageCropper();

  final ImagePicker _imagePicker;
  final ImageCropper _imageCropper;

  Future<List<XFile>?> pickImage({
    ImageSource source = ImageSource.gallery,
    int imageQuality = 100,
    int limit = 5,
    bool multipleImages = false,
  }) async {
    if (multipleImages) {
      return _imagePicker.pickMultiImage(
        imageQuality: imageQuality,
        limit: limit,
      );
    }
    final file = await _imagePicker.pickImage(
      source: source,
      imageQuality: imageQuality,
    );
    if (file != null) return [file];
    return null;
  }

  Future<XFile?>? takeImage({
    ImageSource source = ImageSource.camera,
    int imageQuality = 100,
  }) async {
    final file = await _imagePicker.pickImage(
      source: source,
      imageQuality: imageQuality,
    );
    if (file != null) return file;
    return null;
  }

  Future<XFile?> pickVideo({
    ImageSource source = ImageSource.gallery,
  }) async {
    final file = await _imagePicker.pickVideo(
      source: source,
    );
    if (file != null) return file;
    return null;
  }

  Future<XFile?> takeVideo({
    ImageSource source = ImageSource.camera,
  }) async {
    final file = await _imagePicker.pickVideo(
      source: source,
      maxDuration: const Duration(minutes: 5),
    );
    if (file != null) return file;
    return null;
  }

  Future<CroppedFile?> crop({
    required File file,
    CropStyle cropStyle = CropStyle.rectangle,
    required BuildContext context,
  }) async {
    final isDark = THelperFunctions.isDarkMode(context);
    return _imageCropper.cropImage(
      sourcePath: file.path,
      uiSettings: <PlatformUiSettings>[
        AndroidUiSettings(
          toolbarColor: Theme.of(context).scaffoldBackgroundColor,
          statusBarColor: TColors.dark,
          toolbarWidgetColor: Theme.of(context).iconTheme.color,
          activeControlsWidgetColor: TColors.primary,
          dimmedLayerColor: Theme.of(context).scaffoldBackgroundColor,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          cropFrameColor: isDark ? TColors.textWhite : TColors.black,
        ),
      ],
    );
  }
}
