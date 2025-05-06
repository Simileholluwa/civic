import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateProjectReview extends ConsumerWidget {
  const CreateProjectReview({
    super.key,
    this.projectReview,
  });

  final ProjectReview? projectReview;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectReviewState = ref.watch(
      projectReviewProviderProvider(projectReview),
    );
    final projectReviewNotifier = ref.watch(
      projectReviewProviderProvider(projectReview).notifier,
    );
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 15,
        children: [
          ProjectReviewSection(
            title: 'Location',
            subTitle: 'Is this project located where the Leader has indicated?',
            rating: projectReviewState.locationRating.toString(),
            currentRating: projectReviewState.locationRating.toInt(),
            onRatingSelected: (rating) {
              projectReviewNotifier.setLocationRating(
                rating.toDouble(),
              );
            },
          ),
          ProjectReviewSection(
            title: 'Description',
            subTitle:
                'How well does it match the actual project? Does it accurately describe the project?',
            rating: projectReviewState.descriptionRating.toString(),
            currentRating: projectReviewState.descriptionRating.toInt(),
            onRatingSelected: (rating) {
              projectReviewNotifier.setDescriptionRating(
                rating.toDouble(),
              );
            },
          ),
          ProjectReviewSection(
            title: 'Attachments',
            subTitle:
                'Are the attachments(Images and PDFs) relevant to the project?',
            rating: projectReviewState.attachmentsRating.toString(),
            currentRating: projectReviewState.attachmentsRating.toInt(),
            onRatingSelected: (rating) {
              projectReviewNotifier.setAttachmentsRating(
                rating.toDouble(),
              );
            },
          ),
          ProjectReviewSection(
            title: 'Category',
            subTitle:
                'Does it belong to the category and sub-category it is listed under?',
            rating: projectReviewState.categoryRating.toString(),
            currentRating: projectReviewState.categoryRating.toInt(),
            onRatingSelected: (rating) {
              projectReviewNotifier.setCategoryRating(
                rating.toDouble(),
              );
            },
          ),
          ProjectReviewSection(
            title: 'Funding',
            subTitle:
                'Is the funding amount allocated reasonable for the project?',
            rating: projectReviewState.fundingRating.toString(),
            currentRating: projectReviewState.fundingRating.toInt(),
            onRatingSelected: (rating) {
              projectReviewNotifier.setFundingRating(
                rating.toDouble(),
              );
            },
          ),
          ProjectReviewSection(
            title: 'Dates',
            subTitle:
                'Are the dates(start and end date) provided accurate? Are they realistic?',
            rating: projectReviewState.datesRating.toString(),
            currentRating: projectReviewState.datesRating.toInt(),
            onRatingSelected: (rating) {
              projectReviewNotifier.setDatesRating(
                rating.toDouble(),
              );
            },
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 5,
            children: [
              Text(
                'Review',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontSize: 20,
                    ),
              ),
              AppTextField(
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please write a review';
                  }
                  return null;
                },
                textController: projectReviewState.reviewController,
                showPrefixIcon: false,
                onChanged: (value) {
                  projectReviewNotifier.setReview(value ?? '');
                },
                hintText: 'Write your review here',
                maxLength: 400,
                maxLines: 4,
                minLines: 1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
