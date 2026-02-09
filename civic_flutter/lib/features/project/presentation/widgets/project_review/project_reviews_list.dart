import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectReviewsList extends ConsumerWidget {
  const ProjectReviewsList({
    required this.project,
    super.key,
    this.text,
  });

  final Project project;
  final String? text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pagingState = ref.watch(
      paginatedProjectReviewListProvider(
        project.id!,
      ),
    );
    final ratingState = ref.watch(
      projectOverallRatingCountsProvider(
        project,
      ),
    );
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(context).dividerColor,
                  ),
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 10,
                  children: [
                    ProjectTitleAndRating(
                      ratingNumber: ratingState.overAllLocationRating
                          .toString()
                          .substring(0, 3),
                      rating: ratingState.overAllLocationRating,
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
                      ratingNumber: ratingState.overAllDescriptionRating
                          .toString()
                          .substring(0, 3),
                      rating: ratingState.overAllDescriptionRating,
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
                      ratingNumber: ratingState.overAllAttachmentsRating
                          .toString()
                          .substring(0, 3),
                      rating: ratingState.overAllAttachmentsRating,
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
                      ratingNumber: ratingState.overAllCategoryRating
                          .toString()
                          .substring(0, 3),
                      rating: ratingState.overAllCategoryRating,
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
                      ratingNumber: ratingState.overAllFundingRating
                          .toString()
                          .substring(0, 3),
                      rating: ratingState.overAllFundingRating,
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
                      ratingNumber: ratingState.overAllDatesRating
                          .toString()
                          .substring(0, 3),
                      rating: ratingState.overAllDatesRating,
                      title: 'Dates',
                      titleSize: 50,
                      ratingSize: 18,
                      titleSize2: 15,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 70),
          child: AppInfiniteList<ProjectReviewWithUserState>(
            pagingController: pagingState,
            canCreate: false,
            itemBuilder: (context, review, index) {
              return ProjectReviewCard(
                projectReviewWithUserState: review,
                project: project,
              );
            },
            onRefresh: pagingState.refresh,
            firstPageProgressIndicator: const Padding(
              padding: EdgeInsets.only(
                top: 50,
              ),
              child: AppLoadingWidget(),
            ),
          ),
        ),
      ],
    );
  }
}
