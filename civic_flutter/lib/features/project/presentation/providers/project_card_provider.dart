import 'dart:developer';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'project_card_provider.g.dart';

@riverpod
class ProjectCardWidget extends _$ProjectCardWidget {
  @override
  ProjectCardState build(Project project) {
    return ProjectCardState.populate(project);
  }

  Future<void> addRemoveLike(int id) async {
    final addRemoveLike = ref.read(addRemoveLikeProvider);
    final result = await addRemoveLike(
      AddRemoveLikeParams(id),
    );
    return result.fold((error) {
      log(error.message);
      return;
    }, (likesCount) {
      state = state.copyWith(
        numberOfLikes: likesCount.toString(),
      );
      ref.invalidate(likedProjectProvider);
      return;
    });
  }
}

@Riverpod(keepAlive: true)
Future<bool> likedProject(Ref ref, int id) async {
  final likedProject = ref.read(hasLikedProjectProvider);
  final result = await likedProject(
    HasLikedProjectParams(id),
  );
  return result.fold((error) {
    log(error.message);
    return false;
  }, (isLiked) {
    return isLiked;
  });
}
