import 'dart:io' as io show Directory, File;
import 'package:cached_network_image/cached_network_image.dart'
    show CachedNetworkImageProvider;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill/flutter_quill_internal.dart';
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';
// ignore: implementation_imports
import 'package:flutter_quill_extensions/src/editor/image/widgets/image.dart'
    show getImageProviderByImageSource;
import 'package:path/path.dart' as path;

class ArticleTextEditor extends StatelessWidget {
  const ArticleTextEditor({
    required this.controller,
    required this.configurations,
    required this.scrollController,
    required this.focusNode,
    super.key,
  });

  final QuillController controller;
  final QuillEditorConfigurations configurations;
  final ScrollController scrollController;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = DefaultTextStyle.of(context);
    return QuillEditor(
      scrollController: scrollController,
      focusNode: focusNode,
      controller: controller,
      configurations: configurations.copyWith(
        elementOptions: const QuillEditorElementOptions(
          codeBlock: QuillEditorCodeBlockElementOptions(
            enableLineNumbers: true,
          ),
          orderedList: QuillEditorOrderedListElementOptions(),
          unorderedList: QuillEditorUnOrderedListElementOptions(
            useTextColorForDot: true,
          ),
        ),
        customStyles: DefaultStyles(
          h1: DefaultTextBlockStyle(
            Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: 23,
              height: 1.15,
            ),
            HorizontalSpacing.zero,
            const VerticalSpacing(16, 0),
            VerticalSpacing.zero,
            null,
          ),
          paragraph: DefaultTextBlockStyle(
            Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 17,
            ),
            HorizontalSpacing.zero,
            VerticalSpacing.zero,
            VerticalSpacing.zero,
            null,
          ),
          placeHolder: DefaultTextBlockStyle(
            Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 17,
              color: Theme.of(context).textTheme.bodySmall!.color!,
            ),
            HorizontalSpacing.zero,
            VerticalSpacing.zero,
            VerticalSpacing.zero,
            null,
          ),
          sizeSmall: defaultTextStyle.style.copyWith(fontSize: 9),
          
        ),
        scrollable: true,
        placeholder: 'Write the content of your article here. Use the toolbar to format ad apply all the styles you need.',
        padding: const EdgeInsets.all(16),
        
        onImagePaste: (imageBytes) async {
          if (kIsWeb) {
            return null;
          }
          // We will save it to system temporary files
          final newFileName =
              'imageFile-${DateTime.now().toIso8601String()}.png';
          final newPath = path.join(
            io.Directory.systemTemp.path,
            newFileName,
          );
          final file = await io.File(
            newPath,
          ).writeAsBytes(imageBytes, flush: true);
          return file.path;
        },
        onGifPaste: (gifBytes) async {
          if (kIsWeb) {
            return null;
          }
          // We will save it to system temporary files
          final newFileName = 'gifFile-${DateTime.now().toIso8601String()}.gif';
          final newPath = path.join(
            io.Directory.systemTemp.path,
            newFileName,
          );
          final file = await io.File(
            newPath,
          ).writeAsBytes(gifBytes, flush: true);
          return file.path;
        },
        embedBuilders: [
          ...(kIsWeb
              ? FlutterQuillEmbeds.editorWebBuilders()
              : FlutterQuillEmbeds.editorBuilders(
                  imageEmbedConfigurations: QuillEditorImageEmbedConfigurations(
                    imageErrorWidgetBuilder: (context, error, stackTrace) {
                      return Text(
                        'Error while loading an image: ${error.toString()}',
                      );
                    },
                    imageProviderBuilder: (context, imageUrl) {
                      
                      if (isAndroidApp || isIosApp || kIsWeb) {
                        if (isHttpBasedUrl(imageUrl)) {
                          return CachedNetworkImageProvider(
                            imageUrl,
                          );
                        }
                      }
                      return getImageProviderByImageSource(
                        imageUrl,
                        imageProviderBuilder: null,
                        context: context,
                        assetsPrefix: QuillSharedExtensionsConfigurations.get(
                                context: context)
                            .assetsPrefix,
                      );
                    },
                  ),
                  videoEmbedConfigurations: QuillEditorVideoEmbedConfigurations(
                    customVideoBuilder: (videoUrl, readOnly) {
                      return null;
                    },
                    ignoreYouTubeSupport: true,
                  ),
                )),
        ],
      ),
    );
  }
}