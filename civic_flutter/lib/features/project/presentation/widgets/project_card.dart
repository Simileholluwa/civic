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
    final pagingControllerNotifier =
        ref.watch(paginatedProjectListProvider.notifier);
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
    final isVisibleNotifier = ref.watch(appScrollVisibilityProvider.notifier);
    return InkWell(
      onTap: () {
        context.push(
          ProjectDetailsScreen.route(
            project.id!,
          ),
          extra: {
            'id': project.id,
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
              numberOfViews: projectCardState.numberOfViews,
            ),
          ),
          projectCardState.imagesUrl.length == 1
              ? ContentSingleCachedImage(
                  imageUrl: projectCardState.imagesUrl.first,
                )
              : ContentMultipleCachedImage(
                  imageUrls: projectCardState.imagesUrl,
                ),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 10,
              children: [
                ProjectQuickDetailWidget(
                  icon: Iconsax.buy_crypto5,
                  title:
                      '${projectCardState.currency} ${projectCardState.amount}',
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
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  projectCardState.description,
                  style: Theme.of(context).textTheme.labelMedium,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 15, projectCardState.canVet ? 5 : 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    child: Row(
                      children: [
                        ProjectVetButton(
                          title: 'Approve',
                          icon: Icons.thumb_up_alt_rounded,
                          backgroundColor: Colors.transparent,
                          textColor:
                              Theme.of(context).textTheme.labelMedium!.color!,
                          isApprove: true,
                        ),
                        const SizedBox(
                          height: 20,
                          child: VerticalDivider(
                            width: 0,
                          ),
                        ),
                        ProjectVetButton(
                          title: '',
                          icon: Icons.thumb_down_alt_rounded,
                          backgroundColor: Colors.transparent,
                          textColor:
                              Theme.of(context).textTheme.labelLarge!.color!,
                          isDisapprove: true,
                        ),
                      ],
                    ),
                  ),
                ContentInteractionButton(
                  icon: projectCardState.hasLiked == true ? Iconsax.heart5 : Iconsax.heart,
                  title: projectCardState.numberOfLikes,
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
                  icon: Iconsax.messages_1,
                  title: projectCardState.numberOfComments,
                  onTap: () {},
                  color: Theme.of(context).textTheme.labelMedium!.color!,
                ),
                ContentInteractionButton(
                  icon: Iconsax.repeate_music5,
                  title: projectCardState.numberOfReposts,
                  onTap: () {},
                  color: Theme.of(context).textTheme.labelMedium!.color!,
                ),
                if (projectCardState.canVet)
                  ContentInteractionButton(
                    icon: Iconsax.more_2,
                    title: '',
                    showTitle: false,
                    onTap: () {},
                    color: Theme.of(context).textTheme.labelMedium!.color!,
                  ),
                if (!projectCardState.canVet)
                  ContentInteractionButton(
                    icon: Icons.share,
                    title: '',
                    showTitle: false,
                    onTap: () {},
                    color: Theme.of(context).textTheme.labelMedium!.color!,
                  ),
                if (!projectCardState.canVet)
                  ContentInteractionButton(
                    icon: Iconsax.bookmark,
                    title: '',
                    showTitle: false,
                    onTap: () {},
                    color: Theme.of(context).textTheme.labelMedium!.color!,
                  ),
                if (!projectCardState.canVet)
                  ContentInteractionButton(
                    icon: Iconsax.more_2,
                    title: '',
                    showTitle: false,
                    onTap: () {},
                    color: Theme.of(context).textTheme.labelMedium!.color!,
                  ),
              ],
            ),
          ),
          if (index !=
              pagingControllerNotifier.pagingController.itemList!.length - 1)
            const Divider(
              height: 0,
            ),
        ],
      ),
    );
  }
}
