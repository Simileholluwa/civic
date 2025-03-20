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
      project,
      ref,
    );
  }

  void toggleFilter() {
    state = state.copyWith(
      toggleFilter: !state.toggleFilter,
    );
  }

  void setProjectReview(int numberOfReviews) {
    state = state.copyWith(
      numberOfReviews: THelperFunctions.humanizeNumber(
            numberOfReviews,
          ),
      hasReviewed: true,
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
    }, (_) async {
      return;
    });
  }

  Future<void> toggleBookmarkStatus(
    int projectId,
  ) async {
    final toggleBookmark = ref.read(toggleBookmarkProvider);
    final result = await toggleBookmark(
      ToggleBookmarkParams(
        projectId,
      ),
    );
    return result.fold((error) {
      log(error.message);
      return;
    }, (_) async {
      return;
    });
  }
}
