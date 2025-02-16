import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/core/widgets/create_content/create_content_rating_bar.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProjectReviewScreen extends ConsumerWidget {
  const ProjectReviewScreen({super.key, required this.id});
  final int id;
  static String routePath([int? id]) => '${id ?? ':id'}/review';
  static String routeName() => 'project/review';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(projectReviewDetailProvider(id));
    final projectReviewState = ref.watch(
      projectReviewProviderProvider(data.value),
    );
    final projectReviewNotifier = ref.watch(
      projectReviewProviderProvider(data.value).notifier,
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Theme.of(context).dividerColor,
              ),
            ),
          ),
          child: AppBar(
            titleSpacing: 4,
            title: Text(
              'Review Project',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 20,
                  ),
            ),
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                context.pop();
              },
            ),
          ),
        ),
      ),
      body: data.when(
        data: (review) {
          if (projectReviewState.isEditing) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
              ),
              child: Center(
                child: Text(
                  'You have already reviewed this project. You can edit your review below.',
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
              ),
            );
          } else {
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
                    subTitle:
                        'Is this project located where the Leader has indicated?',
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
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
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
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
        },
        error: (error, st) {
          return Center(
            child: Text(
              error.toString(),
            ),
          );
        },
        loading: () {
          return AppLoadingWidget(
            backgroundColor: THelperFunctions.isDarkMode(context)
                ? TColors.dark
                : TColors.light,
          );
        },
      ),
      bottomNavigationBar: data.when(
        data: (review) {
          if (projectReviewState.isEditing) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(18, 10, 18, 5),
              child: Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    projectReviewNotifier.setEditing(false);
                  },
                  child: Text(
                    'Edit review',
                    style: const TextStyle().copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: TColors.textWhite,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                ).withLoading(
                  loading: false,
                ),
              ),
            );
          } else {
            return Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Theme.of(context).dividerColor,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(18, 10, 18, 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  spacing: 10,
                  children: [
                    Text(
                      'All fields must be filled to submit a review. To assign a rating, click on the stars.',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: Theme.of(context).hintColor,
                            fontSize: 14,
                          ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: projectReviewState.isValid
                                ? () {
                                    projectReviewNotifier.sendReview(
                                      id,
                                      data.value?.id,
                                    );
                                  }
                                : null,
                            child: Text(
                              'Submit review',
                              style: const TextStyle().copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                              foregroundColor: TColors.textWhite,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                            ),
                          ).withLoading(
                            loading: projectReviewState.isLoading,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
        },
        error: (error, st) {
          return const SizedBox.shrink();
        },
        loading: () {
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class ProjectReviewSection extends StatelessWidget {
  const ProjectReviewSection({
    super.key,
    required this.title,
    required this.subTitle,
    required this.rating,
    required this.onRatingSelected,
    required this.currentRating,
  });

  final String title;
  final String subTitle;
  final String rating;
  final ValueChanged<int> onRatingSelected;
  final int currentRating;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontSize: 20,
              ),
        ),
        Text(
          subTitle,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AnimatedStarRating(
              onRatingSelected: onRatingSelected,
              selectedColor: Theme.of(context).primaryColor,
              unselectedColor: Theme.of(context).dividerColor,
              currentRating: currentRating,
              size: 35,
            ),
            Text(
              rating,
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontSize: 25,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
