import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:civic_flutter/core/core.dart';

class ProjectTextEditor extends StatelessWidget {
  const ProjectTextEditor({
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
        placeholder: 'Describe in detail what this project is all about.' 
        ' Think of its purpose, benefits, impact, and any relevant milestones.'
        ' Use the toolbar to style your texts.',
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
    );
  }
}
