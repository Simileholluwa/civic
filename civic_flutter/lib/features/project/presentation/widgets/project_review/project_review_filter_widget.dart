import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProjectReviewFilterWidget extends StatelessWidget {
  const ProjectReviewFilterWidget({
    super.key,
    required this.projectReviewState,
    required this.projectReviewStateNotifier,
    required this.pagingControllerNotifier,
    required this.project,
  });

  final ProjectReviewQueryState projectReviewState;
  final ProjectReviewListQuery projectReviewStateNotifier;
  final PaginatedProjectReviewList pagingControllerNotifier;
  final Project project;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      margin: const EdgeInsets.only(
        right: 18,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(
          TSizes.sm,
        ),
      ),
      child: Row(
        spacing: 10,
        children: [
          if (projectReviewState.cardinal != null)
            GestureDetector(
              onTap: () {
                projectReviewStateNotifier.clearQuery();
                pagingControllerNotifier.refresh();
              },
              child: SizedBox(
                height: 22,
                width: 40,
                child: Icon(
                  Iconsax.filter_remove5,
                  size: 23,
                  color: TColors.secondary,
                ),
              ),
            ),
          if (project.overAllCategoryRating != null)
            GestureDetector(
              onTap: () async {
                await ProjectHelperFunctions.projectReviewsFilterDialog(
                  context,
                  project.id!,
                );
              },
              child: SizedBox(
                height: 22,
                width: 40,
                child: Icon(
                  Iconsax.filter5,
                  size: 22,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
