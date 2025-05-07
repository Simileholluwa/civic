import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CreateProjectReviewBottomNavBar extends ConsumerWidget {
  const CreateProjectReviewBottomNavBar({
    super.key,
    required this.projectId,
    this.projectReview,
    required this.fromDetails,
  });

  final int projectId;
  final ProjectReview? projectReview;
  final bool fromDetails;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectReviewState = ref.watch(
      projectReviewProviderProvider(projectReview),
    );
    final projectReviewNotifier = ref.watch(
      projectReviewProviderProvider(projectReview).notifier,
    );
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
                        ? () async {
                            final result =
                                await projectReviewNotifier.sendReview(
                              projectId,
                              projectReview?.id,
                              fromDetails,
                            );
                            if (result) {
                              if (context.mounted) {
                                context.pop();
                              }
                            }
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
}
