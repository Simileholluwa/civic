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

  Future<void> reactToReview(bool isLike) async {
    final react = ref.read(reactToProjectReviewProvider);
    final result = await react(
      ReactToProjectReviewParams(
        projectReview.id!,
        isLike,
      ),
    );
    result.fold((l) {
      TToastMessages.errorToast(
        l.message,
      );
      return;
    }, (r){
      state = state.copyWith(
        likesCount: r!.likes,
        dislikesCount: r.dislikes,
        isLiked: r.isLiked,
        isDeleted: r.isDeleted,
        isDisliked: r.isDisliked,
      );
    });
  }

  Future<void> getReviewReactions(bool isLike) async {
    final react = ref.read(reactToProjectReviewProvider);
    final result = await react(
      ReactToProjectReviewParams(
        projectReview.id!,
        isLike
      ),
    );
    result.fold((l) {
      TToastMessages.errorToast(
        l.message,
      );
      return;
    }, (r){
      state = state.copyWith(
        likesCount: r!.likes,
        dislikesCount: r.dislikes,
        isLiked: r.isLiked,
        isDeleted: r.isDeleted,
      );
    });
  }
}