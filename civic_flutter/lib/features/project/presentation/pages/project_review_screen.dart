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
    final projectReviewState = ref.watch(
      projectReviewProviderProvider(data.value),
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
          if (projectReviewState.isEditing) {
            return ModifyProjectReview();
          } else {
            return CreateProjectReview(
              projectReview: review!,
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
          return AppLoadingWidget();
        },
      ),
      bottomNavigationBar: data.when(
        data: (review) {
          if (projectReviewState.isEditing && review != null) {
            return ModifyProjectReviewBottomNavBar(
              projectId: projectId,
              projectReview: review,
            );
          } else {
            return CreateProjectReviewBottomNavBar(
              projectReview: review!,
              projectId: projectId,
              fromDetails: fromDetails,
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
