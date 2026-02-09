import 'dart:async';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'project_vetting_reaction_provider.g.dart';

@riverpod
class VettingReaction extends _$VettingReaction {
  @override
  ProjectVettingReactionState build(ProjectVettingWithUserStateKey? key,) {
    if (key == null) {
      return ProjectVettingReactionState.empty();
    }
    final vettingWithUserState = key.value;
    _vetting = vettingWithUserState.vetting;
    final base = ProjectVettingReactionState.populate(vettingWithUserState);
    if (!_didInit) {
      _didInit = true;
      _subscribeCounts();
      return base;
    }
    final preserved = base.copyWith(
      isLiked: state.isLiked,
      isDisliked: state.isDisliked,
      isDeleted: state.isDeleted,
    );
    _subscribeCounts();
    return preserved;
  }


  ProjectVetting? _vetting;
  StreamSubscription<ProjectVettingsCount>? _countsSub;
  bool _didInit = false;

  void _subscribeCounts() {
    final vettingId = _vetting?.id;
    if (vettingId == null) return;
    unawaited(_countsSub?.cancel());
    _countsSub = ref
        .read(clientProvider)
        .project
        .projectVettingUpdates(vettingId)
        .listen((counts) {
          state = state.applyCounts(counts);
        });
    ref.onDispose(() => _countsSub?.cancel());
  }


  Future<void> reactToVetting(bool isLike) async {
    if (isLike) {
      state = state.copyWith(
        isLiked: true,
      );
    } else {
      state = state.copyWith(
        isDisliked: true,
      );
    }
    final react = ref.read(reactToProjectVettingProvider);
    final result = await react(
      ReactToProjectVettingParams(
        _vetting!.id!,
        isLike,
      ),
    );
    await result.fold((l) {
      TToastMessages.errorToast(
        l.message,
      );
      if (isLike) {
          state = state.copyWith(
            isLiked: false,
          );
        } else {
          state = state.copyWith(
            isDisliked: false,
          );
        }
      return;
    }, (_){});
  }

    Future<bool> deleteVetting(int vettingId) async {
    
    final deleteVetting = ref.read(deleteProjectVettingProvider);
    final result = await deleteVetting(
      DeleteProjectVettingParams(
        vettingId,
      ),
    );
    return result.fold(
      (failure) {
        TToastMessages.errorToast(failure.message);
        return false;
      },
      (_) async {
        TToastMessages.successToast(
          'Your vetting was deleted successfully',
        );
        ref
            .read(
              paginatedProjectVettingListProvider.notifier,
            )
            .deleteVetting(vettingId);
        return true;
      },
    );
  }
}
