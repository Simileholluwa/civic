import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ArticleCard extends ConsumerWidget {
  const ArticleCard({
    required this.post,
    super.key,
    this.onTap,
    this.fromDetails = false,
  });

  final Post post;
  final bool fromDetails;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final livePost = ref.watch(
      postStreamProvider(
        post.id!,
        post,
      ),
    );
    final newPost = livePost.value ?? post;
    final postCardState = ref.watch(feedButtonsProvider(newPost));
    return InkWell(
      onTap: fromDetails
          ? null
          : onTap ??
              () async {
                await context.push(
                  '/feed/article/${post.id}',
                  extra: newPost,
                );
              },
      child: Column(
        spacing: 10,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 12, 15, 0),
            child: ContentCreatorInfo(
              creator: postCardState.creator!,
              timeAgo: postCardState.timeAgo,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              spacing: 10,
              children: [
                Expanded(
                  child: Text(
                    postCardState.text,
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
          Container(
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
                  url: postCardState.articleBanner,
                  height: 200,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 5,
              children: [
                ContentExpandableText(
                  text: postCardState.articleContent,
                  hasImage: true,
                  maxLines: 3,
                  onToggleTextTap: () {},
                ),
              ],
            ),
          ),
          if (postCardState.hasTags || postCardState.hasLocation)
            ContentEngagementTagsAndLocations(
              tags: postCardState.tags,
              locations: postCardState.locations,
              hasTags: postCardState.hasTags,
              hasLocations: postCardState.hasLocation,
            ),
          if (!fromDetails)
            PostInteractionButtons(
              post: newPost,
              onReply: () async {
                await context.push(
                  '/feed/post/${post.id}/comments',
                );
              },
              originalPostId: post.id!,
              isArticle: true,
            ),
        ],
      ),
    );
  }
}
