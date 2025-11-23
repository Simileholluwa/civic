import 'dart:async';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:civic_flutter/features/network/network.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feed_buttons_provider.g.dart';

enum PostKind { post, comment, reply, poll, article, projectRepost }

class DeleteContext {
  const DeleteContext({
    required this.postId,
    required this.kind,
    this.parentId,
  });
  final int postId;
  final PostKind kind;

  final int? parentId;
  bool get hasParent => parentId != null;
}

@Riverpod(keepAlive: true)
class FeedButtons extends _$FeedButtons {
  Post? _post;
  Poll? _poll;
  StreamSubscription<PostCounts>? _countsSub;
  StreamSubscription<PollCounts>? _pollCountsSub;
  bool _didInit = false;

  void _subscribeCounts() {
    final postId = _post?.id;
    if (postId == null) return;
    _countsSub = ref
        .read(clientProvider)
        .post
        .postCountsUpdates(postId)
        .listen((counts) {
      state = state.applyCounts(counts);
    });
    ref.onDispose(() => _countsSub?.cancel());
  }

  void _subscribePollCounts() {
    final pollId = _poll?.id;
    if (pollId == null) return;
    _pollCountsSub = ref
        .read(clientProvider)
        .post
        .pollCountsUpdates(pollId)
        .listen((counts) {
      state = state.applyPollCounts(counts);
    });
    ref.onDispose(() => _pollCountsSub?.cancel());
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

  void setIsSendingPoll(bool value) {
    state = state.copyWith(
      isSendingPoll: value,
    );
  }

  Future<void> togglePostLikeStatus(int id) async {
    final currentlyLiked = state.hasLiked;
    state = state.copyWith(
      hasLiked: !currentlyLiked,
    );
    final toggleLike = ref.read(togglePostLikeProvider);
    final result = await toggleLike(
      TogglePostLikeParams(id),
    );
    return result.fold(
      (error) {
        state = state.copyWith(
          hasLiked: currentlyLiked,
        );
      },
      (_) {},
    );
  }

  Future<void> togglePostBookmarkStatus(
    int postId,
    bool isBookmarked,
  ) async {
    final currentBookmarked = state.hasBookmarked;
    state = state.copyWith(
      hasBookmarked: !currentBookmarked,
    );
    if (isBookmarked) {
      ref
          .read(
            paginatedPostBookmarkListProvider.notifier,
          )
          .removePostById(
            postId,
          );
    } else {
      ref
          .read(
            paginatedPostBookmarkListProvider.notifier,
          )
          .addPost(
            PostWithUserState(
              post: _post!,
              hasLiked: state.hasLiked,
              hasBookmarked: state.hasBookmarked,
              isSubscribed: state.isSubscribed,
              isFollower: state.isFollower,
              selectedPollOptionId: state.votedOption?.id,
            ),
          );
    }
    final toggleBookmark = ref.read(togglePostBookmarkProvider);
    final result = await toggleBookmark(
      TogglePostBookmarkParams(
        postId,
      ),
    );
    return result.fold(
      (error) {
        state = state.copyWith(
          hasBookmarked: currentBookmarked,
        );
        return;
      },
      (_) async {},
    );
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

  Future<bool> deletePost(DeleteContext ctx) async {
    if (state.isDeleting) return false;
    state = state.copyWith(isDeleting: true);
    var rollback = () {};
    switch (ctx.kind) {
      case PostKind.reply:
        if (ctx.hasParent) {
          final notifier = ref.read(
            paginatedRepliesListProvider(
              ctx.parentId!,
            ).notifier,
          );
          final removed = _post;
          notifier.removeReplyById(ctx.postId);
          rollback = () {
            if (removed != null) {
              notifier.addReply(
                PostWithUserState(
                  post: removed,
                  hasLiked: state.hasLiked,
                  hasBookmarked: state.hasBookmarked,
                  isSubscribed: state.isSubscribed,
                  isFollower: state.isFollower,
                  selectedPollOptionId: state.votedOption?.id,
                ),
              );
            }
          };
        }
      case PostKind.comment:
        if (ctx.hasParent) {
          final notifier = ref.read(
            paginatedCommentListProvider(
              ctx.parentId!,
            ).notifier,
          );
          final removed = _post;
          notifier.removeCommentById(ctx.postId);
          rollback = () {
            if (removed != null) {
              notifier.addComment(
                PostWithUserState(
                  post: removed,
                  hasLiked: state.hasLiked,
                  hasBookmarked: state.hasBookmarked,
                  isSubscribed: state.isSubscribed,
                  isFollower: state.isFollower,
                  selectedPollOptionId: state.votedOption?.id,
                ),
              );
            }
          };
        }
      case PostKind.poll:
      case PostKind.article:
      case PostKind.post:
      case PostKind.projectRepost:
        final postNotifier = ref.read(
          paginatedPostListProvider.notifier,
        );
        final removed = _post;
        postNotifier.removePostById(ctx.postId);
        rollback = () {
          if (removed != null) {
            postNotifier.addPost(
              PostWithUserState(
                post: removed,
                hasLiked: state.hasLiked,
                hasBookmarked: state.hasBookmarked,
                isSubscribed: state.isSubscribed,
                isFollower: state.isFollower,
                selectedPollOptionId: state.votedOption?.id,
              ),
            );
          }
        };
    }

    final deletePostUseCase = ref.read(deletePostProvider);
    final result = await deletePostUseCase(
      DeletePostParams(
        ctx.postId,
      ),
    );
    return result.fold((error) {
      rollback();
      state = state.copyWith(isDeleting: false);
      TToastMessages.errorToast(error.message);
      return false;
    }, (_) {
      switch (ctx.kind) {
        case PostKind.reply:
          TToastMessages.infoToast('Your reply has been deleted.');
        case PostKind.comment:
          TToastMessages.infoToast('Your comment has been deleted.');
        case PostKind.poll:
          TToastMessages.infoToast('Your poll has been deleted.');
        case PostKind.article:
          TToastMessages.infoToast('Your article has been deleted.');
        case PostKind.post:
        case PostKind.projectRepost:
          TToastMessages.infoToast('Your post has been deleted.');
      }
      state = state.copyWith(isDeleting: false);
      return true;
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
      setIsSendingPoll(false);
      TToastMessages.errorToast(error.message);
      return false;
    }, (_) async {
      setIsSendingPoll(false);
      return true;
    });
  }

  @override
  FeedWidgetsState build(PostWithUserStateKey? key) {
    if (key == null) return FeedWidgetsState.empty();
    final postUserState = key.value;
    _post = postUserState.post;
    _poll = postUserState.post.poll;
    final base = FeedWidgetsState.populate(postUserState);
    if (!_didInit) {
      _didInit = true;
      _subscribeCounts();
      _subscribePollCounts();
      return base;
    }
    final preserved = base.copyWith(
      hasLiked: state.hasLiked,
      hasBookmarked: state.hasBookmarked,
      isSubscribed: state.isSubscribed,
      isFollower: state.isFollower,
      hasVoted: state.hasVoted,
      votedOption: state.votedOption,
    );
    _subscribeCounts();
    _subscribePollCounts();
    return preserved;
  }
}
