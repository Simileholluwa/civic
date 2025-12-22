import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class ProjectInteractionButtons extends ConsumerWidget {
  const ProjectInteractionButtons({
    required this.project,
    super.key,
  });
  final Project project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  : Theme.of(context).hintColor,
        ),
        ContentInteractionButton(
          icon: Iconsax.repeate_music,
          onTap: projectCardState.isDeleted!
              ? null
              : () async {
                  await context.push(
                    '/create/post/0',
                    extra: {
                      'projectToQuote': project,
                    },
                  );
                },
          text: projectCardState.numberOfReposts!,
          color: projectCardState.isDeleted!
              ? Theme.of(context).disabledColor
              : Theme.of(context).hintColor,
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
                : () async {
                    await context.push(
                      '/project/${project.id}/review',
                    );
                  },
            color: projectCardState.isDeleted!
                ? Theme.of(context).disabledColor
                : projectCardState.hasReviewed!
                    ? TColors.primary
                    : Theme.of(context).hintColor,
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
                      projectCardState.isBookmarked!,
                    );
                  },
            color: projectCardState.isDeleted!
                ? Theme.of(context).disabledColor
                : projectCardState.isBookmarked!
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).hintColor,
          ),
        if (projectCardState.canVet! && !projectCardState.isOwner!)
          ContentInteractionButton(
            icon: projectCardState.hasVetted!
                ? Iconsax.medal_star5
                : Iconsax.medal_star,
            text: projectCardState.numberOfVettings!,
            onTap: projectCardState.isDeleted!
                ? null
                : () async {
                    await context.push(
                      '/project/${project.id}/vet',
                      extra: project.physicalLocations,
                    );
                  },
            color: projectCardState.isDeleted!
                ? Theme.of(context).disabledColor
                : projectCardState.hasVetted!
                    ? TColors.primary
                    : Theme.of(context).hintColor,
          ),
        if (projectCardState.canEdit)
          ContentInteractionButton(
            icon: Iconsax.edit,
            showText: false,
            color: projectCardState.isDeleted!
                ? Theme.of(context).disabledColor
                : projectCardState.hasVetted!
                    ? TColors.primary
                    : Theme.of(context).hintColor,
            onTap: projectCardState.isDeleted!
                ? null
                : () async {
                    await context.push(
                      '/create/project/${project.id}',
                      extra: project,
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
                      projectCardState.isBookmarked!,
                    );
                  },
            color: projectCardState.isDeleted!
                ? Theme.of(context).disabledColor
                : projectCardState.isBookmarked!
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).hintColor,
          ),
        ContentInteractionButton(
          icon: Iconsax.more_circle,
          onTap: projectCardState.isDeleted!
              ? null
              : () async {
                  await showDialog<dynamic>(
                    context: context,
                    builder: (ctx) {
                      return AlertDialog(
                        contentPadding: const EdgeInsets.only(
                          bottom: 16,
                        ),
                        content: ShowProjectActions(
                          project: project,
                        ),
                      );
                    },
                  );
                },
          color: projectCardState.isDeleted!
              ? Theme.of(context).disabledColor
              : Theme.of(context).hintColor,
        ),
      ],
    );
  }
}
