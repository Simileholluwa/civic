import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectReviewCard extends ConsumerWidget {
  const ProjectReviewCard({
    super.key,
    required this.projectReview,
  });

  final ProjectReview projectReview;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  ratingNumber:
                      projectReview.locationRating.toString().substring(0, 1),
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
                  ratingNumber:
                      projectReview.categoryRating.toString().substring(0, 1),
                  rating: projectReview.categoryRating!,
                  title: 'Category',
                ),
                const SizedBox(
                  height: 35,
                  child: VerticalDivider(),
                ),
                ProjectTitleAndRating(
                  ratingNumber:
                      projectReview.fundingRating.toString().substring(0, 1),
                  rating: projectReview.fundingRating!,
                  title: 'Funding',
                ),
                const SizedBox(
                  height: 35,
                  child: VerticalDivider(),
                ),
                ProjectTitleAndRating(
                  ratingNumber:
                      projectReview.datesRating.toString().substring(0, 1),
                  rating: projectReview.datesRating!,
                  title: 'Dates',
                ),
              ],
            ),
          ),
          ContentExpandableText(
            text: projectReview.review!,
            onToggleTextTap: null,
            hasVideo: true,
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 5,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10,
                ),
                color: Theme.of(context).cardColor,
              ),
              padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Was this review helpful?',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: Theme.of(context).hintColor,
                        ),
                  ),
                  Row(
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
