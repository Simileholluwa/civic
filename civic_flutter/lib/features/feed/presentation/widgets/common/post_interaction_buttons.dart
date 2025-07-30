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
    this.isArticle = false,
    this.iconSize = 24,
  });

  final Post post;
  final bool isPoll;
  final bool hasPadding;
  final VoidCallback? onReply;
  final IconData replyIcon1;
  final bool isReply;
  final bool isComment;
  final int originalPostId;
  final bool isArticle;
  final double iconSize;

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
            iconSize: iconSize,
            color: postCardState.hasLiked == true
                ? TColors.primary
                : Theme.of(context).hintColor,
            text: postCardState.numberOfLikes,
          ),
          ContentInteractionButton(
            icon: replyIcon1,
            text: postCardState.numberOfComments,
            onTap: onReply,
            color: Theme.of(context).hintColor,
            iconSize: iconSize,
          ),
          ContentInteractionButton(
            icon: postCardState.hasBookmarked
                ? Icons.bookmark
                : Icons.bookmark_add_outlined,
            onTap: () async {
              await postCardNotifier.togglePostBookmarkStatus(
                post.id!, postCardState.hasBookmarked
              );
            },
            iconSize: iconSize,
            text: postCardState.numberOfBookmarks,
            color: postCardState.hasBookmarked
                ? TColors.primary
                : Theme.of(context).hintColor,
          ),
          ContentInteractionButton(
            icon: Icons.share,
            showText: false,
            onTap: () {},
            color: Theme.of(context).hintColor,
            iconSize: iconSize,
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
                      isArticle: isArticle,
                    ),
                  );
                },
              );
            },
            iconSize: iconSize,
            color: Theme.of(context).hintColor,
          ),
        ],
      ),
    );
  }
}
