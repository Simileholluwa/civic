import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class ProjectInteractionButtons extends ConsumerWidget {
  const ProjectInteractionButtons({
    required this.projectWithUserState,
    super.key,
  });
  final ProjectWithUserState projectWithUserState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectProv = projectCardWidgetProvider(
      ProjectWithUserStateKey(
        projectWithUserState,
      ),
    );
    final projectCardNotifier = ref.watch(
      projectCardWidgetProvider(
        ProjectWithUserStateKey(
          projectWithUserState,
        ),
      ).notifier,
    );
    final userId = ref.read(localStorageProvider).getInt('userId');
    final project = projectWithUserState.project;
    final isOwner = userId == project.ownerId;
    final canVet = ProjectHelperFunctions.canVet(
      project.startDate!,
      project.endDate!,
    );
    final canEdit =
        DateTime.now().difference(project.dateCreated!).inMinutes < 100 &&
        userId == project.ownerId;
    final hasLiked = ref.watch(
      projectProv.select(
        (s) => s.hasLiked,
      ),
    );
    final numberOfLikes = ref.watch(
      projectProv.select(
        (s) => s.numberOfLikes,
      ),
    );
    final numberOfReposts = ref.watch(
      projectProv.select(
        (s) => s.numberOfReposts,
      ),
    );
    final hasReviewed = ref.watch(
      projectProv.select(
        (s) => s.hasReviewed,
      ),
    );
    final numberOfReviews = ref.watch(
      projectProv.select(
        (s) => s.numberOfReviews,
      ),
    );
    final hasBookmarked = ref.watch(
      projectProv.select(
        (s) => s.isBookmarked,
      ),
    );
    final numberOfBookmarks = ref.watch(
      projectProv.select(
        (s) => s.numberOfBookmarks,
      ),
    );
    final hasVetted = ref.watch(
      projectProv.select(
        (s) => s.hasVetted,
      ),
    );
    final numberOfVettings = ref.watch(
      projectProv.select(
        (s) => s.numberOfVettings,
      ),
    );
    final hasReposted = ref.watch(
      projectProv.select(
        (s) => s.hasReposted,
      ),
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ContentInteractionButton(
          icon: hasLiked ? Iconsax.heart5 : Iconsax.heart,
          onTap: () async {
            await projectCardNotifier.toggleLikeStatus(
              project.id!,
            );
          },
          text: '$numberOfLikes',
          color: hasLiked ? TColors.primary : Theme.of(context).hintColor,
        ),
        ContentInteractionButton(
          icon: Iconsax.repeate_music,
          onTap: () async {
            await context.push(
              '/create/post/0',
              extra: {
                'projectToQuote': project,
              },
            );
          },
          text: '$numberOfReposts',
          color: hasReposted ? TColors.primary : Theme.of(context).hintColor,
        ),
        if (!isOwner)
          ContentInteractionButton(
            icon: hasReviewed ? Icons.star : Icons.star_border_outlined,
            iconSize: 22,
            text: '$numberOfReviews',
            onTap: () async {
              await context.push(
                '/project/${project.id}/review',
              );
            },
            color: hasReviewed ? TColors.primary : Theme.of(context).hintColor,
          ),
        if (canVet && !isOwner)
          ContentInteractionButton(
            icon: hasVetted ? Iconsax.medal_star5 : Iconsax.medal_star,
            text: '$numberOfVettings',
            onTap: () async {
              await context.push(
                '/project/${project.id}/vet',
                extra: project.physicalLocations,
              );
            },
            color: hasVetted ? TColors.primary : Theme.of(context).hintColor,
          ),
        if (canEdit)
          ContentInteractionButton(
            icon: Iconsax.edit,
            showText: false,
            color: hasVetted ? TColors.primary : Theme.of(context).hintColor,
            onTap: () async {
              await context.push(
                '/create/project/${project.id}',
                extra: project,
              );
            },
          ),
          if (!canVet || isOwner)
          ContentInteractionButton(
            icon: hasBookmarked ? Icons.bookmark : Icons.bookmark_add_outlined,
            text: '$numberOfBookmarks',
            onTap: () async {
              await projectCardNotifier.toggleBookmarkStatus(
                project.id!,
              );
            },
            color: hasBookmarked
                ? Theme.of(context).primaryColor
                : Theme.of(context).hintColor,
          ),
        ContentInteractionButton(
          icon: Icons.share,
          onTap: () async {},
          color: Theme.of(context).hintColor,
        ),
      ],
    );
  }
}
