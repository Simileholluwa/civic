import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:transparent_image/transparent_image.dart';

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
    final defaultTextStyle = DefaultTextStyle.of(context);
    int current = ref.watch(projectImageAttachmentPageChangedProvider);
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
    final isLiked = ref.watch(likedProjectProvider(project.id!,),);
    final isDark = THelperFunctions.isDarkMode(context);
    final isVisible = ref.watch(scrollVisibilityProvider);
    return AnimatedPadding(
      padding: EdgeInsets.only(top: index == 0 && isVisible ? 55 : 0),
      duration: const Duration(milliseconds: 300),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: TColors.primary.withOpacity(
                0.01,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: Container(
                        constraints: const BoxConstraints(
                          maxWidth: 500,
                          maxHeight: 350,
                        ),
                        
                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(
                            TSizes.md,
                          ),
                          border: Border.all(
                            color: Theme.of(context).dividerColor,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            TSizes.md,
                          ),
                          child: CarouselSlider(
                            options: CarouselOptions(
                                scrollPhysics: const ClampingScrollPhysics(),
                                height: 498,
                                enableInfiniteScroll: false,
                                viewportFraction: 1,
                                onPageChanged: (index, reason) {
                                  ref
                                      .read(
                                          projectImageAttachmentPageChangedProvider
                                              .notifier)
                                      .carouselPageChanged(
                                        index,
                                        reason,
                                      );
                                }),
                            items: projectCardState.imagesUrl.map((image) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    width: double.maxFinite,
                                    decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).scaffoldBackgroundColor,
                                      borderRadius: BorderRadius.circular(
                                        TSizes.md,
                                      ),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        TSizes.md,
                                      ),
                                      child: FadeInImage(
                                        image: CachedNetworkImageProvider(image),
                                        placeholder: MemoryImage(
                                          kTransparentImage,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                    projectCardState.imagesUrl.length > 1
                        ? Container(
                            margin: const EdgeInsets.only(
                              bottom: TSizes.sm,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: TSizes.xs,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                100,
                              ),
                              color: Colors.black54,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: project.projectImageAttachments!
                                  .asMap()
                                  .entries
                                  .map((entry) {
                                return Container(
                                  width: 8,
                                  height: 8,
                                  margin: const EdgeInsets.all(4.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white.withOpacity(
                                      current == entry.key ? 0.9 : 0.4,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
                const SizedBox(
                  height: 15,
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
                              fontSize: 15,
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
                ProjectInteractionButtons(
                  icon: isLiked.hasValue && isLiked.value == true
                      ? Iconsax.heart5
                      : Iconsax.heart,
                  title: projectCardState.numberOfLikes,
                  onTap: () async {
                    await projectCardNotifier.addRemoveLike(
                      project.id!,
                    );             
                  },
                  color: isLiked.hasValue && isLiked.value == true
                      ? TColors.primary
                      : Theme.of(context).textTheme.labelMedium!.color!,
                ),
                ProjectInteractionButtons(
                  icon: Iconsax.messages_1,
                  title: '1.2k',
                  onTap: () {},
                  color: Theme.of(context).textTheme.labelMedium!.color!,
                ),
                ProjectInteractionButtons(
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
