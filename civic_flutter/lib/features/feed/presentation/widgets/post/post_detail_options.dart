import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class PostDetailOptions extends ConsumerWidget {
  const PostDetailOptions({
    required this.post,
    super.key,
    this.isPoll = false,
    this.isArticle = false,
    this.isReply = false,
    this.isComment = false,
  });

  final Post post;
  final bool isPoll;
  final bool isArticle;
  final bool isReply;
  final bool isComment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postCardState = ref.watch(
      feedButtonsProvider(
        post,
      ),
    );
    final postCardNotifier = ref.watch(
      feedButtonsProvider(
        post,
      ).notifier,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () async {
            await postCardNotifier.togglePostLikeStatus(
              post.id!,
            );
          },
          icon: Icon(
            postCardState.hasLiked ? Iconsax.heart5 : Iconsax.heart,
            color: postCardState.hasLiked
                ? TColors.primary
                : Theme.of(context).iconTheme.color!,
          ),
        ),
        IconButton(
          onPressed: () async {
            await postCardNotifier.togglePostBookmarkStatus(
              post.id!,
              postCardState.hasBookmarked,
            );
          },
          icon: Icon(
            postCardState.hasBookmarked
                ? Icons.bookmark
                : Icons.bookmark_add_outlined,
            color: postCardState.hasBookmarked
                ? TColors.primary
                : Theme.of(context).iconTheme.color!,
          ),
        ),
        IconButton(
          onPressed: () async {},
          icon: const Icon(
            Icons.share,
          ),
        ),
        if (postCardState.canEdit)
          IconButton(
            onPressed: () async {
              if (isPoll) {
                await context.push(
                  '/create/poll/${post.id!}',
                  extra: {
                    'post': post,
                  },
                );
              } else if (isArticle) {
                await context.push(
                  '/create/article/${post.id!}',
                  extra: {
                    'post': post,
                  },
                );
              } else {
                await context.push(
                  '/create/post/${post.id}',
                  extra: {
                    'post': post,
                    'project': post.project,
                  },
                );
              }
            },
            icon: const Icon(
              Iconsax.edit,
            ),
          ),
        if (!postCardState.isOwner)
          IconButton(
            onPressed: () async {
              await context.push(
                '/feed/post/${post.id}/notInterested',
                extra: {
                  'post': post,
                  'originalPostId': post.id!,
                },
              );
            },
            icon: const Icon(
              Iconsax.eye_slash,
            ),
          ),
        if (postCardState.isOwner)
          IconButton(
            onPressed: () async {
              final result = await FeedHelperFunctions.deletePostDialog(
                context,
                post.id!,
              );
              if (result != null) {
                if (result) {
                  await postCardNotifier.deletePost(
                    post.id!,
                    post.id!,
                    isReply,
                    isComment,
                    isPoll,
                    isArticle,
                  );
                }
              }
            },
            icon: const Icon(
              Iconsax.trash,
              color: Colors.red,
            ),
          ),
        if (!postCardState.isOwner)
          IconButton(
            onPressed: () async {},
            icon: const Icon(
              Iconsax.flag,
              color: Colors.red,
            ),
          ),
      ],
    );
  }
}
