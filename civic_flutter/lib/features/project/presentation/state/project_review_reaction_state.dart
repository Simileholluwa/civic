import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectReviewReactionState {
  ProjectReviewReactionState({
    required this.likesCount,
    required this.dislikesCount,
    required this.isLiked,
    required this.isDeleted,
    required this.isDisliked,
  });

  factory ProjectReviewReactionState.populate(
    ProjectReview projectReview,
    Ref ref,
  ) {
    final userId = ref.read(localStorageProvider).getInt('userId');
    return ProjectReviewReactionState(
      likesCount: projectReview.likedBy?.length ?? 0,
      dislikesCount: projectReview.dislikedBy?.length ?? 0,
      isLiked: projectReview.likedBy?.contains(userId) ?? false,
      isDisliked: projectReview.dislikedBy?.contains(userId) ?? false,
      isDeleted: false,
    );
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
