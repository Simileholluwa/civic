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
    return ProjectReviewReactionState.empty(projectReview, ref);
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
      final userId = ref.read(localStorageProvider).getInt('userId');
      state = state.copyWith(
        likesCount: r.likedBy!.length,
        dislikesCount: r.dislikedBy!.length,
        isLiked: r.likedBy!.contains(userId),
        isDisliked: r.dislikedBy!.contains(userId),
      );
      return;
    });
  }
}