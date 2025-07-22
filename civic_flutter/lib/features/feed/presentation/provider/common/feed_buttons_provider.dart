//ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'dart:developer';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:civic_flutter/features/user/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'feed_buttons_provider.g.dart';

@Riverpod(keepAlive: true)
class FeedButtons extends _$FeedButtons {
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

  void setIsSendingPoll(bool value) {
    state = state.copyWith(
      isSendingPoll: value,
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
            .read(paginatedRepliesListProvider(originalPostId).notifier)
            .removeReplyById(postId);
        TToastMessages.infoToast('You will no longer see this reply.');
      } else if (isComment) {
        ref
            .read(paginatedCommentListProvider(originalPostId).notifier)
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

  Future<void> subscribeToNotifications(int postId) async {
    final subscribeToNotif = ref.read(subscribeToNotifProvider);
    final result = await subscribeToNotif(
      SubscribeToNotifParams(postId),
    );
    return result.fold((error) {
      log(error.message);
      TToastMessages.errorToast(
        'Subscription failed. Please try again.',
      );
    }, (success) {
      if (!state.isSubscribed) {
        TToastMessages.successToast(
          'You will now receive notifications on this post.',
        );
      } else {
        TToastMessages.infoToast(
          'You will no longer receive notifications on this post.',
        );
      }
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
        paginatedCommentListProvider(postId).notifier,
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
    bool isPoll,
    bool isArticle,
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
            .read(
              paginatedRepliesListProvider(
                originalPostId,
              ).notifier,
            )
            .removeReplyById(
              postId,
            );
        TToastMessages.infoToast('Your reply has been deleted.');
      } else if (isComment) {
        ref
            .read(
              paginatedCommentListProvider(
                originalPostId,
              ).notifier,
            )
            .removeCommentById(
              postId,
            );
        TToastMessages.infoToast('Your comment has been deleted.');
      } else if (isPoll) {
        ref
            .watch(
              paginatedPollListProvider.notifier,
            )
            .removePollById(
              postId,
            );
        TToastMessages.infoToast('Your poll has been deleted.');
      } else if (isArticle) {
        ref
            .watch(
              paginatedArticleListProvider.notifier,
            )
            .removeArticleById(
              postId,
            );
        TToastMessages.infoToast('Your article has been deleted.');
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

  Future<void> toggleFollow(int userId, String username) async {
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
        TToastMessages.infoToast('You are no longer following $username.');
      } else {
        state = state.copyWith(
          isFollower: true,
        );
        TToastMessages.infoToast('You are now following $username.');
      }
    }
  }

  Future<bool> castVote(
    int pollId,
    int optionId,
  ) async {
    if (state.pollEnded) {
      TToastMessages.errorToast('This poll has ended.');
      return false;
    }
    setIsSendingPoll(true);
    final castVote = ref.read(castVoteProvider);
    final result = await castVote(
      CastVoteParams(
        pollId,
        optionId,
      ),
    );
    return result.fold((error) {
      log(error.message);
      setIsSendingPoll(false);
      TToastMessages.errorToast(error.message);
      return false;
    }, (_) async {
      setIsSendingPoll(false);
      return true;
    });
  }

  @override
  FeedWidgetsState build(Post? post) {
    if (post == null) {
      return FeedWidgetsState.empty();
    }
    return FeedWidgetsState.populate(post, ref);
  }
}
