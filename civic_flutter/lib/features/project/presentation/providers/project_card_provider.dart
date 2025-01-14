import 'dart:developer';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'project_card_provider.g.dart';

@Riverpod(keepAlive: true)
class ProjectCardWidget extends _$ProjectCardWidget {
  @override
  ProjectCardState build(Project project) {
    return ProjectCardState.populate(
      project,
    );
  }

  Future<void> toggleLikeStatus(int id) async {
    final toggleLike = ref.read(toggleLikeProvider);
    final result = await toggleLike(
      ToggleLikeParams(id),
    );
    return result.fold((error) {
      log(error.message);
      return;
    }, (likesCount) async {
      final likedProjects = ref.read(getUserLikedProjectsProvider);
      final result = await likedProjects(
        NoParams(),
      );
      result.fold((error) {
        log(error.message);
      }, (isLiked) {
        if (isLiked.contains(id)) {
          likesCount+=1;
        } else {
          likesCount-=1;
        }
        state = state.copyWith(
          numberOfLikes: likesCount.toString(),
          hasLiked: isLiked.contains(id),
        );
      });
      return;
    });
  }
}

@riverpod
Future<List<int>> getLikedProjects(
  Ref ref,
) async {
  final likedProjects = ref.read(getUserLikedProjectsProvider);
  final result = await likedProjects(
    NoParams(),
  );
  return result.fold((error) {
    log(error.message);
    return <int>[];
  }, (isLiked) {
    return isLiked;
  });
}
