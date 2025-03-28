// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/poll/poll.dart';
import 'package:civic_flutter/features/user/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
part 'poll_detail_provider.g.dart';

@riverpod
Future<Poll?> pollDetail(
  Ref ref,
  DraftPoll? draftPoll,
  int id,
) async {
  if (id == 0 && draftPoll == null) {
    final me = ref.read(fetchUserProvider);
    final result = await me(NoParams());
    return result.fold((error) {
      return null;
    }, (currentUser) async {
      return Poll(
        ownerId: currentUser.userInfoId,
        owner: currentUser,
      );
    });
  } else if (id == 0 && draftPoll != null) {
    final me = ref.read(fetchUserProvider);
    final result = await me(NoParams());
    return result.fold((error) {
      return null;
    }, (currentUser) async {
      return PollHelperFunctions.createPollFromDraft(
        draftPoll,
        currentUser,
      );
    });
  } else {
    final retrievePoll = ref.read(getPollProvider);
    final result = await retrievePoll(
      GetPollParams(
        id,
      ),
    );

    return result.fold(
      (error) => null,
      (poll) async {
        if (poll == null) {
          return null;
        }
        final me = ref.read(fetchUserProvider);
        final userRecord = await me(NoParams());
        final owner = userRecord.fold((error) => null, (user) => user);
        if (owner == null) return null;
        return poll.copyWith(
          owner: owner,
        );
      },
    );
  }
}
