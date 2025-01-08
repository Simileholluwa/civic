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
    return QuillToolbar.simple(
      controller: controller,

      configurations: const QuillSimpleToolbarConfigurations(
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
        
        fontSizesValues: {
          '17': '17.0',
          '18': '18.0',
          '19': '19.0',
          '20': '20.0',
          '22': '22.0',
          '24': '24.0',
        },
      ),
    );
  }
}
