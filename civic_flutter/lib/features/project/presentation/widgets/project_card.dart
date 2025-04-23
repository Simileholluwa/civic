import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:civic_flutter/features/user/user.dart';

class ProjectCard extends ConsumerWidget {
  const ProjectCard({
    super.key,
    required this.project,
    this.canTap = true,
    this.showInteractions = true,
    this.maxHeight = 300,
    this.creatorAvatarRadius = 25,
    this.showPolitcalStatus = true,
  });

  final bool canTap;
  final double creatorAvatarRadius;
  final double maxHeight;
  final Project project;
  final bool showInteractions;
  final bool showPolitcalStatus;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: canTap
          ? () {
              context.push(
                '/feed/${project.id}/details',
              );
            }
          : null,
      child: StreamBuilder(
          initialData: project,
          stream: ref.read(clientProvider).project.projectUpdates(project.id!),
          builder: (context, snapshot) {
            final newProject = snapshot.data;
            final projectCardState = ref.watch(
              projectCardWidgetProvider(
                newProject ?? project,
              ),
            );
            final projectCardNotifier = ref.watch(
              projectCardWidgetProvider(
                newProject ?? project,
              ).notifier,
            );
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 12, 15, 0),
                  child: ContentCreatorInfo(
                    creator: projectCardState.creator,
                    timeAgo: projectCardState.timeAgo,
                    radius: creatorAvatarRadius,
                    showPoliticalStatus: showPolitcalStatus,
                  ),
                ),
                !projectCardState.isDeleted
                    ? projectCardState.imagesUrl.length == 1
                        ? ContentSingleCachedImage(
                            imageUrl: projectCardState.imagesUrl.first,
                            maxHeight: maxHeight,
                          )
                        : ContentMultipleCachedImage(
                            imageUrls: projectCardState.imagesUrl,
                            maxHeight: maxHeight,
                          )
                    : DeletedProjectPlaceholder(
                        project: project,
                        showInteractions: showInteractions,
                      ),
                if (!projectCardState.isDeleted)
                  ProjectQuickDetails(
                    project: project,
                  ),
                if (!projectCardState.isDeleted)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 5,
                      children: [
                        Text(
                          projectCardState.title,
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                fontSize: 23,
                              ),
                        ),
                        ContentExpandableText(
                          text: projectCardState.description,
                          onToggleTextTap: (){},
                          hasImage: true,
                          maxLines: 4,
                        ),
                      ],
                    ),
                  ),
                if (showInteractions)
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                    child: ProjectInteractionButtons(
                      projectCardNotifier: projectCardNotifier,
                      project: newProject ?? project,
                    ),
                  ),
              ],
            );
          }),
    );
  }
}

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
          icon: projectCardState.hasLiked ? Iconsax.heart5 : Iconsax.heart,
          onTap: projectCardState.isDeleted
              ? null
              : () async {
                  await projectCardNotifier.toggleLikeStatus(
                    project.id!,
                  );
                },
          text: projectCardState.numberOfLikes,
          color: projectCardState.isDeleted
              ? Theme.of(context).disabledColor
              : projectCardState.hasLiked
                  ? TColors.primary
                  : Theme.of(context).iconTheme.color!,
        ),
        ContentInteractionButton(
          icon: projectCardState.hasReposted
              ? Iconsax.repeate_music5
              : Iconsax.repeate_music,
          onTap: projectCardState.isDeleted
              ? null
              : () {
                  if (projectCardState.hasReposted) {
                    ProjectHelperFunctions.undoRepostDialog(
                      context,
                      ref,
                      project.id!,
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
          text: projectCardState.numberOfReposts,
          color: projectCardState.isDeleted
              ? Theme.of(context).disabledColor
              : projectCardState.hasReposted
                  ? TColors.primary
                  : Theme.of(context).iconTheme.color!,
        ),
        if (!projectCardState.isOwner)
          ContentInteractionButton(
            icon: projectCardState.hasReviewed
                ? Icons.star
                : Icons.star_border_outlined,
            iconSize: 22,
            text: projectCardState.numberOfReviews,
            onTap: projectCardState.isDeleted
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
            color: projectCardState.isDeleted
                ? Theme.of(context).disabledColor
                : projectCardState.hasReviewed
                    ? TColors.primary
                    : Theme.of(context).iconTheme.color!,
          )
        else
          ContentInteractionButton(
            icon: projectCardState.isBookmarked
                ? Icons.bookmark
                : Icons.bookmark_add_outlined,
            text: projectCardState.numberOfBookmarks,
            onTap: projectCardState.isDeleted
                ? null
                : () async {
                    await projectCardNotifier.toggleBookmarkStatus(
                      project.id!,
                    );
                  },
            color: projectCardState.isDeleted
                ? Theme.of(context).disabledColor
                : projectCardState.isBookmarked
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).colorScheme.onSurface,
          ),
        if (projectCardState.canVet && !projectCardState.isOwner)
          ContentInteractionButton(
            icon: projectCardState.hasVerified
                ? Iconsax.medal_star5
                : Iconsax.medal_star,
            text: projectCardState.numberOfVerifies,
            onTap: projectCardState.isDeleted
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
                        return ProjectVerifyScreen(
                          projectId: project.id!,
                          projectLocations: projectCardState.locations,
                          fromDetails: false,
                        );
                      },
                    );
                  },
            color: projectCardState.isDeleted
                ? Theme.of(context).disabledColor
                : projectCardState.hasVerified
                    ? TColors.primary
                    : Theme.of(context).iconTheme.color!,
          )
        else
          ContentInteractionButton(
            icon: Iconsax.edit,
            text: '',
            showText: false,
            color: projectCardState.isDeleted
                ? Theme.of(context).disabledColor
                : projectCardState.hasVerified
                    ? TColors.primary
                    : Theme.of(context).iconTheme.color!,
            onTap: projectCardState.isDeleted
                ? null
                : () {
                    context.pop();
                    context.push(
                      AppRoutes.createProject,
                      extra: {
                        'id': project.id,
                      },
                    );
                  },
          ),
        if (!projectCardState.canVet)
          ContentInteractionButton(
            icon: projectCardState.isBookmarked
                ? Icons.bookmark
                : Icons.bookmark_add_outlined,
            text: projectCardState.numberOfBookmarks,
            onTap: projectCardState.isDeleted
                ? null
                : () async {
                    await projectCardNotifier.toggleBookmarkStatus(
                      project.id!,
                    );
                  },
            color: projectCardState.isDeleted
                ? Theme.of(context).disabledColor
                : projectCardState.isBookmarked
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).colorScheme.onSurface,
          ),
        ContentInteractionButton(
          icon: Iconsax.more_circle,
          onTap: projectCardState.isDeleted
              ? null
              : () {
                  showModalBottomSheet(
                    context: context,
                    constraints: BoxConstraints(
                      maxHeight: projectCardState.isOwner
                          ? 240
                          : projectCardState.canVet
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
          color: projectCardState.isDeleted
              ? Theme.of(context).disabledColor
              : Theme.of(context).colorScheme.onSurface,
        ),
      ],
    );
  }
}

