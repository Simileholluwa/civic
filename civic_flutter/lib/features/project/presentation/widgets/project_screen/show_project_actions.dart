import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:civic_flutter/features/user/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class ShowProjectActions extends ConsumerWidget {
  const ShowProjectActions({
    super.key,
    required this.project,
    this.fromDetails = false,
  });

  final Project project;
  final bool fromDetails;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userNotifier = ref.watch(currentActiveUserProvider.notifier);
    final projectCardState = ref.watch(
      projectCardWidgetProvider(
        project,
      ),
    );
    final projectCardNotifier = ref.watch(
      projectCardWidgetProvider(
        project,
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
        if (projectCardState.canVet! && !projectCardState.isOwner!)
          MoreActionsListTile(
            title:
                projectCardState.isBookmarked! ? 'Remove Bookmark' : 'Bookmark',
            subTitle: projectCardState.isBookmarked!
                ? 'This project will be removed from your bookmarks.'
                : "Bookmarking let's you easily access your favorite projects.",
            icon: projectCardState.isBookmarked!
                ? Icons.bookmark
                : Icons.bookmark_add_outlined,
            onTap: () async {
              if (context.mounted) {
                context.pop();
              }
              final result = await projectCardNotifier.toggleBookmarkStatus(
                project.id!,
              );
              if (result) {
                if (!projectCardState.isBookmarked!) {
                  TToastMessages.infoToast('Project has been bookmarked');
                } else {
                  TToastMessages.infoToast(
                      'Project has been removed from bookmarks');
                }
              }
            },
          ),
        if (!projectCardState.canEdit)
          MoreActionsListTile(
            title: 'Share',
            subTitle: "Invite others to vet or review this project.",
            icon: Icons.share,
            onTap: () async {},
          ),
        if (!projectCardState.isOwner!)
          MoreActionsListTile(
            title: 'Not interested',
            subTitle: "I don't want to see this project in my feed.",
            icon: Iconsax.eye_slash,
            onTap: () async {
              if (context.mounted) {
                context.pop();
                if (fromDetails) {
                  context.pop();
                }
              }
              final result = await projectCardNotifier.markProjectNotInterested(
                project.id!,
              );
              if (result) {
                TToastMessages.infoToast(
                  'You will no longer see this project in your feed.',
                );
              }
            },
          ),
        if (!projectCardState.isOwner!)
          MoreActionsListTile(
            title: projectCardState.isFollower! ? 'Unfollow' : 'Follow',
            subTitle: projectCardState.isFollower!
                ? 'You will no longer see projects from ${project.owner!.userInfo!.userName}.'
                : 'You will now see more projects from ${project.owner!.userInfo!.userName}.',
            icon: projectCardState.isFollower!
                ? Iconsax.user_remove
                : Iconsax.user_cirlce_add,
            onTap: () async {
              if (context.mounted) {
                context.pop();
              }
              final result = await userNotifier.toggleFollow(
                project.ownerId,
              );

              if (result) {
                projectCardNotifier.setIsFollower();
                if (!projectCardState.isFollower!) {
                  TToastMessages.infoToast(
                    'You are now following ${project.owner!.userInfo!.userName}',
                  );
                } else {
                  TToastMessages.infoToast(
                    'You are no longer following ${project.owner!.userInfo!.userName}',
                  );
                }
              }
            },
          ),
        if (projectCardState.isOwner!)
          MoreActionsListTile(
            title: 'Delete',
            subTitle:
                "Ensure you understand the consequences of deleting a project.",
            icon: Iconsax.trash,
            color: Colors.red,
            onTap: () async {
              if (context.mounted) {
                context.pop();
              }
              ProjectHelperFunctions.deleteProjectBottomSheet(
                context,
                project,
                fromDetails,
              );
            },
          ),
        if (!projectCardState.isOwner!)
          MoreActionsListTile(
            title: 'Report',
            subTitle: "This project is inappropriate or offensive.",
            icon: Iconsax.flag,
            color: Colors.red,
            onTap: () async {},
          ),
      ],
    );
  }
}
