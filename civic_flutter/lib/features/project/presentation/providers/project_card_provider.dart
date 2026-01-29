import 'dart:async';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'project_card_provider.g.dart';

@riverpod
class ProjectCardWidget extends _$ProjectCardWidget {
  @override
  ProjectCardState build(ProjectWithUserStateKey? key) {
    if (key == null) {
      return ProjectCardState.empty();
    }
    final projectWithUserState = key.value;
    _project = projectWithUserState.project;
    final base = ProjectCardState.populate(projectWithUserState);
    if (!_didInit) {
      _didInit = true;
      _subscribeCounts();
      return base;
    }
    final preserved = base.copyWith(
      hasLiked: state.hasLiked,
      isBookmarked: state.isBookmarked,
      isFollower: state.isFollower,
      hasReposted: state.hasReposted,
      hasReviewed: state.hasReviewed,
      hasVetted: state.hasVetted,
      isSubscribed: state.isSubscribed,
    );
    _subscribeCounts();
    return preserved;
  }

  Project? _project;
  StreamSubscription<ProjectCounts>? _countsSub;
  bool _didInit = false;

  void _subscribeCounts() {
    final projectId = _project?.id;
    if (projectId == null) return;
    unawaited(_countsSub?.cancel());
    _countsSub = ref
        .read(clientProvider)
        .project
        .projectCountUpdates(projectId)
        .listen((counts) {
          state = state.applyCounts(counts);
        });
    ref.onDispose(() => _countsSub?.cancel());
  }

  void toggleCanDelete() {
    state = state.copyWith(
      canDelete: !state.canDelete,
    );
  }

  void setIsFollower() {
    state = state.copyWith(
      isFollower: !state.isFollower,
    );
  }

  Future<void> toggleLikeStatus(int id) async {
    final currentlyLiked = state.hasLiked;
    state = state.copyWith(
      hasLiked: !currentlyLiked,
    );
    final toggleLike = ref.read(toggleLikeProvider);
    final result = await toggleLike(
      ToggleLikeParams(id),
    );
    return result.fold(
      (error) {
        TToastMessages.errorToast(error.message);
        state = state.copyWith(
          hasLiked: currentlyLiked,
        );
        return;
      },
      (_) {},
    );
  }

  Future<void> toggleBookmarkStatus(
    int projectId, {bool showToast = false}
  ) async {
    final currentBookmarked = state.isBookmarked;
    state = state.copyWith(
      isBookmarked: !currentBookmarked,
    );
    if (currentBookmarked) {
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
            ProjectWithUserState(
              project: _project!,
              hasBookmarked: state.isBookmarked,
              hasLiked: state.hasLiked,
              isFollower: state.isFollower,
              hasReposted: state.hasReposted,
              hasReviewed: state.hasReviewed,
              hasVetted: state.hasVetted,
              isSubscribed: state.isSubscribed,
            ),
          );
    }
    final toggleBookmark = ref.read(toggleBookmarkProvider);
    final result = await toggleBookmark(
      ToggleBookmarkParams(
        projectId,
      ),
    );
    return result.fold(
      (error) {
        TToastMessages.errorToast(error.message);
        state = state.copyWith(
          isBookmarked: currentBookmarked,
        );
        return;
      },
      (_) {
        if (showToast) {
          if (!currentBookmarked) {
            TToastMessages.infoToast('Project has been bookmarked');
          } else {
            TToastMessages.infoToast(
              'Project has been removed from bookmarks',
            );
          }
        }
        return;
      },
    );
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
    return result.fold(
      (error) {
        TToastMessages.errorToast(error.message);
        return false;
      },
      (_) async {
        ref
            .read(paginatedProjectListProvider('').notifier)
            .removeProjectById(
              projectId,
            );
        return true;
      },
    );
  }

  Future<void> subscribeToNotifications(int projectId) async {
    final isSubbed = state.isSubscribed;
    state = state.copyWith(
      isSubscribed: !isSubbed,
    );
    final subscribe = ref.read(subToProjectNotifProvider);
    final result = await subscribe(
      SubscribeToProjectNotifParams(
        projectId,
      ),
    );
    return result.fold(
      (error) {
        TToastMessages.errorToast(
          error.message,
        );
        state = state.copyWith(
          isSubscribed: isSubbed,
        );
        return;
      },
      (_) {
        if (!isSubbed) {
        TToastMessages.successToast(
          'You will now receive notifications on this project.',
        );
      } else {
        TToastMessages.infoToast(
          'You will no longer receive notifications on this project.',
        );
      }
        return;
      },
    );
  }

  Future<void> deleteProject(
    int projectId,
  ) async {
    final paginatedPostNotifier = ref
        .read(paginatedProjectListProvider('').notifier);
    final removed = _project;
    paginatedPostNotifier.removeProjectById(
      projectId,
    );
    final deleteProject = ref.read(deleteProjectProvider);
    final result = await deleteProject(
      DeleteProjectParams(
        projectId,
      ),
    );
    return result.fold(
      (error) async {
        if (removed != null) {
          paginatedPostNotifier.addProject(
            ProjectWithUserState(
              project: removed,
              hasBookmarked: state.isBookmarked,
              hasLiked: state.hasLiked,
              isFollower: state.isFollower,
              hasReposted: state.hasReposted,
              hasReviewed: state.hasReviewed,
              hasVetted: state.hasVetted,
              isSubscribed: state.isSubscribed,
            ),
          );
        }
        TToastMessages.errorToast(
          error.message,
        );
        return;
      },
      (_) {
        return;
      },
    );
  }
}
