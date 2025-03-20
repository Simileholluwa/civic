import 'dart:developer';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'project_review_reaction_provider.g.dart';

@riverpod
class ReviewReaction extends _$ReviewReaction {
  @override
  ProjectReviewReactionState build(ProjectReview projectReview) {
    return ProjectReviewReactionState.initial(projectReview, ref);
  }

  Future<ProjectReview> _listenToUpdates(int projectReviewId) async {
    while (true) {
      try {
        final projectReviewUpdates = ref
            .read(
              clientProvider,
            )
            .project
            .projectReviewUpdates(
              projectReviewId,
            );
        await for (final update in projectReviewUpdates) {
          return update;
        }
      } on MethodStreamException catch (e) {
        log(e.toString());
        return projectReview;
      } 
      await Future.delayed(Duration(seconds: 5));
    }
  }

  Future<void> reactToReview(bool isLike) async {
    final react = ref.read(reactToProjectReviewProvider);
    final result = await react(
      ReactToProjectReviewParams(
        projectReview.id!,
        isLike,
      ),
    );
    result.fold((l) {
      log(
        l.message,
      );
      return;
    }, (r) async{
      final updatedReview = await _listenToUpdates(projectReview.id!);
      final userId = ref.read(localStorageProvider).getInt('userId');
      state = state.copyWith(
        likesCount: updatedReview.likedBy!.length,
        dislikesCount: updatedReview.dislikedBy!.length,
        isLiked: updatedReview.likedBy!.contains(userId),
        isDisliked: updatedReview.dislikedBy!.contains(userId),
      );
      return;
    });
  }
}