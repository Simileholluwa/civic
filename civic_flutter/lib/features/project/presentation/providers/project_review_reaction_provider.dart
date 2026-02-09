import 'dart:async';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'project_review_reaction_provider.g.dart';

@Riverpod(keepAlive: true)
class ReviewReaction extends _$ReviewReaction {
  @override
  ProjectReviewReactionState build(ProjectReviewWithUserStateKey? key) {
    if (key == null) {
      return ProjectReviewReactionState.empty();
    }
    final reviewWithUserState = key.value;
    _review = reviewWithUserState.review;
    final base = ProjectReviewReactionState.populate(reviewWithUserState);
    _subscribeCounts();
    return base;
  }

  ProjectReview? _review;
  StreamSubscription<ProjectReviewCounts>? _countsSub;

  void _subscribeCounts() {
    final reviewId = _review?.id;
    if (reviewId == null) return;
    unawaited(_countsSub?.cancel());
    _countsSub = ref
        .read(clientProvider)
        .project
        .projectReviewUpdates(reviewId)
        .listen((counts) {
          state = state.applyCounts(counts);
        });
    ref.onDispose(() => _countsSub?.cancel());
  }

  Future<void> reactToReview(bool isLike) async {
    final liked = state.isLiked;
    final disliked = state.isDisliked;
    if (isLike) {
      if (liked) {
        state = state.copyWith(isLiked: false);
      } else {
        state = state.copyWith(isLiked: true, isDisliked: false);
      }
    } else {
      if (disliked) {
        state = state.copyWith(isDisliked: false);
      } else {
        state = state.copyWith(isDisliked: true, isLiked: false);
      }
    }

    final react = ref.read(reactToProjectReviewProvider);
    final result = await react(
      ReactToProjectReviewParams(_review!.id!, isLike),
    );

    await result.fold(
      (l) {
        TToastMessages.errorToast(l.message);
        state = state.copyWith(isLiked: liked, isDisliked: disliked);
        return;
      },
      (r) {},
    );
  }
}
