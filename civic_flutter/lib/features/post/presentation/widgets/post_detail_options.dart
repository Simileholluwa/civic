import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class PostDetailOptions extends ConsumerWidget {
  const PostDetailOptions({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postCardState = ref.watch(
      postCardWidgetProvider(
        post,
      ),
    );
    final postCardNotifier = ref.watch(
      postCardWidgetProvider(
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
            postCardState.hasLiked
                ? Iconsax.heart5
                : Iconsax.heart,
            color: postCardState.hasLiked
                ? TColors.primary
                : Theme.of(context).iconTheme.color!,
          ),
        ),
        IconButton(
          onPressed: () async {
            await postCardNotifier.togglePostBookmarkStatus(
              post.id!,
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
          icon: Icon(
            Icons.share,
          ),
        ),
        if (postCardState.isOwner)
          IconButton(
            onPressed: () async {},
            icon: Icon(
              Iconsax.edit,
            ),
          ),
        if (!postCardState.isOwner)
          IconButton(
            onPressed: () async {
              if (context.mounted) {
                context.pop();
              }
              final result =
                  await postCardNotifier.markPostNotInterested(
                post.id!,
              );
              if (result) {
                TToastMessages.infoToast(
                  'You will no longer see this post in your feed',
                );
              }
            },
            icon: Icon(
              Iconsax.eye_slash,
            ),
          ),
        if (postCardState.isOwner)
          IconButton(
            onPressed: () async {
              await postCardNotifier.deletePost(
                post.id!,
              );
              if (context.mounted) {
                context.pop();
              }
            },
            icon: Icon(
              Iconsax.trash,
              color: Colors.red,
            ),
          ),
        if (!postCardState.isOwner)
          IconButton(
            onPressed: () async {},
            icon: Icon(
              Iconsax.flag,
              color: Colors.red,
            ),
          ),
      ],
    );
  }
}
