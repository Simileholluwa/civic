//ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'dart:developer';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:civic_flutter/features/user/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'post_card_provider.g.dart';

@Riverpod(keepAlive: true)
class PostCardWidget extends _$PostCardWidget {
  @override
  PostCardState build(Post? post) {
    if (post == null) {
      return PostCardState.empty();
    }
    return PostCardState.populate(post, ref);
  }

  Future<void> toggleFollow(int userId, String username,) async {
    final userNotifier = ref.watch(
      currentActiveUserProvider.notifier,
    );
    final result = await userNotifier.toggleFollow(
      userId,
    );
    if (result) {
      final isFollower = state.isFollower;
      if (isFollower) {
        state = state.copyWith(
          isFollower: false,
        );
        TToastMessages.infoToast('You are no longer following.');
      } else {
        state = state.copyWith(
          isFollower: true,
        );
        TToastMessages.infoToast('You are now following.');
      }
    }
  }

  void setReasonNotInterested(String reason) {
    state = state.copyWith(
      reasonNotInterested: reason,
    );
  }

  void setIsSendingNotInterested(bool value) {
    state = state.copyWith(
      isSendingNotInterested: value,
    );
  }

  Future<void> togglePostLikeStatus(int id) async {
    final toggleLike = ref.read(togglePostLikeProvider);
    final result = await toggleLike(
      TogglePostLikeParams(id),
    );
    return result.fold((error) {
      log(error.message);
      return;
    }, (_) async {
      state = state.copyWith(
        hasLiked: !state.hasLiked,
      );
    });
  }

  Future<bool> togglePostBookmarkStatus(
    int postId,
  ) async {
    final toggleBookmark = ref.read(togglePostBookmarkProvider);
    final result = await toggleBookmark(
      TogglePostBookmarkParams(
        postId,
      ),
    );
    return result.fold((error) {
      log(error.message);
      return false;
    }, (_) async {
      state = state.copyWith(
        hasBookmarked: !state.hasBookmarked,
      );
      return true;
    });
  }

  Future<bool> markPostNotInterested(
    int postId,
    String reason,
    int originalPostId,
    bool isReply,
    bool isComment,
  ) async {
    setIsSendingNotInterested(true);
    final notInterested = ref.read(markPostNotInterestedProvider);
    final result = await notInterested(
      MarkPostNotInterestedParams(
        postId,
        reason,
      ),
    );
    return result.fold((error) {
      TToastMessages.errorToast(error.message);
      setIsSendingNotInterested(false);
      return false;
    }, (_) async {
      if (isReply) {
        ref
            .read(paginatedPostCommentRepliesListProvider(originalPostId)
                .notifier)
            .removeReplyById(postId);
        TToastMessages.infoToast('You will no longer see this reply.');
      } else if (isComment) {
        ref
            .read(paginatedPostCommentListProvider(originalPostId).notifier)
            .removeCommentById(postId);
        TToastMessages.infoToast('You will no longer see this comment.');
      } else {
        ref
            .read(
              paginatedPostListProvider.notifier,
            )
            .removePostById(
              postId,
            );
        TToastMessages.infoToast('You will no longer see this post.');
      }
      setIsSendingNotInterested(false);
      return true;
    });
  }

  Future<void> saveComment(Post comment, int postId) async {
    final saveComment = ref.read(savePostCommentProvider);
    final result = await saveComment(
      SavePostCommentParams(
        comment,
        false,
      ),
    );
    result.fold((l) {
      log(l.message);
    }, (r) {
      final commentPagingControllerNotifier = ref.watch(
        paginatedPostCommentListProvider(postId).notifier,
      );
      if (commentPagingControllerNotifier.pagingController.itemList != null) {
        commentPagingControllerNotifier.addComment(r!);
      }
    });
  }

  Future<void> deletePost(
    int postId,
    int originalPostId,
    bool isReply,
    bool isComment,
  ) async {
    final deleteProject = ref.read(deletePostProvider);
    final result = await deleteProject(
      DeletePostParams(
        postId,
      ),
    );
    return result.fold((error) async {
      TToastMessages.errorToast(
        error.message,
      );
      return;
    }, (_) {
      if (isReply) {
        ref
            .read(paginatedPostCommentRepliesListProvider(originalPostId)
                .notifier)
            .removeReplyById(postId);
        TToastMessages.infoToast('Your reply has been deleted.');
      } else if (isComment) {
        ref
            .read(paginatedPostCommentListProvider(originalPostId).notifier)
            .removeCommentById(postId);
        TToastMessages.infoToast('Your comment has been deleted.');
      } else {
        ref
            .watch(
              paginatedPostListProvider.notifier,
            )
            .removePostById(
              postId,
            );
        TToastMessages.infoToast('Your post has been deleted.');
      }
      return;
    });
  }
}
