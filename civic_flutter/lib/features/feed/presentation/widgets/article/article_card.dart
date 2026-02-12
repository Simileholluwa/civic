import 'dart:convert';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:go_router/go_router.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    required this.postWithUserState,
    super.key,
    this.onTap,
    this.showPadding = true,
    this.canTap = true,
    this.showCreatorInfo = true,
    this.showInteractions = true,
    this.maxLines = 3,
  });

  final PostWithUserState postWithUserState;
  final VoidCallback? onTap;
  final bool showPadding;
  final bool showCreatorInfo;
  final bool showInteractions;
  final bool canTap;
  final int maxLines;

  static final Map<int, String> _plainTextCache = <int, String>{};

  @override
  Widget build(BuildContext context) {
    var articleContent = '';
    final post = postWithUserState.post;
    final postId = post.id;
    if (postId != null && _plainTextCache.containsKey(postId)) {
      articleContent = _plainTextCache[postId]!;
    } else {
      final raw = post.article?.content;
      if (raw != null) {
        final dynamic decoded = jsonDecode(raw);
        if (decoded is List) {
          articleContent = Document.fromJson(decoded).toPlainText();
        } else if (decoded is Map<String, dynamic>) {
          articleContent = Document.fromJson([decoded]).toPlainText();
        }
      }
      if (postId != null) {
        _plainTextCache[postId] = articleContent;
      }
    }
    return InkWell(
      onTap: !canTap
          ? null
          : onTap ??
                () async {
                  await context.push(
                    '/feed/article/${post.id}',
                    extra: post,
                  );
                },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          if (showCreatorInfo)
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 12, 15, 0),
              child: ContentCreatorInfo(
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
            ),

          ArticleImageHeader(
            post: post,
            showPadding: showPadding,
          ),
          Padding(
            padding: showPadding
                ? const EdgeInsets.symmetric(horizontal: 15)
                : EdgeInsets.zero,
            child: RepaintBoundary(
              child: ContentExpandableText(
                text: articleContent,
                hasImage: true,
                maxLines: maxLines,
                onToggleTextTap: () {},
              ),
            ),
          ),
          if (showInteractions)
            PostInteractionButtons(
              postWithUserState: postWithUserState,
              onReply: () async {
                await context.push(
                  '/feed/post/${post.id}/comments',
                );
              },
            ),
        ],
      ),
    );
  }
}