class DeletedProjectPlaceholder extends ConsumerWidget {
  const DeletedProjectPlaceholder({
    super.key,
    required this.project,
    this.showInteractions = false,
  });

  final Project project;
  final bool showInteractions;

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
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      height: 300,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          TSizes.md,
        ),
        color: Theme.of(context).cardColor,
        border: Border.all(
          color: Theme.of(context).dividerColor,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 5,
          children: [
            Icon(
              Iconsax.trash,
              size: 70,
              color: Theme.of(context).disabledColor,
            ),
            Text(
              'This project has been removed by the author, preventing further interaction. '
              'However, you can still view and engage with existing reviews and vettings.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).disabledColor,
                  ),
              textAlign: TextAlign.center,
            ),
            if (projectCardState.isOwner && showInteractions)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  spacing: 10,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          label: Text(
                            'Restore',
                          ),
                          icon: Icon(
                            Iconsax.refresh,
                            color: TColors.textWhite,
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: TColors.primary,
                            foregroundColor: TColors.textWhite,
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          label: Text(
                            'Delete forever',
                          ),
                          icon: Icon(
                            Iconsax.trash,
                            color: TColors.textWhite,
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: TColors.textWhite,
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            if (showInteractions && !projectCardState.isOwner)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  height: 50,
                  width: double.maxFinite,
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      final result =
                          await projectCardNotifier.markProjectNotInterested(
                        project.id!,
                      );
                      if (result) {
                        TToastMessages.infoToast(
                          'You will no longer see this project in your feed',
                        );
                      }
                    },
                    label: Text(
                      'Hide for me',
                    ),
                    icon: Icon(
                      Iconsax.eye_slash,
                      color: TColors.textWhite,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: TColors.textWhite,
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class ShowProjectActions extends ConsumerWidget {
  const ShowProjectActions({
    super.key,
    required this.project,
    required this.projectCardNotifier,
    this.fromDetails = false,
  });

  final Project project;
  final ProjectCardWidget projectCardNotifier;
  final bool fromDetails;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userNotifier = ref.watch(currentActiveUserProvider.notifier);
    final projectCardState = ref.watch(
      projectCardWidgetProvider(
        project,
      ),
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: Container(
          margin: EdgeInsets.only(top: 4),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Theme.of(context).dividerColor,
              ),
            ),
          ),
          child: AppBar(
            titleSpacing: 4,
            title: Text(
              'More actions',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontSize: 20,
                  ),
            ),
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                context.pop();
              },
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          if (projectCardState.canVet && !projectCardState.isOwner)
            ListTile(
              leading: Icon(
                projectCardState.isBookmarked
                    ? Icons.bookmark
                    : Icons.bookmark_add_outlined,
              ),
              title: Text(
                projectCardState.isBookmarked ? 'Remove Bookmark' : 'Bookmark',
              ),
              onTap: () async {
                if (context.mounted) {
                  context.pop();
                }
                final result = await projectCardNotifier.toggleBookmarkStatus(
                  project.id!,
                );
                if (result) {
                  if (!projectCardState.isBookmarked) {
                    TToastMessages.infoToast('Project has been bookmarked');
                  } else {
                    TToastMessages.infoToast(
                        'Project has been removed from bookmarks');
                  }
                }
              },
            ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text(
              'Share',
            ),
            trailing: Icon(
              Iconsax.arrow_right_3,
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Iconsax.copy),
            title: Text(
              'Copy link',
            ),
            onTap: () {},
          ),
          if (!projectCardState.isOwner)
            ListTile(
              leading: Icon(Iconsax.eye_slash),
              title: Text(
                'Not interested',
              ),
              onTap: () async {
                if (context.mounted) {
                  context.pop();
                  if (fromDetails) {
                    context.pop();
                  }
                }
                final result =
                    await projectCardNotifier.markProjectNotInterested(
                  project.id!,
                );
                if (result) {
                  TToastMessages.infoToast(
                    'You will no longer see this project in your feed',
                  );
                }
              },
            ),
          if (!projectCardState.isOwner)
            ListTile(
              leading: Icon(
                Iconsax.flag,
                color: Colors.red,
              ),
              title: Text(
                'Report',
                style: TextStyle().copyWith(
                  color: Colors.red,
                ),
              ),
              onTap: () {},
            ),
          if (projectCardState.isOwner)
            ListTile(
              leading: Icon(
                Iconsax.trash,
                color: Colors.red,
              ),
              title: Text(
                'Delete',
                style: TextStyle().copyWith(
                  color: Colors.red,
                ),
              ),
              onTap: () async {
                if (context.mounted) {
                  context.pop();
                }
                ProjectHelperFunctions.deleteProjectBottomSheet(
                  context,
                  project,
                );
              },
            ),
          if (!projectCardState.isOwner)
            const Divider(
              indent: 20,
              endIndent: 30,
            ),
          if (!projectCardState.isOwner)
            Column(
              children: [
                ListTile(
                  leading: Icon(
                    projectCardState.isFollower
                        ? Iconsax.user_remove
                        : Iconsax.user_cirlce_add,
                  ),
                  title: Text(
                    projectCardState.isFollower ? 'Unfollow' : 'Follow',
                  ),
                  onTap: () async {
                    if (context.mounted) {
                      context.pop();
                    }
                    final result = await userNotifier.toggleFollow(
                      project.ownerId,
                    );

                    if (result) {
                      projectCardNotifier.setIsFollower();
                      if (!projectCardState.isFollower) {
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
                ListTile(
                  leading: Icon(
                    Icons.block_sharp,
                    color: Colors.red,
                  ),
                  title: Text(
                    'Block',
                    style: TextStyle().copyWith(
                      color: Colors.red,
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class ProjectDeleteConsequences extends StatelessWidget {
  const ProjectDeleteConsequences({
    super.key,
    required this.consequence,
    required this.number,
  });

  final String number;
  final String consequence;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 15,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          number,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontSize: 20,
                color: TColors.secondary,
              ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 3,
            ),
            child: Text(
              consequence,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}

class ProjectQuickDetails extends ConsumerWidget {
  const ProjectQuickDetails({
    super.key,
    required this.project,
  });

  final Project project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectCardState = ref.watch(
      projectCardWidgetProvider(
        project,
      ),
    );
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 10,
        children: [
          ProjectQuickDetailWidget(
            icon: Iconsax.buy_crypto5,
            title: '${projectCardState.currency} ${projectCardState.amount}',
            color: TColors.primary,
            textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
          ),
          ProjectQuickDetailWidget(
            icon: Iconsax.percentage_circle5,
            title: projectCardState.completionRate,
            color: TColors.warning,
            textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
          ),
          ProjectQuickDetailWidget(
            icon: Iconsax.calendar_25,
            title: projectCardState.duration,
            color: Colors.blue,
            textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
