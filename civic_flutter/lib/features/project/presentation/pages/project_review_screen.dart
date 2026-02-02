import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class ProjectReviewScreen extends ConsumerWidget {
  const ProjectReviewScreen({
    required this.projectId,
    super.key,
    this.fromDetails = true,
  });
  final int projectId;
  final bool fromDetails;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(
      projectReviewDetailProvider(
        projectId,
      ),
    );
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65),
          child: Container(
            margin: EdgeInsets.only(
              top: fromDetails ? 0 : 4,
            ),
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
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontSize: 23,
                    ),
              ),
              centerTitle: true,
              automaticallyImplyLeading: false,
              leading: IconButton(
                icon: const Icon(Iconsax.arrow_left_2),
                onPressed: () {
                  context.pop();
                },
              ),
            ),
          ),
        ),
        body: data.when(
          data: (review) {
            final projectReviewState = ref.watch(
              projectReviewProviderProvider(review),
            );
            if (projectReviewState.isEditing) {
              return const ModifyProjectReviewOrVetting(
                information:
                    'You have already reviewed this project. You can make changes to your review below.',
              );
            } else {
              return CreateProjectReview(
                projectReview: review,
              );
            }
          },
          error: (error, st) {
            final err = error as Map<String, String?>;
            return LoadingError(
              retry: () {
                ref.invalidate(projectReviewDetailProvider);
              },
              errorMessage: err['message'],
              mainAxisAlignment: MainAxisAlignment.center,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
            );
          },
          loading: () {
            return const AppLoadingWidget();
          },
        ),
        bottomNavigationBar: data.when(
          data: (review) {
            final projectReviewState = ref.watch(
              projectReviewProviderProvider(review),
            );
            final projectReviewNotifier = ref.watch(
              projectReviewProviderProvider(review).notifier,
            );
            if (projectReviewState.isEditing) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),
                child: ContentDoubleButton(
                  firstButtonOnPressed: () {
                    projectReviewNotifier.setEditing(false);
                  },
                  firstButtonIcon: Iconsax.edit,
                  firstButtonText: 'Edit review',
                  secondButtonOnPressed: projectReviewState.isDeleting
                      ? null
                      : () async {
                          await ProjectHelperFunctions.deleteProjectReviewDialog(
                            context,
                            projectReviewNotifier,
                            projectId,
                            review!.id!,
                          );
                        },
                  secondButtonColor: Colors.red,
                  secondButtonIcon: Iconsax.trash,
                  secondButtonText: 'Delete review',
                  seccondButtonLoading: projectReviewState.isDeleting,
                ),
              );
            } else {
              return CreateProjectReviewBottomNavBar(
                projectReview: review,
                projectId: projectId,
                fromDetails: fromDetails,
              );
            }
          },
          error: (error, st) {
            final err = error as Map<String, String?>;
            if (err['action']! == 'retry') {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),
                child: ContentSingleButton(
                  onPressed: () {
                    ref.invalidate(projectReviewDetailProvider);
                  },
                  text: 'Retry',
                  buttonIcon: Iconsax.refresh,
                ),
              );
            } else if (err['action']! == 'share') {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),
                child: ContentDoubleButton(
                  firstButtonOnPressed: () {},
                  firstButtonIcon: Iconsax.share,
                  firstButtonText: 'Share project',
                  secondButtonOnPressed: () {},
                  secondButtonColor: Colors.blue,
                  secondButtonIcon: Iconsax.copy,
                  secondButtonText: 'Copy link',
                ),
              );
            } else {
              return null;
            }
          },
          loading: () {
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
