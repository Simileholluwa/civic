import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

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
    final isVisibleNotifier = ref.watch(
      appScrollVisibilityProvider.notifier,
    );
    return InkWell(
      onTap: canTap
          ? () {
              context.pushNamed(
                ProjectDetailsScreen.routeName(),
                pathParameters: {
                  'id': project.id.toString(),
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
              radius: creatorAvatarRadius,
              showPoliticalStatus: showPolitcalStatus,
            ),
          ),
          projectCardState.imagesUrl.length == 1
              ? ContentSingleCachedImage(
                  imageUrl: projectCardState.imagesUrl.first,
                  maxHeight: maxHeight,
                )
              : ContentMultipleCachedImage(
                  imageUrls: projectCardState.imagesUrl,
                  maxHeight: maxHeight,
                ),
          ProjectQuickDetails(
            project: project,
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
          if (showInteractions)
            Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ContentInteractionButton(
                    icon: projectCardState.hasLiked == true
                        ? Iconsax.heart5
                        : Iconsax.heart,
                    onTap: () async {
                      await projectCardNotifier.toggleLikeStatus(
                        project.id!,
                      );
                    },
                    text: projectCardState.numberOfLikes,
                    color: projectCardState.hasLiked == true
                        ? TColors.primary
                        : Theme.of(context).iconTheme.color!,
                  ),
                  ContentInteractionButton(
                    icon: projectCardState.hasReposted == true
                        ? Iconsax.repeate_music5
                        : Iconsax.repeate_music,
                    onTap: () {
                      context.pushNamed(
                        CreatePostScreen.routeName(),
                        extra: {
                          'draft': null,
                          'project': project,
                        },
                        pathParameters: {
                          'id': '0',
                        },
                      );
                      isVisibleNotifier.hide();
                    },
                    text: projectCardState.numberOfReposts,
                    color: projectCardState.hasReposted == true
                        ? TColors.primary
                        : Theme.of(context).iconTheme.color!,
                  ),
                  ContentInteractionButton(
                    icon: projectCardState.hasReviewed == true
                        ? Iconsax.magic_star5
                        : Iconsax.magic_star,
                    
                    text: (project.numberOfReviews.toString()),
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
                            id: project.id!,
                          );
                        },
                      );
                      isVisibleNotifier.hide();
                    },
                    color: projectCardState.hasReviewed == true
                        ? TColors.primary
                        : Theme.of(context).iconTheme.color!,
                  ),
                  if (projectCardState.canVet)
                    ContentInteractionButton(
                      icon: projectCardState.hasVerified == true
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
                              id: project.id!,
                              projectLocations:
                                  projectCardState.locations ?? [],
                            );
                          },
                        );
                        isVisibleNotifier.hide();
                      },
                      color: projectCardState.hasVerified == true
                          ? TColors.primary
                          : Theme.of(context).iconTheme.color!,
                    ),
                  if (!projectCardState.canVet)
                    ContentInteractionButton(
                      icon: Iconsax.bookmark,
                      onTap: () {},
                      color: Theme.of(context).textTheme.labelMedium!.color!,
                    ),
                  ContentInteractionButton(
                    icon: Iconsax.more_2,
                    onTap: () {},
                    color: Theme.of(context).textTheme.labelMedium!.color!,
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
