import 'dart:convert';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectDetailsWidget extends ConsumerWidget {
  const ProjectDetailsWidget({
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
  Widget build(BuildContext context, WidgetRef ref) {
    final decodedDocument = _resolveDocument();
    final imagesUrl = project.projectImageAttachments!
        .map((e) => e.publicUrl)
        .toList();
    final defaultTextStyle = DefaultTextStyle.of(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (imagesUrl.length == 1)
            ContentSingleCachedImage(
              imageUrl: imagesUrl.first!,
              aspectRatio: project.projectImageAttachments?.first.aspectRatio ?? 1.0,
            )
          else
            ContentImageViewer(
              mediaAssets: project.projectImageAttachments!,
            ),
          Padding(
            padding: const EdgeInsets.only(
              top: 5,
            ),
            child: Text(
              project.title!,
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontSize: 23,
                  ),
            ),
          ),
          QuillEditor(
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
          ),
        ],
      ),
    );
  }
}
