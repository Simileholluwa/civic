import 'package:civic_client/civic_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';

class ProjectReviewsList extends ConsumerWidget {
  const ProjectReviewsList({
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
    final liveProject = ref.watch(
      projectStreamProvider(
        project.id!,
        project,
      ),
    );
    final projectReviewStateNotifier =
        ref.watch(projectReviewListQueryProvider.notifier);
    final projectReviewState = ref.watch(projectReviewListQueryProvider);
    return SingleChildScrollView(
      child: Column(
        children: [
          liveProject.when(data: (newProject) {
            if (newProject.overAllCategoryRating == null) {
              return const SizedBox.shrink();
            }
            return ProjectRatingSummary(
              project: newProject,
            );
          }, error: (_, __) {
            return ProjectRatingSummary(
              project: project,
            );
          }, loading: () {
            return const SizedBox();
          }),
          AppInfiniteList<ProjectReview>(
            pagingController: pagingControllerNotifier.pagingController,
            shrinkWrap: true,
            scrollPhysics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, review, index) {
              final liveProjectReview = ref.watch(
                projectReviewStreamProvider(
                  review.id!,
                  review,
                ),
              );
              return liveProjectReview.when(data: (projectReview) {
                return ProjectReviewCard(
                  projectReview: projectReview,
                  projectId: project.id!,
                );
              }, error: (_, __) {
                return ProjectReviewCard(
                  projectReview: review,
                  projectId: project.id!,
                );
              }, loading: () {
                return const SizedBox();
              });
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
                    style: Theme.of(context).textTheme.bodyMedium,
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
      ),
    );
  }
}
