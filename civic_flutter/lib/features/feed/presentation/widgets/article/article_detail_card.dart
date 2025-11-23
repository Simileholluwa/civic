import 'dart:convert';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class ArticleDetailCard extends StatelessWidget {
  const ArticleDetailCard({
    required this.post,
    super.key,
  });

  final Post post;

  static final Map<int, Document> _documentCache = <int, Document>{};

  Document _resolveDocument() {
    final id = post.id;
    if (id != null && _documentCache.containsKey(id)) {
      return _documentCache[id]!;
    }
    final raw = post.article?.content;
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
    final defaultTextStyle = DefaultTextStyle.of(context);
    final decodedDocument = _resolveDocument();
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          ContentCreatorInfo(
            creator: post.owner!,
            timeAgo: THelperFunctions.humanizeDateTime(
              post.dateCreated!,
            ),
          ),
          RepaintBoundary(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                TSizes.md,
              ),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: ContentSingleCachedImage(
                  useMargin: false,
                  imageUrl: post.imageUrls!.first,
                ),
              ),
            ),
          ),
          Text(
            post.text!,
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.left,
          ),
          RepaintBoundary(
            child: QuillEditor(
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
          ),
        ],
      ),
    );
  }
}
