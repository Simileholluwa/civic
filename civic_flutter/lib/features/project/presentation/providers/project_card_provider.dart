import 'dart:developer';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'project_card_provider.g.dart';

@Riverpod(keepAlive: true)
class ProjectCardWidget extends _$ProjectCardWidget {
  @override
  ProjectCardState build(Project project) {
    return ProjectCardState.populate(
      project, ref,
    );
  }

  void toggleFilter() {
    state = state.copyWith(
      toggleFilter: !state.toggleFilter!,
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
    }, (response) async {
      state = state.copyWith(
          numberOfLikes: THelperFunctions.humanizeNumber(response.likes),
          hasLiked: response.likedByUser,
        );
      return;
    });
  }
}
