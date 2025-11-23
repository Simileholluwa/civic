import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class PostInteractionButtons extends ConsumerWidget {
  const PostInteractionButtons({
    required this.postWithUserState,
    super.key,
    this.hasPadding = true,
    this.onReply,
    this.replyIcon1 = Iconsax.message_text,
    this.iconSize = 20,
  });

  final PostWithUserState postWithUserState;
  final bool hasPadding;
  final VoidCallback? onReply;
  final IconData replyIcon1;
  final double iconSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feedProv =
        feedButtonsProvider(PostWithUserStateKey(postWithUserState));
    final post = postWithUserState.post;
    final hasLiked = ref.watch(
      feedProv.select(
        (s) => s.hasLiked,
      ),
    );
    final likeCount = ref.watch(
      feedProv.select(
        (s) => s.numberOfLikes,
      ),
    );
    final commentCount = ref.watch(
      feedProv.select(
        (s) => s.numberOfComments,
      ),
    );
    final hasBookmarked = ref.watch(
      feedProv.select(
        (s) => s.hasBookmarked,
      ),
    );
    final bookmarkCount = ref.watch(
      feedProv.select(
        (s) => s.numberOfBookmarks,
      ),
    );
    final impressionCount = ref.watch(
      feedProv.select(
        (s) => s.impressionCount,
      ),
    );
    final postCardNotifier = ref.read(feedProv.notifier);
    final userId = ref.read(localStorageProvider).getInt('userId');
    final isOwner = post.owner?.id == userId;

    return Padding(
      padding: hasPadding
          ? const EdgeInsets.fromLTRB(10, 0, 10, 10)
          : EdgeInsets.zero,
      child: RepaintBoundary(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ContentInteractionButton(
              icon: hasLiked ? Iconsax.heart5 : Iconsax.heart,
              onTap: () async {
                final id = post.id;
                if (id == null) return;
                await postCardNotifier.togglePostLikeStatus(id);
              },
              iconSize: iconSize,
              color: hasLiked ? TColors.primary : Theme.of(context).hintColor,
              text: FeedHelperFunctions.humanizeNumber(likeCount),
            ),
            ContentInteractionButton(
              icon: replyIcon1,
              text: FeedHelperFunctions.humanizeNumber(commentCount),
              onTap: onReply,
              color: Theme.of(context).hintColor,
              iconSize: iconSize,
            ),
            ContentInteractionButton(
              icon:
                  hasBookmarked ? Icons.bookmark : Icons.bookmark_add_outlined,
              onTap: () async {
                final id = post.id;
                if (id == null) return;
                await postCardNotifier.togglePostBookmarkStatus(
                  id,
                  hasBookmarked,
                );
              },
              iconSize: iconSize,
              text: FeedHelperFunctions.humanizeNumber(bookmarkCount),
              color:
                  hasBookmarked ? TColors.primary : Theme.of(context).hintColor,
            ),
            ContentInteractionButton(
              icon: Iconsax.chart,
              text: THelperFunctions.humanizeNumber(impressionCount),
              onTap: isOwner ? () {} : null,
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
      ),
    );
  }
}
