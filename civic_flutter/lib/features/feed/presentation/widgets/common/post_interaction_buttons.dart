import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class PostInteractionButtons extends ConsumerWidget {
  const PostInteractionButtons({
    required this.post,
    super.key,
    this.hasPadding = true,
    this.onReply,
    this.replyIcon1 = Iconsax.message_text,
    this.iconSize = 20,
  });

  final Post post;
  final bool hasPadding;
  final VoidCallback? onReply;
  final IconData replyIcon1;
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
      padding: hasPadding
          ? const EdgeInsets.fromLTRB(10, 0, 10, 10)
          : EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ContentInteractionButton(
            icon: postCardState.hasLiked ? Iconsax.heart5 : Iconsax.heart,
            onTap: () async {
              await postCardNotifier.togglePostLikeStatus(
                post.id!,
              );
            },
            iconSize: iconSize,
            color: postCardState.hasLiked
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
                post.id!,
                postCardState.hasBookmarked,
              );
            },
            iconSize: iconSize,
            text: postCardState.numberOfBookmarks,
            color: postCardState.hasBookmarked
                ? TColors.primary
                : Theme.of(context).hintColor,
          ),
          ContentInteractionButton(
            icon: Iconsax.chart,
            text: THelperFunctions.humanizeNumber(
              postCardState.impressionCount,
            ),
            onTap: postCardState.isOwner ? () {} : null,
            color: Theme.of(context).hintColor,
            iconSize: iconSize,
          ),
          ContentInteractionButton(
            icon: Icons.share,
            showText: false,
            onTap: () {},
            color: Theme.of(context).hintColor,
            iconSize: iconSize,
          ),
        ],
      ),
    );
  }
}
