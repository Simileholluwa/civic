import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectVettingReactionState {
  ProjectVettingReactionState({
    required this.likesCount,
    required this.dislikesCount,
    required this.isLiked,
    required this.isDeleted,
    required this.isDisliked,
  });

  factory ProjectVettingReactionState.populate(
    ProjectVetting projectVetting,
    Ref ref,
  ) {
    final userId = ref.read(localStorageProvider).getInt('userId');
    return ProjectVettingReactionState(
      likesCount: projectVetting.likedBy?.length ?? 0,
      dislikesCount: projectVetting.dislikedBy?.length ?? 0,
      isLiked: projectVetting.likedBy?.contains(userId) ?? false,
      isDisliked: projectVetting.dislikedBy?.contains(userId) ?? false,
      isDeleted: false,
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
