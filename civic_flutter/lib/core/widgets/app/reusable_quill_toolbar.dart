import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';

class ReusableQuillToolbar extends StatelessWidget {
  const ReusableQuillToolbar({
    required this.quillController,
    super.key,
  });

  final QuillController quillController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).dividerColor,
          ),
        ),
      ),
      padding: const EdgeInsets.only(
        bottom: 4,
      ),
      child: QuillSimpleToolbar(
        controller: quillController,
        config: QuillSimpleToolbarConfig(
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          multiRowsDisplay: false,
          showSearchButton: false,
          showFontFamily: false,
          showColorButton: false,
          showBackgroundColorButton: false,
          showHeaderStyle: false,
          showFontSize: false,
          embedButtons: FlutterQuillEmbeds.toolbarButtons(
            videoButtonOptions: null,
          ),
        ),
      ),
    );
  }
}
