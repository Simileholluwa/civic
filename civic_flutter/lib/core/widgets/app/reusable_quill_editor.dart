import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill/internal.dart';
// No direct use of flutter_quill_extensions here; using a custom image builder.

class _RoundedImageEmbedBuilder extends EmbedBuilder {
  _RoundedImageEmbedBuilder({required this.borderRadius});

  final BorderRadius borderRadius;

  @override
  String get key => BlockEmbed.imageType;

  @override
  Widget build(BuildContext context, EmbedContext embedContext) {
    final data = embedContext.node.value.data;
    final imageUrl = data is String ? data : data.toString();

    ImageProvider provider;
    if (isAndroidApp || isIosApp) {
      if (imageUrl.startsWith('http://') || imageUrl.startsWith('https://')) {
        provider = CachedNetworkImageProvider(
          imageUrl,
        );
      } else {
        provider = FileImage(
          File(
            imageUrl,
          ),
        );
      }
    } else {
      final uri = Uri.tryParse(imageUrl);
      if (uri != null && uri.scheme.isNotEmpty) {
        switch (uri.scheme) {
          case 'file':
            provider = FileImage(
              File(
                uri.toFilePath(),
              ),
            );
          case 'asset':
            provider = AssetImage(uri.path);
          case 'http':
          case 'https':
            provider = CachedNetworkImageProvider(
              imageUrl,
            );
          default:
            provider = FileImage(
              File(
                imageUrl,
              ),
            );
        }
      } else {
        provider = FileImage(
          File(
            imageUrl,
          ),
        );
      }
    }

    final imageWidget = Image(
      image: provider,
      fit: BoxFit.cover,
    );

    return ClipRRect(
      borderRadius: borderRadius,
      child: imageWidget,
    );
  }
}

class ReusableQuillEditor extends StatelessWidget {
  const ReusableQuillEditor({
    required this.controller,
    required this.scrollController,
    required this.focusNode,
    super.key,
    this.placeholder,
    this.editorPadding = const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 12,
    ),
  });

  final QuillController controller;
  final ScrollController scrollController;
  final FocusNode focusNode;
  final String? placeholder;
  final EdgeInsets editorPadding;

  @override
  Widget build(BuildContext context) {
    return QuillEditor(
      controller: controller,
      scrollController: scrollController,
      focusNode: focusNode,
      config: const QuillEditorConfig().copyWith(
        customStyles: THelperFunctions.articleTextEditorStyles(
          context,
          DefaultTextStyle.of(context),
        ),
        scrollable: true,
        placeholder: placeholder,
        padding: editorPadding,
        embedBuilders: [
          _RoundedImageEmbedBuilder(
            borderRadius: BorderRadius.circular(TSizes.md),
          ),
        ],
      ),
    );
  }
}
