import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class ProjectRatingSummary extends ConsumerWidget {
  const ProjectRatingSummary({
    super.key,
    required this.project,
  });

  final Project project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectReviewStateNotifier =
        ref.watch(projectReviewListQueryProvider.notifier);
    final projectReviewState = ref.watch(projectReviewListQueryProvider);
    final pagingControllerNotifier =
        ref.watch(paginatedProjectReviewListProvider(project.id!).notifier);
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 5,
      ),
      child: Column(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
            ),
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 10,
              children: [
                ProjectTitleAndRating(
                  ratingNumber:
                      project.overallLocationRating.toString().substring(0, 3),
                  rating: project.overallLocationRating!,
                  title: 'Location',
                  titleSize: 50,
                  ratingSize: 18,
                  titleSize2: 15,
                ),
                const SizedBox(
                  height: 65,
                  child: VerticalDivider(),
                ),
                ProjectTitleAndRating(
                  ratingNumber: project.overallDescriptionRating
                      .toString()
                      .substring(0, 3),
                  rating: project.overallDescriptionRating!,
                  title: 'Description',
                  titleSize: 50,
                  ratingSize: 18,
                  titleSize2: 15,
                ),
                const SizedBox(
                  height: 65,
                  child: VerticalDivider(),
                ),
                ProjectTitleAndRating(
                  ratingNumber: project.overallAttachmentsRating
                      .toString()
                      .substring(0, 3),
                  rating: project.overallAttachmentsRating!,
                  title: 'Attachments',
                  titleSize: 50,
                  ratingSize: 18,
                  titleSize2: 15,
                ),
                const SizedBox(
                  height: 65,
                  child: VerticalDivider(),
                ),
                ProjectTitleAndRating(
                  ratingNumber:
                      project.overAllCategoryRating.toString().substring(0, 3),
                  rating: project.overAllCategoryRating!,
                  title: 'Category',
                  titleSize: 50,
                  ratingSize: 18,
                  titleSize2: 15,
                ),
                const SizedBox(
                  height: 65,
                  child: VerticalDivider(),
                ),
                ProjectTitleAndRating(
                  ratingNumber:
                      project.overallFundingRating.toString().substring(0, 3),
                  rating: project.overallFundingRating!,
                  title: 'Funding',
                  titleSize: 50,
                  ratingSize: 18,
                  titleSize2: 15,
                ),
                const SizedBox(
                  height: 65,
                  child: VerticalDivider(),
                ),
                ProjectTitleAndRating(
                  ratingNumber:
                      project.overallDatesRating.toString().substring(0, 3),
                  rating: project.overallDatesRating!,
                  title: 'Dates',
                  titleSize: 50,
                  ratingSize: 18,
                  titleSize2: 15,
                ),
              ],
            ),
          ),
          const Divider(
            height: 3,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (projectReviewState.cardinal != null)
                  Row(
                    spacing: 10,
                    children: [
                      InkWell(
                        onTap: () {
                          projectReviewStateNotifier.clearQuery();
                          pagingControllerNotifier.refresh();
                        },
                        child: Ink(
                          child: Icon(
                            Iconsax.filter_remove5,
                            color: TColors.secondary,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                        child: VerticalDivider(),
                      ),
                    ],
                  ),
                InkWell(
                  onTap: () {
                    ProjectHelperFunctions.projectReviewsFilterDialog(
                      context,
                      project.id!,
                    );
                  },
                  child: Ink(
                    child: Text(
                      'Filter',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 35,
                  child: VerticalDivider(),
                ),
                InkWell(
                  onTap: () {},
                  child: Ink(
                    child: Text(
                      'By date',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 35,
                  child: VerticalDivider(),
                ),
                InkWell(
                  onTap: () {},
                  child: Ink(
                    child: Text(
                      'By likes',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 35,
                  child: VerticalDivider(),
                ),
                InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.arrow_upward_rounded,
                  ),
                ),
                const SizedBox(
                  height: 35,
                  child: VerticalDivider(),
                ),
                InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.arrow_downward_rounded,
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            height: 0,
          ),
        ],
      ),
    );
  }
}
