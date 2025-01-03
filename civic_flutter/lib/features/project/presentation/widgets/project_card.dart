import 'package:cached_network_image/cached_network_image.dart';
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
    required this.isLiked,
  });

  final Project project;
  final int index;
  final bool isLiked;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final defaultTextStyle = DefaultTextStyle.of(context);
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
    final isDark = THelperFunctions.isDarkMode(context);
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
        children: [
          Container(
            decoration: BoxDecoration(
              color: TColors.primary.withValues(
                alpha: 0.01,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 12, 15, 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundImage: CachedNetworkImageProvider(
                          projectCardState.photoUrl,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Flexible(
                                  child: Text(
                                    projectCardState.displayName,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Iconsax.star5,
                                      color: TColors.primary,
                                      size: 14,
                                    ),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    Text(
                                      projectCardState.credibilityScore,
                                      style: defaultTextStyle.style.copyWith(
                                        color: TColors.primary,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              projectCardState.bio,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                    fontSize: 13,
                                  ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              '@${projectCardState.userName} • ${projectCardState.timeAgo} • ${projectCardState.numberOfViews} views',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                    fontSize: 13,
                                  ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
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
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ProjectQuickDetailWidget(
                        icon: Iconsax.buy_crypto5,
                        title:
                            '${projectCardState.currency} ${projectCardState.amount}',
                        color: TColors.primary,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ProjectQuickDetailWidget(
                        icon: Iconsax.percentage_circle5,
                        title: projectCardState.completionRate,
                        color: TColors.secondary,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ProjectQuickDetailWidget(
                        icon: Iconsax.calendar_25,
                        title: projectCardState.duration,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        projectCardState.title,
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        projectCardState.description,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 17,
                            ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                    color: isDark ? TColors.dark : TColors.light,
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
                        icon: Icons.check,
                        backgroundColor: Colors.transparent,
                        textColor: project.status != 'Completed'
                            ? Theme.of(context).disabledColor
                            : Theme.of(context).textTheme.labelLarge!.color!,
                        isApprove: true,
                      ),
                      const SizedBox(
                        height: 20,
                        child: VerticalDivider(
                          width: 0,
                        ),
                      ),
                      ProjectVetButton(
                        title: 'Disapprove',
                        icon: Icons.close,
                        backgroundColor: Colors.transparent,
                        textColor: project.status != 'Completed'
                            ? Theme.of(context).disabledColor
                            : Theme.of(context).textTheme.labelLarge!.color!,
                        isDisapprove: true,
                      ),
                    ],
                  ),
                ),
                ContentInteractionButton(
                  icon: isLiked == true ? Iconsax.heart5 : Iconsax.heart,
                  title: projectCardState.numberOfLikes,
                  onTap: () async {
                    await projectCardNotifier.addRemoveLike(
                      project.id!,
                    );
                    ref.invalidate(hasLikedProjectProvider);
                  },
                  color: isLiked == true
                      ? TColors.primary
                      : Theme.of(context).textTheme.labelMedium!.color!,
                ),
                ContentInteractionButton(
                  icon: Iconsax.messages_1,
                  title: '1.2k',
                  onTap: () {},
                  color: Theme.of(context).textTheme.labelMedium!.color!,
                ),
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
