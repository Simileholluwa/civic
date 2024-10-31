import 'dart:io' as io show File;
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill/flutter_quill_internal.dart';
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart'
    show getApplicationDocumentsDirectory;

class ArticleTextToolbar extends StatelessWidget {
  const ArticleTextToolbar({
    required this.controller,
    required this.focusNode,
    super.key,
  });

  final QuillController controller;
  final FocusNode focusNode;

  Future<void> onImageInsertWithCropping(
    String image,
    QuillController controller,
    BuildContext context,
  ) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: image,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Cropper',
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9
          ],
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
          
          toolbarColor: Theme.of(context).scaffoldBackgroundColor,
          statusBarColor: TColors.dark,
          toolbarWidgetColor: Theme.of(context).iconTheme.color,
          activeControlsWidgetColor: TColors.primary,
          dimmedLayerColor: Theme.of(context).scaffoldBackgroundColor,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          cropFrameColor: THelperFunctions.isDarkMode(context) ? TColors.textWhite : TColors.black,
        
        ),
        IOSUiSettings(
          title: 'Cropper',
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9
          ],
        ),
        WebUiSettings(
          context: context,
        ),
      ],
    );
    final newImage = croppedFile?.path;
    if (newImage == null) {
      return;
    }
    if (kIsWeb) {
      controller.insertImageBlock(imageSource: newImage);
      return;
    }
    final newSavedImage = await saveImage(io.File(newImage));
    controller.insertImageBlock(imageSource: newSavedImage);
  }

  Future<void> onImageInsert(String image, QuillController controller) async {
    if (kIsWeb || isHttpBasedUrl(image)) {
      controller.insertImageBlock(imageSource: image);
      return;
    }
    final newSavedImage = await saveImage(io.File(image));
    controller.insertImageBlock(imageSource: newSavedImage);
  }

  Future<String> saveImage(io.File file) async {
    final appDocDir = await getApplicationDocumentsDirectory();
    final fileExt = path.extension(file.path);
    final newFileName = '${DateTime.now().toIso8601String()}$fileExt';
    final newPath = path.join(
      appDocDir.path,
      newFileName,
    );
    final copiedFile = await file.copy(newPath);
    return copiedFile.path;
  }

  @override
  Widget build(BuildContext context) {
    return QuillToolbar.simple(
      controller: controller,

      configurations: QuillSimpleToolbarConfigurations(
        
        multiRowsDisplay: false,
        showSearchButton: false,
        showFontFamily: false,
        showColorButton: false,
        showBackgroundColorButton: false,
        showHeaderStyle: false,
        showClipboardCopy: false,
        showClipboardPaste: false,
        showClipboardCut: false,
        
        fontSizesValues: const {
          '17': '17.0',
          '18': '18.0',
          '19': '19.0',
          '20': '20.0',
          '22': '22.0',
          '24': '24.0',
        },
        embedButtons: FlutterQuillEmbeds.toolbarButtons(
          imageButtonOptions: QuillToolbarImageButtonOptions(
            imageButtonConfigurations: QuillToolbarImageConfigurations(
              onImageInsertCallback: isAndroidApp || isIosApp || kIsWeb
                  ? (image, controller) =>
                      onImageInsertWithCropping(image, controller, context)
                  : onImageInsert,
            ),
          ),
        ),
      ),
    );
  }
}
