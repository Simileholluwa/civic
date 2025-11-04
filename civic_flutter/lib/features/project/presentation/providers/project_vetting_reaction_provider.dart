import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'project_vetting_reaction_provider.g.dart';

@riverpod
class VettingReaction extends _$VettingReaction {
  @override
  ProjectVettingReactionState build(ProjectVetting projectVetting) {
    return ProjectVettingReactionState.populate(projectVetting, ref);
  }

  Future<void> reactToVetting(bool isLike) async {
    final react = ref.read(reactToProjectVettingProvider);
    final result = await react(
      ReactToProjectVettingParams(
        projectVetting.id!,
        isLike,
      ),
    );
    await result.fold((l) {
      TToastMessages.errorToast(
        l.message,
      );
      return;
    }, (r) async {
      final userId = ref.read(localStorageProvider).getInt('userId');
      state = state.copyWith(
        likesCount: r.likedBy!.length,
        dislikesCount: r.dislikedBy!.length,
        isLiked: r.likedBy!.contains(userId),
        isDisliked: r.dislikedBy!.contains(userId),
      );
      return;
    });
  }
}
