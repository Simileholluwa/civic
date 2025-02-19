import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class ProjectCard extends ConsumerWidget {
  const ProjectCard({
    super.key,
    required this.project,
    required this.index,
  });

  final Project project;
  final int index;

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
      onTap: () {
        context.pushNamed(
          ProjectDetailsScreen.routeName(),
          pathParameters: {
            'id': project.id.toString(),
          },
        );
        isVisibleNotifier.hide();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 12, 15, 0),
            child: ContentCreatorInfo(
              creator: projectCardState.creator,
              timeAgo: projectCardState.timeAgo,
            ),
          ),
          projectCardState.imagesUrl.length == 1
              ? ContentSingleCachedImage(
                  imageUrl: projectCardState.imagesUrl.first,
                )
              : ContentMultipleCachedImage(
                  imageUrls: projectCardState.imagesUrl,
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
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 15,
                  children: [
                    if (projectCardState.canVet)
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            100,
                          ),
                          color: Theme.of(context).cardColor,
                          border: const Border(
                            right: BorderSide(
                              color: TColors.primary,
                              width: .3,
                            ),
                            left: BorderSide(
                              color: TColors.primary,
                              width: .3,
                            ),
                          ),
                        ),
                        child: ProjectVetButton(
                          title: 'Verify',
                          icon: Iconsax.medal_star5,
                          backgroundColor: Colors.transparent,
                          textColor:
                              Theme.of(context).textTheme.labelMedium!.color!,
                          isApprove: true,
                          isDisapprove: true,
                        ),
                      ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          100,
                        ),
                        color: Theme.of(context).cardColor,
                        border: const Border(
                          right: BorderSide(
                            color: TColors.primary,
                            width: .3,
                          ),
                          left: BorderSide(
                            color: TColors.primary,
                            width: .3,
                          ),
                        ),
                      ),
                      child: ProjectVetButton(
                        title: 'Review',
                        icon: Iconsax.magic_star5,
                        backgroundColor: Colors.transparent,
                        textColor:
                            Theme.of(context).textTheme.labelMedium!.color!,
                        isApprove: true,
                        isDisapprove: true,
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            constraints: BoxConstraints(
                              maxHeight:
                                  MediaQuery.of(context).size.height * .7,
                              minHeight:
                                  MediaQuery.of(context).size.height * .5,
                            ),
                            isScrollControlled: true,
                            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                            elevation: 0,
                            builder: (ctx) {
                              return ProjectReviewScreen(
                                id: project.id!,
                              );
                            },
                          );
                          isVisibleNotifier.hide();
                        },
                      ),
                    ),
                  ],
                ),
                ContentInteractionButton(
                  icon: projectCardState.hasLiked == true
                      ? Iconsax.heart5
                      : Iconsax.heart,
                  onTap: () async {
                    await projectCardNotifier.toggleLikeStatus(
                      project.id!,
                    );
                  },
                  color: projectCardState.hasLiked == true
                      ? TColors.primary
                      : Theme.of(context).iconTheme.color!,
                ),
                ContentInteractionButton(
                  icon: Iconsax.repeate_music5,
                  onTap: () {},
                  color: Theme.of(context).textTheme.labelMedium!.color!,
                ),
                if (projectCardState.canVet)
                  ContentInteractionButton(
                    icon: Iconsax.more_2,
                    onTap: () {},
                    color: Theme.of(context).textTheme.labelMedium!.color!,
                  ),
                if (!projectCardState.canVet)
                  ContentInteractionButton(
                    icon: Icons.share,
                    onTap: () {},
                    color: Theme.of(context).textTheme.labelMedium!.color!,
                  ),
                if (!projectCardState.canVet)
                  ContentInteractionButton(
                    icon: Iconsax.bookmark,
                    onTap: () {},
                    color: Theme.of(context).textTheme.labelMedium!.color!,
                  ),
                if (!projectCardState.canVet)
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
