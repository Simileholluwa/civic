import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectReviewCard extends ConsumerWidget {
  const ProjectReviewCard({
    required this.projectReviewWithUserState,
    required this.project,
    super.key,
  });

  final Project project;
  final ProjectReviewWithUserState projectReviewWithUserState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reviewWithKey = ProjectReviewWithUserStateKey(
      projectReviewWithUserState,
    );
    final reactToReviewNotifier = ref.read(
      reviewReactionProvider(
        reviewWithKey,
      ).notifier,
    );
    final reactToReviewState = ref.watch(
      reviewReactionProvider(
        reviewWithKey,
      ),
    );
    final review = projectReviewWithUserState.review;
    final projectReviewNotifier = ref.read(
              projectReviewProviderProvider(review).notifier,
            );
    final userId = ref
        .read(
          localStorageProvider,
        )
        .getInt(
          'userId',
        );
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              ContentCreatorInfo(
                timeAgo: THelperFunctions.humanizeDateTime(
                  review.dateCreated ?? DateTime.now(),
                ),
                creator: review.owner!,
              ),
              
              ContentExpandableText(
                text: review.review!,
                expandOnTextTap: true,
                maxLines: 4,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 10,
                  children: [
                    ProjectTitleAndRating(
                      ratingNumber: review.locationRating
                          .toString()
                          .substring(0, 1),
                      rating: review.locationRating!,
                      title: 'Location',
                      showRatingCount: false,
                    ),
                    const SizedBox(
                      height: 35,
                      child: VerticalDivider(),
                    ),
                    ProjectTitleAndRating(
                      ratingNumber: review.descriptionRating
                          .toString()
                          .substring(0, 1),
                      rating: review.descriptionRating!,
                      title: 'Description',
                      showRatingCount: false,
                    ),
                    const SizedBox(
                      height: 35,
                      child: VerticalDivider(),
                    ),
                    ProjectTitleAndRating(
                      ratingNumber: review.attachmentsRating
                          .toString()
                          .substring(0, 1),
                      rating: review.attachmentsRating!,
                      title: 'Attachments',
                      showRatingCount: false,
                    ),
                    const SizedBox(
                      height: 35,
                      child: VerticalDivider(),
                    ),
                    ProjectTitleAndRating(
                      ratingNumber: review.categoryRating
                          .toString()
                          .substring(0, 1),
                      rating: review.categoryRating!,
                      title: 'Category',
                      showRatingCount: false,
                    ),
                    const SizedBox(
                      height: 35,
                      child: VerticalDivider(),
                    ),
                    ProjectTitleAndRating(
                      ratingNumber: review.fundingRating
                          .toString()
                          .substring(0, 1),
                      rating: review.fundingRating!,
                      title: 'Funding',
                      showRatingCount: false,
                    ),
                    const SizedBox(
                      height: 35,
                      child: VerticalDivider(),
                    ),
                    ProjectTitleAndRating(
                      ratingNumber: review.datesRating
                          .toString()
                          .substring(0, 1),
                      rating: review.datesRating!,
                      title: 'Dates',
                      showRatingCount: false,
                    ),
                  ],
                ),
              ),
              ReactToReviewOrVetting(
                text: 'Was this review helpful?',
                likesCount: reactToReviewState.likesCount,
                likeTextColor:
                    reactToReviewState.isLiked && !reactToReviewState.isDeleted
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onSurface,
                dislikeTextColor:
                    reactToReviewState.isDisliked &&
                        !reactToReviewState.isDeleted
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.onSurface,
                likeTapped: () async {
                  await reactToReviewNotifier.reactToReview(true);
                },
                dislikeTapped: () async {
                  await reactToReviewNotifier.reactToReview(false);
                },
                isOwner: review.ownerId == userId,
                onDelete: () async {
                  final res =
                      await ProjectHelperFunctions.deleteProjectReviewDialog(
                        context,
                        project.id!,
                        review.id!,
                      );
                  if (res ?? false) {
                    await projectReviewNotifier.deleteReview(
                      project.id!,
                      review.id!,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
