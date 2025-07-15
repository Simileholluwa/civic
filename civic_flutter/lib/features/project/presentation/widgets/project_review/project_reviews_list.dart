import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/project/presentation/widgets/project_details/show_filter_reviews.dart';
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
    final pagingControllerNotifier = ref.watch(
      paginatedProjectReviewListProvider(
        project.id!,
      ).notifier,
    );
    final projectReviewStateNotifier = ref.watch(
      projectReviewListQueryProvider.notifier,
    );
    final projectReviewState = ref.watch(
      projectReviewListQueryProvider,
    );
    return Stack(
      children: [
        if (project.overAllCategoryRating != null)
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ProjectRatingSummary(
                project: project,
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: projectReviewState.cardinal == null
                          ? null
                          : () {
                              projectReviewStateNotifier.clearQuery();
                              pagingControllerNotifier.refresh();
                            },
                      child: Ink(
                        child: Text(
                          'Clear filters',
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                                color: projectReviewState.cardinal == null
                                    ? Theme.of(context).disabledColor
                                    : Theme.of(context).colorScheme.onSurface,
                              ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                      child: VerticalDivider(),
                    ),
                    InkWell(
                      onTap: () async {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              contentPadding: const EdgeInsets.only(
                                bottom: 16,
                              ),
                              content: ShowFilterReviews(
                                pagingController: pagingControllerNotifier,
                              ),
                            );
                          },
                        );
                      },
                      child: Ink(
                        child: Text(
                          'Filter reviews',
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        Padding(
          padding: const EdgeInsets.only(top: 110),
          child: AppInfiniteList<ProjectReview>(
            pagingController: pagingControllerNotifier.pagingController,
            canCreate: false,
            itemBuilder: (context, review, index) {
              final liveProjectReview = ref.watch(
                projectReviewStreamProvider(
                  review.id!,
                  review,
                ),
              );
              return ProjectReviewCard(
                projectReview: liveProjectReview.value ?? review,
                project: project,
              );
            },
            onRefresh: pagingControllerNotifier.refresh,
            firstPageProgressIndicator: Padding(
              padding: const EdgeInsets.only(
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
