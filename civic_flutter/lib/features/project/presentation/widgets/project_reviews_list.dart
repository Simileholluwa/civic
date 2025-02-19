import 'package:civic_client/civic_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';

class ProjectReviewsScreen extends ConsumerWidget {
  const ProjectReviewsScreen({
    super.key,
    required this.projectId,
    required this.project,
  });

  final int projectId;
  final Project project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pagingControllerNotifier =
        ref.watch(paginatedProjectReviewListProvider(projectId).notifier);
    return Column(
      children: [
        if (project.overAllCategoryRating != null)
          Column(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(
                  18,
                  5,
                  18,
                  5,
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
                      height: 35,
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
                      height: 35,
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
                      height: 35,
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
                      height: 35,
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
                      height: 35,
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
              const Divider(height: 5,),
            ],
          ),
        AppInfiniteList<ProjectReview>(
          pagingController: pagingControllerNotifier.pagingController,
          shrinkWrap: true,
          showDivider: false,
          scrollPhysics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, projectReview, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ContentCreatorInfo(
                    timeAgo: THelperFunctions.humanizeDateTime(
                      projectReview.dateCreated ?? DateTime.now(),
                    ),
                    creator: projectReview.owner!,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    projectReview.review!,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontSize: 17,
                        ),
                    textAlign: TextAlign.start,
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
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 13, right: 3),
                    margin: const EdgeInsets.only(
                      left: 3,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 3,
                        ),
                        right: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 3,
                        ),
                        top: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 1,
                        ),
                        bottom: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 1,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Was this review helpful?',
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    fontSize: 14,
                                  ),
                          textAlign: TextAlign.start,
                        ),
                        Row(
                          spacing: 10,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.thumb_up,
                              ),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.thumb_down,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          onRefresh: pagingControllerNotifier.refresh,
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

  final String title;
  final double rating;

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
  final String ratingNumber;
  final double rating;
  final String title;
  final double titleSize;
  final double ratingSize;
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
