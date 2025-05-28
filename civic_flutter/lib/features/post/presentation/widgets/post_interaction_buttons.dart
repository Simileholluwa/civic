import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class PostInteractionButtons extends ConsumerWidget {
  const PostInteractionButtons({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postCardState = ref.watch(
      postCardWidgetProvider(post),
    );
    final postCardNotifier = ref.watch(
      postCardWidgetProvider(post).notifier,
    );
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 10),
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
            icon:
                postCardState.hasCommented ? Iconsax.message5 : Iconsax.message,
            text: postCardState.numberOfComments,
            onTap: () async {
              context.push(
                '/feed/post/${post.id}/comments',
              );
            },
            color: postCardState.hasCommented == true
                ? TColors.primary
                : Theme.of(context).iconTheme.color!,
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
            text: postCardState.numberOfReposts,
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
