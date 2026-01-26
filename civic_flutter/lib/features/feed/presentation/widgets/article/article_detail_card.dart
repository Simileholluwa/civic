import 'dart:convert';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class ArticleDetailCard extends StatelessWidget {
  const ArticleDetailCard({
    required this.postWithUserState,
    super.key,
  });

  final PostWithUserState postWithUserState;

  static final Map<int, Document> _documentCache = <int, Document>{};

  Document _resolveDocument() {
    final post = postWithUserState.post;
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
    final post = postWithUserState.post;
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
            onMoreTapped: () async {
              await showDialog<dynamic>(
                context: context,
                builder: (ctx) {
                  return AlertDialog(
                    contentPadding: const EdgeInsets.only(
                      bottom: 16,
                    ),
                    content: ShowPostActions(
                      postWithUserState: postWithUserState,
                      originalPostId: post.id!,
                      isArticle: true,
                    ),
                  );
                },
              );
            },
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                TSizes.md,
              ),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: ContentSingleCachedImage(
                  useMargin: false,
                  imageUrl: post.mediaAssets!.first.publicUrl,
                ),
              ),
            ),
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
