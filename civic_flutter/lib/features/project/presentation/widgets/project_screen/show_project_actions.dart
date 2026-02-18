import 'dart:async';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/network/network.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class ShowProjectActions extends ConsumerWidget {
  const ShowProjectActions({
    required this.projectWithUserState,
    super.key,
    this.fromDetails = false,
  });

  final ProjectWithUserState projectWithUserState;
  final bool fromDetails;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectProv = projectCardWidgetProvider(
      ProjectWithUserStateKey(
        projectWithUserState,
      ),
    );
    final project = projectWithUserState.project;
    final userId = ref.read(localStorageProvider).getInt('userId');
    final isOwner = userId == project.ownerId;
    final canVet = ProjectHelperFunctions.canVet(
      project.startDate!,
      project.endDate!,
    );
    final canEdit =
        DateTime.now().difference(project.dateCreated!).inMinutes < 100 &&
        userId == project.ownerId;
    final hasBookmarked = ref.watch(
      projectProv.select(
        (s) => s.isBookmarked,
      ),
    );
    final isFollower = ref.watch(
      projectProv.select(
        (s) => s.isFollower,
      ),
    );
    final projectCardNotifier = ref.read(
      projectProv.notifier,
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
                style: Theme.of(context).textTheme.headlineLarge,
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
        if (canVet && !isOwner)
          MoreActionsListTile(
            title: hasBookmarked ? 'Remove Bookmark' : 'Bookmark',
            subTitle: hasBookmarked
                ? 'This project will be removed from your bookmarks.'
                : "Bookmarking let's you easily access your favorite projects.",
            icon: hasBookmarked ? Icons.bookmark : Icons.bookmark_add_outlined,
            onTap: () async {
              if (context.mounted) {
                context.pop();
              }
              await projectCardNotifier.toggleBookmarkStatus(
                project.id!,
                showToast: true,
              );
            },
          ),
        if (!canEdit)
          MoreActionsListTile(
            title: 'Share',
            subTitle: 'Invite others to vet or review this project.',
            icon: Icons.share,
            onTap: () async {},
          ),
        if (!isOwner)
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
        if (!isOwner)
          MoreActionsListTile(
            title: isFollower ? 'Unfollow' : 'Follow',
            subTitle: isFollower
                ? 'You will no longer see projects from ${project.owner!.userInfo!.userName}.'
                : 'You will now see more projects from ${project.owner!.userInfo!.userName}.',
            icon: isFollower ? Iconsax.user_remove : Iconsax.user_cirlce_add,
            onTap: () async {
              if (context.mounted) {
                context.pop();
              }
              final result = await ref
                  .read(currentActiveUserProvider.notifier)
                  .toggleFollow(
                    project.ownerId,
                  );

              if (result) {
                projectCardNotifier.setIsFollower();
                if (!isFollower) {
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
        if (isOwner)
          MoreActionsListTile(
            title: 'Delete',
            subTitle:
                'Ensure you understand the consequences of deleting a project.',
            icon: Iconsax.trash,
            color: Colors.red,
            onTap: () async {
              final res = await deleteProjectBottomSheet(
                context,
                projectWithUserState,
              );
              if (res ?? false) {
                unawaited(
                  projectCardNotifier.deleteProject(
                    project.id!,
                  ),
                );
              }
              if (context.mounted) context.pop();
            },
          ),
        if (!isOwner)
          MoreActionsListTile(
            title: 'Report',
            subTitle: 'This project is inappropriate or offensive.',
            icon: Iconsax.flag,
            color: Colors.red,
            onTap: () async {},
          ),
      ],
    );
  }
}
