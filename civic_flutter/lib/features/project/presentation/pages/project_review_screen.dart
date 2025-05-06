import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProjectReviewScreen extends ConsumerWidget {
  const ProjectReviewScreen({
    super.key,
    required this.projectId,
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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
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
          final projectReviewState = ref.watch(
            projectReviewProviderProvider(review),
          );
          if (projectReviewState.isEditing) {
            return ModifyProjectReview();
          } else {
            return CreateProjectReview(
              projectReview: review,
            );
          }
        },
        error: (error, st) {
          return InfiniteListLoadingError(
            retry: () {
              ref.invalidate(projectReviewDetailProvider);
            },
            errorMessage: error.toString(),
            mainAxisAlignment: MainAxisAlignment.center,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
          );
        },
        loading: () {
          return AppLoadingWidget();
        },
      ),
      bottomNavigationBar: data.when(
        data: (review) {
          final projectReviewState = ref.watch(
            projectReviewProviderProvider(review),
          );
          if (projectReviewState.isEditing) {
            return ModifyProjectReviewBottomNavBar(
              projectId: projectId,
              projectReview: review!,
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
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 5,
            ),
            child: SizedBox(
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  ref.invalidate(projectReviewDetailProvider);
                },
                child: Text(
                  'Refresh',
                ),
              ),
            ),
          );
        },
        loading: () {
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
