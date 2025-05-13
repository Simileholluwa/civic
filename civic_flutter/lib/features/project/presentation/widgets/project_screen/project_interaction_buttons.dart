import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class ProjectInteractionButtons extends ConsumerWidget {
  const ProjectInteractionButtons({
    super.key,
    required this.projectCardNotifier,
    required this.project,
  });
  final ProjectCardWidget projectCardNotifier;
  final Project project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectCardState = ref.watch(
              projectCardWidgetProvider(
                project,
              ),
            );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ContentInteractionButton(
          icon: projectCardState.hasLiked! ? Iconsax.heart5 : Iconsax.heart,
          onTap: projectCardState.isDeleted!
              ? null
              : () async {
                  await projectCardNotifier.toggleLikeStatus(
                    project.id!,
                  );
                },
          text: projectCardState.numberOfLikes!,
          color: projectCardState.isDeleted!
              ? Theme.of(context).disabledColor
              : projectCardState.hasLiked!
                  ? TColors.primary
                  : Theme.of(context).iconTheme.color!,
        ),
        ContentInteractionButton(
          icon: projectCardState.hasReposted!
              ? Iconsax.repeate_music5
              : Iconsax.repeate_music,
          onTap: projectCardState.isDeleted!
              ? null
              : () {
                  if (projectCardState.hasReposted!) {
                    ProjectHelperFunctions.undoRepostDialog(
                      context,
                      ref,
                      project,
                    );
                    return;
                  }
                  context.push(
                    AppRoutes.createPost,
                    extra: {
                      'draft': null,
                      'project': project,
                      'id': 0,
                    },
                  );
                },
          text: projectCardState.numberOfReposts!,
          color: projectCardState.isDeleted!
              ? Theme.of(context).disabledColor
              : projectCardState.hasReposted!
                  ? TColors.primary
                  : Theme.of(context).iconTheme.color!,
        ),
        if (!projectCardState.isOwner!)
          ContentInteractionButton(
            icon: projectCardState.hasReviewed!
                ? Icons.star
                : Icons.star_border_outlined,
            iconSize: 22,
            text: projectCardState.numberOfReviews!,
            onTap: projectCardState.isDeleted!
                ? null
                : () {
                    showModalBottomSheet(
                      context: context,
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * .7,
                        minHeight: MediaQuery.of(context).size.height * .5,
                      ),
                      isScrollControlled: true,
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      elevation: 0,
                      builder: (ctx) {
                        return ProjectReviewScreen(
                          projectId: project.id!,
                          fromDetails: false,
                        );
                      },
                    );
                  },
            color: projectCardState.isDeleted!
                ? Theme.of(context).disabledColor
                : projectCardState.hasReviewed!
                    ? TColors.primary
                    : Theme.of(context).iconTheme.color!,
          )
        else
          ContentInteractionButton(
            icon: projectCardState.isBookmarked!
                ? Icons.bookmark
                : Icons.bookmark_add_outlined,
            text: projectCardState.numberOfBookmarks!,
            onTap: projectCardState.isDeleted!
                ? null
                : () async {
                    await projectCardNotifier.toggleBookmarkStatus(
                      project.id!,
                    );
                  },
            color: projectCardState.isDeleted!
                ? Theme.of(context).disabledColor
                : projectCardState.isBookmarked!
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).colorScheme.onSurface,
          ),
        if (projectCardState.canVet! && !projectCardState.isOwner!)
          ContentInteractionButton(
            icon: projectCardState.hasVerified!
                ? Iconsax.medal_star5
                : Iconsax.medal_star,
            text: projectCardState.numberOfVerifies!,
            onTap: projectCardState.isDeleted!
                ? null
                : () {
                    showModalBottomSheet(
                      context: context,
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * .7,
                        minHeight: MediaQuery.of(context).size.height * .5,
                      ),
                      isScrollControlled: true,
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      elevation: 0,
                      builder: (ctx) {
                        return ProjectVettingScreen(
                          projectId: project.id!,
                          projectLocations: projectCardState.locations!,
                          fromDetails: false,
                        );
                      },
                    );
                  },
            color: projectCardState.isDeleted!
                ? Theme.of(context).disabledColor
                : projectCardState.hasVerified!
                    ? TColors.primary
                    : Theme.of(context).iconTheme.color!,
          ),
        if (projectCardState.isOwner!)
          ContentInteractionButton(
            icon: Iconsax.edit,
            text: '',
            showText: false,
            color: projectCardState.isDeleted!
                ? Theme.of(context).disabledColor
                : projectCardState.hasVerified!
                    ? TColors.primary
                    : Theme.of(context).iconTheme.color!,
            onTap: projectCardState.isDeleted!
                ? null
                : () {
                    context.push(
                      AppRoutes.createProject,
                      extra: {
                        'id': project.id,
                      },
                    );
                  },
          ),
        if (!projectCardState.canVet! && !projectCardState.isOwner!)
          ContentInteractionButton(
            icon: projectCardState.isBookmarked!
                ? Icons.bookmark
                : Icons.bookmark_add_outlined,
            text: projectCardState.numberOfBookmarks!,
            onTap: projectCardState.isDeleted!
                ? null
                : () async {
                    await projectCardNotifier.toggleBookmarkStatus(
                      project.id!,
                    );
                  },
            color: projectCardState.isDeleted!
                ? Theme.of(context).disabledColor
                : projectCardState.isBookmarked!
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).colorScheme.onSurface,
          ),
        ContentInteractionButton(
          icon: Iconsax.more_circle,
          onTap: projectCardState.isDeleted!
              ? null
              : () {
                  showModalBottomSheet(
                    context: context,
                    constraints: BoxConstraints(
                      maxHeight: projectCardState.isOwner!
                          ? 240
                          : projectCardState.canVet!
                              ? 480
                              : 430,
                    ),
                    builder: (ctx) {
                      return ShowProjectActions(
                        project: project,
                        projectCardNotifier: projectCardNotifier,
                      );
                    },
                  );
                },
          color: projectCardState.isDeleted!
              ? Theme.of(context).disabledColor
              : Theme.of(context).colorScheme.onSurface,
        ),
      ],
    );
  }
}
