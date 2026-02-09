import 'package:civic_client/civic_client.dart';

class ProjectReviewReactionState {
  ProjectReviewReactionState({
    required this.likesCount,
    required this.dislikesCount,
    required this.isLiked,
    required this.isDeleted,
    required this.isDisliked,
  });

  factory ProjectReviewReactionState.populate(
    ProjectReviewWithUserState projectReviewWithUserState,
  ) {
    return ProjectReviewReactionState(
      likesCount: projectReviewWithUserState.review.likesCount!,
      dislikesCount: projectReviewWithUserState.review.dislikesCount!,
      isLiked: projectReviewWithUserState.hasLiked!,
      isDisliked: projectReviewWithUserState.hasDisliked!,
      isDeleted: projectReviewWithUserState.hasDeleted!,
    );
  }

  ProjectReviewReactionState.empty()
      : likesCount = 0,
        dislikesCount = 0,
        isLiked = false,
        isDeleted = false,
        isDisliked = false;

  @override
  String toString() {
    return 'ProjectReviewReactionState(likesCount: $likesCount, dislikesCount: $dislikesCount, isLiked: $isLiked, isDeleted: $isDeleted, isDisliked: $isDisliked)';
  }
  final int likesCount;
  final int dislikesCount;
  final bool isLiked;
  final bool isDisliked;
  final bool isDeleted;

  ProjectReviewReactionState copyWith({
    int? likesCount,
    int? dislikesCount,
    bool? isLiked,
    bool? isDeleted,
    bool? isDisliked,
  }) {
    return ProjectReviewReactionState(
      likesCount: likesCount ?? this.likesCount,
      dislikesCount: dislikesCount ?? this.dislikesCount,
      isLiked: isLiked ?? this.isLiked,
      isDeleted: isDeleted ?? this.isDeleted,
      isDisliked: isDisliked ?? this.isDisliked,
    );
  }
}

extension ProjectReviewReactionStateCounts on ProjectReviewReactionState {
  ProjectReviewReactionState applyCounts(ProjectReviewCounts counts) => copyWith(
    likesCount: counts.likesCount,
    dislikesCount: counts.dislikesCount,
  );
}
