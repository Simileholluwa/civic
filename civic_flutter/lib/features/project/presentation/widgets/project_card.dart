import 'dart:developer';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class ProjectCard extends ConsumerStatefulWidget {
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
  ConsumerState<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends ConsumerState<ProjectCard> {
  Project? newProject;

  @override
  void initState() {
    if (context.mounted) {
      _listenToUpdates();
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _listenToUpdates() async {
    while (true) {
      try {
        final projectUpdates = ref
            .read(
              clientProvider,
            )
            .project
            .projectUpdates(
              widget.project.id!,
            );
        await for (final update in projectUpdates) {
          setState(() {
            newProject = update.copyWith(
              owner: widget.project.owner,
            );
          });
        }
      } on MethodStreamException catch (e) {
        log(e.toString());
        setState(() {
          newProject = widget.project;
        });
      }
      await Future.delayed(
        Duration(
          seconds: 5,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final projectCardState = ref.watch(
      projectCardWidgetProvider(
        newProject ?? widget.project,
      ),
    );
    final projectCardNotifier = ref.watch(
      projectCardWidgetProvider(
        newProject ?? widget.project,
      ).notifier,
    );
    final isVisibleNotifier = ref.watch(
      appScrollVisibilityProvider.notifier,
    );

    return InkWell(
      onTap: widget.canTap
          ? () {
              context.pushNamed(
                ProjectDetailsScreen.routeName(),
                pathParameters: {
                  'id': widget.project.id.toString(),
                },
              );
              isVisibleNotifier.hide();
            }
          : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 12, 15, 0),
            child: ContentCreatorInfo(
              creator: projectCardState.creator,
              timeAgo: projectCardState.timeAgo,
              radius: widget.creatorAvatarRadius,
              showPoliticalStatus: widget.showPolitcalStatus,
            ),
          ),
          projectCardState.imagesUrl.length == 1
              ? ContentSingleCachedImage(
                  imageUrl: projectCardState.imagesUrl.first,
                  maxHeight: widget.maxHeight,
                )
              : ContentMultipleCachedImage(
                  imageUrls: projectCardState.imagesUrl,
                  maxHeight: widget.maxHeight,
                ),
          ProjectQuickDetails(
            project: widget.project,
          ),
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
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontSize: 23,
                      ),
                ),
                ContentExpandableText(
                  text: projectCardState.description,
                  hasImage: true,
                  maxLines: 4,
                ),
              ],
            ),
          ),
          if (widget.showInteractions)
            Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ContentInteractionButton(
                    icon: projectCardState.hasLiked
                        ? Iconsax.heart5
                        : Iconsax.heart,
                    onTap: () async {
                      await projectCardNotifier.toggleLikeStatus(
                        widget.project.id!,
                      );
                    },
                    text: projectCardState.numberOfLikes,
                    color: projectCardState.hasLiked
                        ? TColors.primary
                        : Theme.of(context).iconTheme.color!,
                  ),
                  ContentInteractionButton(
                    icon: projectCardState.hasReposted
                        ? Iconsax.repeate_music5
                        : Iconsax.repeate_music,
                    onTap: () {
                      if (projectCardState.hasReposted) {
                        ProjectHelperFunctions.undoRepostDialog(
                          context,
                          ref,
                          widget.project.id!,
                        );
                        return;
                      }
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
                          return CreatePostScreen(
                            id: 0,
                            draft: null,
                            project: widget.project,
                          );
                        },
                      );

                      isVisibleNotifier.hide();
                    },
                    text: projectCardState.numberOfReposts,
                    color: projectCardState.hasReposted
                        ? TColors.primary
                        : Theme.of(context).iconTheme.color!,
                  ),
                  ContentInteractionButton(
                    icon: projectCardState.hasReviewed
                        ? Icons.star
                        : Icons.star_border_outlined,
                    iconSize: 22,
                    text: projectCardState.numberOfReviews,
                    onTap: () {
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
                            id: widget.project.id!,
                            fromDetails: false,
                          );
                        },
                      );
                      isVisibleNotifier.hide();
                    },
                    color: projectCardState.hasReviewed
                        ? TColors.primary
                        : Theme.of(context).iconTheme.color!,
                  ),
                  if (projectCardState.canVet)
                    ContentInteractionButton(
                      icon: projectCardState.hasVerified
                          ? Iconsax.medal_star5
                          : Iconsax.medal_star,
                      text: projectCardState.numberOfVerifies,
                      onTap: () {
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
                              id: widget.project.id!,
                              projectLocations: projectCardState.locations,
                              fromDetails: false,
                            );
                          },
                        );
                        isVisibleNotifier.hide();
                      },
                      color: projectCardState.hasVerified
                          ? TColors.primary
                          : Theme.of(context).iconTheme.color!,
                    ),
                  if (!projectCardState.canVet)
                    ContentInteractionButton(
                      icon: projectCardState.isBookmarked
                          ? Icons.bookmark
                          : Icons.bookmark_add_outlined,
                      text: projectCardState.numberOfBookmarks,
                      onTap: () async {
                        await projectCardNotifier.toggleBookmarkStatus(
                          widget.project.id!,
                        );
                      },
                      color: projectCardState.isBookmarked
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).colorScheme.onSurface,
                    ),
                  ContentInteractionButton(
                    icon: Iconsax.more_2,
                    onTap: () {},
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ],
              ),
            ),
        ],
      ),
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
