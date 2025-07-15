import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';

class ProjectReviewCard extends ConsumerWidget {
  const ProjectReviewCard({
    super.key,
    required this.projectReview,
    required this.project,
  });

  final Project project;
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
    final projectReviewNotiier = ref.watch(
      projectReviewProviderProvider(
        projectReview,
      ).notifier,
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
              ReactToReviewOrVetting(
                text: 'Was this review helpful?',
                likesCount: reactToReviewState.likesCount,
                likeTextColor: reactToReviewState.isLiked &&
                        reactToReviewState.isDeleted == false
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onSurface,
                dislikeTextColor: reactToReviewState.isDisliked &&
                        reactToReviewState.isDeleted == false
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.onSurface,
                likeTapped: () {
                  reactToReviewNotifier.reactToReview(true);
                },
                dislikeTapped: () {
                  reactToReviewNotifier.reactToReview(false);
                },
                isOwner: projectReview.ownerId == userId,
                onDelete: () {
                  ProjectHelperFunctions.deleteProjectReviewDialog(
                    context,
                    projectReviewNotiier,
                    project.id!,
                    projectReview.id!,
                    false,
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
