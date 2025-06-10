//ignore_for_file: avoid_manual_providers_as_generated_provider_dependency

import 'dart:developer';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/poll/poll.dart';
import 'package:civic_flutter/features/user/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'poll_card_provider.g.dart';

@riverpod
class PollCardWidget extends _$PollCardWidget {
  @override
  PollCardState build(Poll poll) {
    return PollCardState.populate(poll, ref);
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

  Future<void> togglePollLikeStatus(int id) async {
    final toggleLike = ref.read(togglePollLikeProvider);
    final result = await toggleLike(
      TogglePollLikeParams(id),
    );
    return result.fold((error) {
      log(error.message);
      return;
    }, (_) async {
      state = state.copyWith(
        isLiked: !state.isLiked,
      );
    });
  }

  Future<bool> togglePollBookmarkStatus(
    int pollId,
  ) async {
    final toggleBookmark = ref.read(togglePollBookmarkProvider);
    final result = await toggleBookmark(
      TogglePollBookmarkParams(
        pollId,
      ),
    );
    return result.fold((error) {
      log(error.message);
      return false;
    }, (_) async {
      state = state.copyWith(
        isBookmarked: !state.isBookmarked,
      );
      return true;
    });
  }

  Future<bool> deletePoll(
    int pollId,
  ) async {
    final deletePollUseCase = ref.read(deletePollProvider);
    final result = await deletePollUseCase(
      DeletePollParams(
        pollId,
      ),
    );
    return result.fold((error) {
      log(error.message);
      TToastMessages.errorToast(error.message);
      return false;
    }, (_) async {
      TToastMessages.infoToast('Poll deleted successfully.');
      ref
          .read(
            paginatedPollListProvider.notifier,
          )
          .removePollById(
            pollId,
          );
      return true;
    });
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

  Future<bool> markPollNotInterested(
    int pollId,
    String reason,
  ) async {
    setIsSendingNotInterested(true);
    final notInterested = ref.read(markPollNotInterestedProvider);
    final result = await notInterested(
      MarkPollNotInterestedParams(
        pollId,
        reason,
      ),
    );
    return result.fold((error) {
      TToastMessages.errorToast(error.message);
      setIsSendingNotInterested(false);
      return false;
    }, (_) async {
      ref
          .read(
            paginatedPollListProvider.notifier,
          )
          .removePollById(
            pollId,
          );
      TToastMessages.infoToast('You will no longer see this poll.');
      setIsSendingNotInterested(false);
      return true;
    });
  }
}
