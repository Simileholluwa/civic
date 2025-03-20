// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectReviewReactionState {
  final int likesCount;
  final int dislikesCount;
  final bool isLiked;
  final bool isDisliked;
  final bool isDeleted;
  ProjectReviewReactionState({
    required this.likesCount,
    required this.dislikesCount,
    required this.isLiked,
    required this.isDeleted,
    required this.isDisliked,
  });

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

  factory ProjectReviewReactionState.initial(
    ProjectReview projectReview,
    Ref ref,
  ) {
    final userId = ref.read(localStorageProvider).getInt('userId');
    return ProjectReviewReactionState(
      likesCount: projectReview.likedBy?.length ?? 0,
      dislikesCount: projectReview.dislikedBy?.length ?? 0,
      isLiked: projectReview.likedBy!.contains(userId),
      isDisliked: projectReview.dislikedBy!.contains(userId),
      isDeleted: false,
    );
  }
}
