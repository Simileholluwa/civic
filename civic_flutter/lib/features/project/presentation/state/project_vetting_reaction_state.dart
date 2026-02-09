import 'package:civic_client/civic_client.dart';

class ProjectVettingReactionState {
  ProjectVettingReactionState({
    required this.likesCount,
    required this.dislikesCount,
    required this.isLiked,
    required this.isDeleted,
    required this.isDisliked,
  });

  ProjectVettingReactionState.empty()
      : likesCount = 0,
        dislikesCount = 0,
        isLiked = false,
        isDeleted = false,
        isDisliked = false;

  factory ProjectVettingReactionState.populate(
    ProjectVettingWithUserState projectVettingWithUserState,
  ) {
    return ProjectVettingReactionState(
      likesCount: projectVettingWithUserState.vetting.likesCount!,
      dislikesCount: projectVettingWithUserState.vetting.dislikesCount!,
      isLiked: projectVettingWithUserState.hasLiked!,
      isDisliked: projectVettingWithUserState.hasDisliked!,
      isDeleted: projectVettingWithUserState.hasDeleted!,
    );
  }
  final int likesCount;
  final int dislikesCount;
  final bool isLiked;
  final bool isDisliked;
  final bool isDeleted;

  ProjectVettingReactionState copyWith({
    int? likesCount,
    int? dislikesCount,
    bool? isLiked,
    bool? isDisliked,
    bool? isDeleted,
  }) {
    return ProjectVettingReactionState(
      likesCount: likesCount ?? this.likesCount,
      dislikesCount: dislikesCount ?? this.dislikesCount,
      isLiked: isLiked ?? this.isLiked,
      isDisliked: isDisliked ?? this.isDisliked,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }
}

extension ProjectVettingReactionStateCounts on ProjectVettingReactionState {
  ProjectVettingReactionState applyCounts(ProjectVettingsCount counts) => copyWith(
    likesCount: counts.likesCount,
    dislikesCount: counts.dislikesCount,
  );
}
