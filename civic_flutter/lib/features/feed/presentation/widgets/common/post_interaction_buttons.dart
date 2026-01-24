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
    this.iconSize = 20,
  });

  final PostWithUserState postWithUserState;
  final bool hasPadding;
  final VoidCallback? onReply;
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
    final hasReposted = ref.watch(
      feedProv.select(
        (s) => s.hasReposted,
      ),
    );
    final bookmarkCount = ref.watch(
      feedProv.select(
        (s) => s.numberOfBookmarks,
      ),
    );
    final repostsCount = ref.watch(
      feedProv.select(
        (s) => s.numberOfReposts,
      ),
    );
    final postCardNotifier = ref.read(feedProv.notifier);

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
              icon: Iconsax.message_text,
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
              icon:
                  hasReposted ? Iconsax.repeate_music5 : Iconsax.repeate_music,
              text: THelperFunctions.humanizeNumber(repostsCount),
              onTap: () async {
                if (hasReposted) {
                  if (!context.mounted) return;
                  final res = await FeedHelperFunctions.undoRepost(context);
                  if (res == null || !res) {
                    return;
                  } else {
                    await postCardNotifier.repostPost(
                      post.id!,
                    );
                  }
                } else {
                  final id = post.id;
                  if (id == null) return;
                  await postCardNotifier.repostPost(
                    id,
                  );
                }
              },
              color:
                  hasReposted ? TColors.primary : Theme.of(context).hintColor,
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
