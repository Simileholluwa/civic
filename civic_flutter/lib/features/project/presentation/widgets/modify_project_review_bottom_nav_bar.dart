import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ModifyProjectReviewBottomNavBar extends ConsumerWidget {
  const ModifyProjectReviewBottomNavBar({
    super.key,
    required this.projectId,
    required this.projectReview,
  });
  final int projectId;
  final ProjectReview projectReview;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectReviewState = ref.watch(
      projectReviewProviderProvider(projectReview),
    );
    final projectReviewNotifier = ref.watch(
      projectReviewProviderProvider(projectReview).notifier,
    );
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 10, 18, 5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 15,
        children: [
          Expanded(
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
          Expanded(
            child: ElevatedButton(
              onPressed: projectReviewState.isDeleting
                  ? null
                  : () async {
                      ProjectHelperFunctions.deleteProjectReviewDialog(
                        context,
                        projectReviewNotifier,
                        projectId,
                        projectReview.id!,
                      );
                    },
              child: Text(
                'Delete review',
                style: const TextStyle().copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade400,
                foregroundColor: TColors.textWhite,
                padding: const EdgeInsets.symmetric(vertical: 10),
              ),
            ).withLoading(
              loading: projectReviewState.isDeleting,
            ),
          ),
        ],
      ),
    );
  }
}
