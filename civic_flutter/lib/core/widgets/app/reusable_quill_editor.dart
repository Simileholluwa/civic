import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

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
          RoundedImageEmbedBuilder(
            borderRadius: BorderRadius.circular(TSizes.md),
          ),
        ],
      ),
    );
  }
}
