import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class PostInteractionButtons extends ConsumerWidget {
  const PostInteractionButtons({
    super.key,
    required this.post,
    required this.originalPostId,
    this.hasPadding = true,
    this.onReply,
    this.replyIcon1 = Iconsax.message,
    this.isReply = false,
    this.isComment = false,
    this.isPoll = false,
  });

  final Post post;
  final bool isPoll;
  final bool hasPadding;
  final VoidCallback? onReply;
  final IconData replyIcon1;
  final bool isReply;
  final bool isComment;
  final int originalPostId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postCardState = ref.watch(
      feedButtonsProvider(post),
    );
    final postCardNotifier = ref.watch(
      feedButtonsProvider(post).notifier,
    );
    return Padding(
      padding: hasPadding ? const EdgeInsets.fromLTRB(12, 0, 12, 10) : EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ContentInteractionButton(
            icon:
                postCardState.hasLiked == true ? Iconsax.heart5 : Iconsax.heart,
            onTap: () async {
              await postCardNotifier.togglePostLikeStatus(
                post.id!,
              );
            },
            color: postCardState.hasLiked == true
                ? TColors.primary
                : Theme.of(context).iconTheme.color!,
            text: postCardState.numberOfLikes,
          ),
          ContentInteractionButton(
            icon: replyIcon1,
            text: postCardState.numberOfComments,
            onTap: onReply,
            color: Theme.of(context).iconTheme.color!,
          ),
          ContentInteractionButton(
            icon: postCardState.hasBookmarked
                ? Icons.bookmark
                : Icons.bookmark_add_outlined,
            onTap: () async {
              await postCardNotifier.togglePostBookmarkStatus(
                post.id!,
              );
            },
            text: postCardState.numberOfBookmarks,
            color: postCardState.hasBookmarked
                ? TColors.primary
                : Theme.of(context).textTheme.labelMedium!.color!,
          ),
          ContentInteractionButton(
            icon: Icons.share,
            showText: false,
            onTap: () {},
            color: Theme.of(context).colorScheme.onSurface,
          ),
          ContentInteractionButton(
            icon: Iconsax.more_circle,
            onTap: () {
              showDialog(
                context: context,
                builder: (ctx) {
                  return AlertDialog(
                    contentPadding: const EdgeInsets.only(bottom: 16,),
                    content: ShowPostActions(
                      post: post,
                      fromDetails: true,
                      isReply: isReply,
                      isComment: isComment,
                      originalPostId: originalPostId,
                      isPoll: isPoll,
                    ),
                  );
                },
              );
            },
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ],
      ),
    );
  }
}
