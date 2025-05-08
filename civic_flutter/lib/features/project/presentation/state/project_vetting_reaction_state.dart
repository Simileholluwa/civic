// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectVettingReactionState {
  final int likesCount;
  final int dislikesCount;
  final bool isLiked;
  final bool isDisliked;
  final bool isDeleted;
  ProjectVettingReactionState({
    required this.likesCount,
    required this.dislikesCount,
    required this.isLiked,
    required this.isDeleted,
    required this.isDisliked,
  });

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
}
