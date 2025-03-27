import 'package:civic_client/civic_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';

class ProjectReviewsScreen extends ConsumerWidget {
  const ProjectReviewsScreen({
    super.key,
    required this.project,
    this.text,
  });

  final Project project;
  final String? text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pagingControllerNotifier =
        ref.watch(paginatedProjectReviewListProvider(project.id!).notifier);
    final projectReviewStateNotifier =
        ref.watch(projectReviewListQueryProvider.notifier);
    final projectReviewState = ref.watch(projectReviewListQueryProvider);
    return Column(
      children: [
        if (project.overAllCategoryRating != null)
          Column(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(
                  18,
                  9,
                  18,
                  5,
                ),
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 10,
                  children: [
                    ProjectTitleAndRating(
                      ratingNumber: project.overallLocationRating
                          .toString()
                          .substring(0, 3),
                      rating: project.overallLocationRating!,
                      title: 'Location',
                      titleSize: 50,
                      ratingSize: 18,
                      titleSize2: 15,
                    ),
                    const SizedBox(
                      height: 40,
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
                      height: 40,
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
                      height: 40,
                      child: VerticalDivider(),
                    ),
                    ProjectTitleAndRating(
                      ratingNumber: project.overAllCategoryRating
                          .toString()
                          .substring(0, 3),
                      rating: project.overAllCategoryRating!,
                      title: 'Category',
                      titleSize: 50,
                      ratingSize: 18,
                      titleSize2: 15,
                    ),
                    const SizedBox(
                      height: 40,
                      child: VerticalDivider(),
                    ),
                    ProjectTitleAndRating(
                      ratingNumber: project.overallFundingRating
                          .toString()
                          .substring(0, 3),
                      rating: project.overallFundingRating!,
                      title: 'Funding',
                      titleSize: 50,
                      ratingSize: 18,
                      titleSize2: 15,
                    ),
                    const SizedBox(
                      height: 40,
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
            ],
          ),
        AppInfiniteList<ProjectReview>(
          pagingController: pagingControllerNotifier.pagingController,
          shrinkWrap: true,
          scrollPhysics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, projectReview, index) {
            final reactToReviewNotifier = ref.watch(
              reviewReactionProvider(
                projectReview,
              ).notifier,
            );

            final reactToReviewState = ref.watch(
              reviewReactionProvider(
                projectReview,
              ),
            );

            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  ContentCreatorInfo(
                    timeAgo: THelperFunctions.humanizeDateTime(
                      projectReview.dateCreated ?? DateTime.now(),
                    ),
                    creator: projectReview.owner!,
                  ),
                  SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(1, 0, 0, 0),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 10,
                      children: [
                        ProjectTitleAndRating(
                          ratingNumber: projectReview.locationRating
                              .toString()
                              .substring(0, 1),
                          rating: projectReview.locationRating!,
                          title: 'Location',
                        ),
                        const SizedBox(
                          height: 35,
                          child: VerticalDivider(),
                        ),
                        ProjectTitleAndRating(
                          ratingNumber: projectReview.descriptionRating
                              .toString()
                              .substring(0, 1),
                          rating: projectReview.descriptionRating!,
                          title: 'Description',
                        ),
                        const SizedBox(
                          height: 35,
                          child: VerticalDivider(),
                        ),
                        ProjectTitleAndRating(
                          ratingNumber: projectReview.attachmentsRating
                              .toString()
                              .substring(0, 1),
                          rating: projectReview.attachmentsRating!,
                          title: 'Attachments',
                        ),
                        const SizedBox(
                          height: 35,
                          child: VerticalDivider(),
                        ),
                        ProjectTitleAndRating(
                          ratingNumber: projectReview.categoryRating
                              .toString()
                              .substring(0, 1),
                          rating: projectReview.categoryRating!,
                          title: 'Category',
                        ),
                        const SizedBox(
                          height: 35,
                          child: VerticalDivider(),
                        ),
                        ProjectTitleAndRating(
                          ratingNumber: projectReview.fundingRating
                              .toString()
                              .substring(0, 1),
                          rating: projectReview.fundingRating!,
                          title: 'Funding',
                        ),
                        const SizedBox(
                          height: 35,
                          child: VerticalDivider(),
                        ),
                        ProjectTitleAndRating(
                          ratingNumber: projectReview.datesRating
                              .toString()
                              .substring(0, 1),
                          rating: projectReview.datesRating!,
                          title: 'Dates',
                        ),
                      ],
                    ),
                  ),
                  Text(
                    projectReview.review!,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontSize: 17,
                        ),
                    textAlign: TextAlign.start,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 5,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                                title: THelperFunctions.humanizeNumber(
                                  reactToReviewState.likesCount,
                                ),
                                icon: Icons.thumb_up_rounded,
                                backgroundColor: Colors.transparent,
                                textColor: reactToReviewState.isLiked &&
                                        reactToReviewState.isDeleted == false
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context).colorScheme.onSurface,
                                isApprove: true,
                                iconSize: 20,
                                fontSize: 18,
                                onTap: () {
                                  reactToReviewNotifier.reactToReview(true);
                                },
                              ),
                              const SizedBox(
                                height: 35,
                                child: VerticalDivider(),
                              ),
                              ProjectVetButton(
                                title: '',
                                icon: Icons.thumb_down_rounded,
                                backgroundColor: Colors.transparent,
                                textColor: reactToReviewState.isDisliked &&
                                        reactToReviewState.isDeleted == false
                                    ? Theme.of(context).colorScheme.secondary
                                    : Theme.of(context).colorScheme.onSurface,
                                isDisapprove: true,
                                iconSize: 20,
                                onTap: () {
                                  reactToReviewNotifier.reactToReview(false);
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          onRefresh: pagingControllerNotifier.refresh,
          noItemsFound: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
              children: [
                Image(
                  height: 250,
                  image: AssetImage(
                    TImageTexts.noData,
                  ),
                ),
                Text(
                  text ??
                      (projectReviewState.rating != null
                          ? "There are no items matching your query. Try another query or clear the filters."
                          : "There are no reviews... yet. Be the first! Tap on the review button to get started."),
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                if (projectReviewState.rating != null)
                  TextButton(
                    onPressed: () {
                      projectReviewStateNotifier.clearQuery();
                      pagingControllerNotifier.refresh();
                    },
                    child: const Text('Clear filters'),
                  ),
              ],
            ),
          ),
          firstPageProgressIndicator: Padding(
            padding: const EdgeInsets.only(
              top: 50,
            ),
            child: AppLoadingWidget(),
          ),
        ),
      ],
    );
  }
}

class ProjectOverallRating extends StatelessWidget {
  const ProjectOverallRating({
    super.key,
    required this.title,
    required this.rating,
  });

  final double rating;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              rating.toString(),
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontSize: 50,
                  ),
            ),
            Column(
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.labelMedium!,
                ),
                RatingBar(
                  rating: rating,
                  ratingCount: null,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class ProjectTitleAndRating extends StatelessWidget {
  const ProjectTitleAndRating({
    required this.rating,
    required this.title,
    required this.ratingNumber,
    this.titleSize = 33,
    this.ratingSize = 10,
    this.titleSize2 = 12,
    super.key,
  });

  final double rating;
  final String ratingNumber;
  final double ratingSize;
  final String title;
  final double titleSize;
  final double titleSize2;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 3,
      children: [
        Text(
          ratingNumber,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontSize: titleSize,
              ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 5,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RatingBar(
                rating: rating,
                ratingCount: null,
                size: ratingSize,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontSize: titleSize2,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
