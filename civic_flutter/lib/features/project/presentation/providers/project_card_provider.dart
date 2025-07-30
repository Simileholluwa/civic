//ignore_for_file:avoid_manual_providers_as_generated_provider_dependency

import 'dart:developer';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'project_card_provider.g.dart';

@Riverpod(keepAlive: true)
class ProjectCardWidget extends _$ProjectCardWidget {
  @override
  ProjectCardState build(Project? project) {
    if (project == null) {
      return ProjectCardState.empty();
    }
    return ProjectCardState.populate(
      project,
      ref,
    );
  }

  void toggleFilter() {
    state = state.copyWith(
      toggleFilter: !state.toggleFilter!,
    );
  }

  void toggleCanDelete() {
    state = state.copyWith(
      canDelete: !state.canDelete!,
    );
  }

  void setIsFollower() {
    state = state.copyWith(
      isFollower: !state.isFollower!,
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
      state = state.copyWith(
        hasLiked: !state.hasLiked!,
      );
      return;
    });
  }

  Future<bool> toggleBookmarkStatus(
    int projectId,
    bool isBookmarked,
  ) async {
    if (isBookmarked) {
      ref
          .read(
            paginatedProjectBookmarksListProvider.notifier,
          )
          .removeProjectById(
            projectId,
          );
    } else {
      ref
          .read(
            paginatedProjectBookmarksListProvider.notifier,
          )
          .addProject(
            project,
          );
    }
    final toggleBookmark = ref.read(toggleBookmarkProvider);
    final result = await toggleBookmark(
      ToggleBookmarkParams(
        projectId,
      ),
    );
    return result.fold((error) {
      log(error.message);
      return false;
    }, (_) async {
      return true;
    });
  }

  Future<bool> markProjectNotInterested(
    int projectId,
  ) async {
    final notInterested = ref.read(notInterestedProjectProvider);
    final result = await notInterested(
      MarkNotInterestedParams(
        projectId,
      ),
    );
    return result.fold((error) {
      log(error.message);
      return false;
    }, (_) async {
      ref.read(paginatedProjectListProvider('').notifier).removeProjectById(
            projectId,
          );
      return true;
    });
  }

  Future<void> subscribeToNotifications(int projectId) async {
    final subscribe = ref.read(subToProjectNotifProvider);
    final result = await subscribe(
      SubscribeToProjectNotifParams(
        projectId,
      ),
    );
    return result.fold((error) {
      TToastMessages.errorToast(
        error.message,
      );
      return;
    }, (_) {
      TToastMessages.successToast(
        'You will be notified about updates on this project.',
      );
      return;
    });
  }

  Future<void> deleteProject(
    int projectId,
  ) async {
    final deleteProject = ref.read(deleteProjectProvider);
    final result = await deleteProject(
      DeleteProjectParams(
        projectId,
      ),
    );
    return result.fold((error) async {
      TToastMessages.errorToast(
        error.message,
      );
      return;
    }, (_) {
      return;
    });
  }
}
