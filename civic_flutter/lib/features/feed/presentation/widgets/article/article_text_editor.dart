import 'package:cached_network_image/cached_network_image.dart'
    show CachedNetworkImageProvider;
import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill/internal.dart';
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';
// ignore: implementation_imports
import 'package:flutter_quill_extensions/src/editor/image/widgets/image.dart'
    show getImageProviderByImageSource;

class ArticleTextEditor extends StatelessWidget {
  const ArticleTextEditor({
    required this.controller,
    required this.configurations,
    required this.scrollController,
    required this.focusNode,
    super.key,
  });

  final QuillController controller;
  final QuillEditorConfig configurations;
  final ScrollController scrollController;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = DefaultTextStyle.of(context);
    return QuillEditor(
      scrollController: scrollController,
      focusNode: focusNode,
      controller: controller,
      config: configurations.copyWith(
        customStyles: THelperFunctions.articleTextEditorStyles(
          context,
          defaultTextStyle,
        ),
        scrollable: true,
        placeholder:
            'Write the content of your article here. Use the toolbar to format and apply all the styles you need.',
        padding: const EdgeInsets.all(16),
        embedBuilders: [
          ...(FlutterQuillEmbeds.editorBuilders(
            imageEmbedConfig: QuillEditorImageEmbedConfig(
              imageErrorWidgetBuilder: (context, error, stackTrace) {
                return Text(
                  'Error while loading an image: ${error.toString()}',
                );
              },
              imageProviderBuilder: (context, imageUrl) {
                if (isAndroidApp || isIosApp) {
                  if (imageUrl.startsWith('http://') ||
                      imageUrl.startsWith('https://')) {
                    return CachedNetworkImageProvider(
                      imageUrl,
                    );
                  }
                }
                return getImageProviderByImageSource(
                  imageUrl,
                  context: context,
                  imageProviderBuilder: null,
                );
              },
            ),
            videoEmbedConfig: QuillEditorVideoEmbedConfig(
              customVideoBuilder: (videoUrl, readOnly) {
                return null;
              },
            ),
          )),
        ],
      ),
    );
  }
}
