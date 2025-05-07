import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class ProjectTextToolbar extends StatelessWidget {
  const ProjectTextToolbar({
    required this.controller,
    required this.focusNode,
    super.key,
  });

  final QuillController controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return QuillSimpleToolbar(
      controller: controller,
      config: const QuillSimpleToolbarConfig(
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        multiRowsDisplay: false,
        showSearchButton: false,
        showFontFamily: false,
        showColorButton: false,
        showBackgroundColorButton: false,
        showHeaderStyle: false,
        showClipboardCopy: false,
        showClipboardPaste: false,
        showClipboardCut: false,
      ),
    );
  }
}
