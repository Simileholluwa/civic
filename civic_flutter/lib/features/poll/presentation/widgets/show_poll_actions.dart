import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/poll/poll.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class ShowPollActions extends ConsumerWidget {
  const ShowPollActions({
    super.key,
    required this.poll,
    this.fromDetails = false,
  });

  final Poll poll;
  final bool fromDetails;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pollCardState = ref.watch(
      pollCardWidgetProvider(
        poll,
      ),
    );
    final pollCardNotifier = ref.watch(
      pollCardWidgetProvider(
        poll,
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
        MoreActionsListTile(
          title: 'Share',
          subTitle: "Invite others to interact with this poll.",
          icon: Icons.share,
          onTap: () async {},
        ),
        if (pollCardState.isOwner)
          MoreActionsListTile(
            title: 'Edit',
            subTitle:
                'You can change the content of this poll however, previous version(s) will be saved.',
            icon: Iconsax.edit,
            onTap: () async {},
          ),
        if (!pollCardState.isOwner)
          MoreActionsListTile(
            title: 'Not interested',
            subTitle: "I don't want to see this poll in my feed.",
            icon: Iconsax.eye_slash,
            onTap: () async {},
          ),
        if (!pollCardState.isOwner)
          MoreActionsListTile(
            title: pollCardState.isFollower ? 'Unfollow' : 'Follow',
            subTitle: pollCardState.isFollower
                ? '${poll.owner!.userInfo!.userName} will be removed from people you follow.'
                : '${poll.owner!.userInfo!.userName} will be added to people you follow.',
            icon: pollCardState.isFollower
                ? Iconsax.user_remove
                : Iconsax.user_cirlce_add,
            onTap: () async {
              await pollCardNotifier.toggleFollow(
                poll.ownerId,
                poll.owner!.userInfo!.userName!,
              );
            },
          ),
        if (pollCardState.isOwner)
          MoreActionsListTile(
            title: 'Delete',
            subTitle:
                "This action is irreversible and cannot be undone. Proceed with caution.",
            icon: Iconsax.trash,
            color: Colors.red,
            onTap: () async {
              if (context.mounted) {
                context.pop();
              }
              await pollCardNotifier.deletePoll(
                poll.id!,
              );
            },
          ),
        if (!pollCardState.isOwner)
          MoreActionsListTile(
            title: 'Report',
            subTitle: "This poll is inappropriate or offensive.",
            icon: Iconsax.flag,
            color: Colors.red,
            onTap: () async {},
          ),
      ],
    );
  }
}
