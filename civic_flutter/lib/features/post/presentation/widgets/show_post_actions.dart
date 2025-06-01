import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:civic_flutter/features/user/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class ShowPostActions extends ConsumerWidget {
  const ShowPostActions({
    super.key,
    required this.post,
    this.fromDetails = false,
  });

  final Post post;
  final bool fromDetails;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userNotifier = ref.watch(currentActiveUserProvider.notifier);
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'More actions',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.left,
              ),
              GestureDetector(
                onTap: context.pop,
                child: const Icon(
                  Icons.clear,
                  color: TColors.secondary,
                ),
              ),
            ],
          ),
        ),
        const Divider(
          height: 0,
        ),
        if (!postCardState.isOwner)
          MoreActionsListTile(
            title: 'Not interested',
            subTitle: "I don't want to see this post in my feed.",
            icon: Iconsax.eye_slash,
            onTap: () async {
              if (context.mounted) {
                context.pop();
                if (fromDetails) {
                  context.pop();
                }
                context.push(
                  '/feed/post/${post.id}/notInterested',
                  extra: post,

                );
              }
            },
          ),
        if (!postCardState.isOwner)
          MoreActionsListTile(
            title: postCardState.isFollower ? 'Unfollow' : 'Follow',
            subTitle: postCardState.isFollower
                ? 'You will no longer see posts from ${post.owner!.userInfo!.userName}.'
                : 'You will now see more posts from ${post.owner!.userInfo!.userName}.',
            icon: postCardState.isFollower
                ? Iconsax.user_remove
                : Iconsax.user_cirlce_add,
            onTap: () async {
              if (context.mounted) {
                context.pop();
              }
              final result = await userNotifier.toggleFollow(
                post.ownerId,
              );

              if (result) {
                postCardNotifier.setIsFollower();
                if (!postCardState.isFollower) {
                  TToastMessages.infoToast(
                    'You are now following ${post.owner!.userInfo!.userName}',
                  );
                } else {
                  TToastMessages.infoToast(
                    'You are no longer following ${post.owner!.userInfo!.userName}',
                  );
                }
              }
            },
          ),
        if (!postCardState.isOwner)
          MoreActionsListTile(
            title: 'Report',
            subTitle: "This post is inappropriate or offensive.",
            icon: Iconsax.flag,
            color: Colors.red,
            onTap: () async {},
          ),
        if (postCardState.isOwner)
          MoreActionsListTile(
            title: 'Edit',
            subTitle: "You can change the content of this post however, previous version(s) will be saved.",
            icon: Iconsax.edit,
            onTap: () {
              context.push(
                '/create/post/${post.id}',
              );
            },
          ),
        if (postCardState.isOwner)
          MoreActionsListTile(
            title: 'Delete',
            subTitle: "Keep in mind. Deleted posts can not be undone.",
            icon: Iconsax.trash,
            color: Colors.red,
            onTap: () async {
              if (context.mounted) {
                context.pop();
              }
              await PostHelperFunctions.deletePostDialog(
                context,
                postCardNotifier,
                post.id!,
              );

              if (context.mounted) {
                context.pop();
              }
            },
          ),
      ],
    );
  }
}
