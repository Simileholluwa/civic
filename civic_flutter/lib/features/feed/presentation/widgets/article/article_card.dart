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
    this.fromDetails = false,
  });

  final PostWithUserState postWithUserState;
  final bool fromDetails;
  final VoidCallback? onTap;

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
    final hasTags = post.tags != null && post.tags!.isNotEmpty;
    final hasLocations = post.locations != null && post.locations!.isNotEmpty;
    return InkWell(
      onTap: fromDetails
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              spacing: 10,
              children: [
                Expanded(
                  child: Text(
                    post.text!,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                    textAlign: TextAlign.left,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: const Text(
                    'Article',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          RepaintBoundary(
            child: Container(
              width: double.maxFinite,
              margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  TSizes.md,
                ),
                color: Theme.of(context).cardColor,
                border: Border.all(
                  color: Theme.of(context).dividerColor,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  TSizes.md,
                ),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: ContentCachedImage(
                    url: post.mediaAssets!.first.publicUrl!,
                    height: post.mediaAssets!.first.height!.toDouble(),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: RepaintBoundary(
              child: ContentExpandableText(
                text: articleContent,
                hasImage: true,
                maxLines: 3,
                onToggleTextTap: () {},
              ),
            ),
          ),
          if (hasTags || hasLocations)
            ContentEngagementTagsAndLocations(
              tags: post.taggedUsers ?? [],
              locations: post.locations ?? [],
              hasTags: hasTags,
              hasLocations: hasLocations,
            ),
          if (!fromDetails)
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
