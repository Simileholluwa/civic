import 'dart:convert';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class ProjectDocumentDescription extends StatelessWidget {
  const ProjectDocumentDescription({
    required this.project,
    super.key,
  });

  final Project project;

  static final Map<int, Document> _documentCache = <int, Document>{};

  Document _resolveDocument() {
    final id = project.id;
    if (id != null && _documentCache.containsKey(id)) {
      return _documentCache[id]!;
    }
    final raw = project.description;
    if (raw == null) {
      return Document();
    }

    final dynamic decoded = jsonDecode(raw);
    Document doc;
    if (decoded is List) {
      doc = Document.fromJson(decoded);
    } else if (decoded is Map<String, dynamic>) {
      doc = Document.fromJson([decoded]);
    } else {
      doc = Document();
    }
    if (id != null) {
      _documentCache[id] = doc;
    }
    return doc;
  }

  @override
  Widget build(BuildContext context) {
    final decodedDocument = _resolveDocument();
    final defaultTextStyle = DefaultTextStyle.of(context);
    return QuillEditor(
      controller: QuillController(
        document: decodedDocument,
        selection: const TextSelection.collapsed(offset: 0),
        readOnly: true,
      ),
      focusNode: FocusNode(canRequestFocus: false),
      scrollController: ScrollController(),
      config: QuillEditorConfig(
        scrollable: false,
        customStyles: THelperFunctions.articleTextEditorStyles(
          context,
          defaultTextStyle,
        ),
        embedBuilders: [
          RoundedImageEmbedBuilder(
            borderRadius: BorderRadius.circular(
              16,
            ),
          ),
        ],
      ),
    );
  }
}
