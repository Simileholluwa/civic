//ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'dart:developer';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'post_card_provider.g.dart';

@riverpod
class PostCardWidget extends _$PostCardWidget {
  @override
  PostCardState build(Post? post) {
    if (post == null) {
      return PostCardState.initial();
    }
    return PostCardState.populate(post, ref);
  }

  Future<void> togglePostLikeStatus(int id) async {
    final toggleLike = ref.read(togglePostLikeProvider);
    final result = await toggleLike(
      TogglePostLikeParams(id),
    );
    return result.fold((error) {
      log(error.message);
      return; 
    }, (likesCount) async {
      final likedPosts = ref.read(getUserLikedPostsProvider);
      final result = await likedPosts(
        NoParams(),
      );
      result.fold((error) {
        log(error.message);
      }, (isLiked) {
        state = state.copyWith(
          numberOfLikes: likesCount.toString(),
          hasLiked: isLiked.contains(id),
          hasLikes: likesCount > 0,
        );
      });
      return;
    });
  }
}
