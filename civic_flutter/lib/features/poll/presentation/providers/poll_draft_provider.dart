// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/poll/poll.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'poll_draft_provider.g.dart';

@riverpod
class PollDrafts extends _$PollDrafts {
  @override
  List<DraftPoll> build() {
    final retrieveDraftPoll = ref.read(getDraftsPollProvider);
    final result = retrieveDraftPoll(
      NoParams(),
    );

    return result.fold(
      (error) => <DraftPoll>[],
      (draftPoll) {
        if (draftPoll == null) {
          return state = <DraftPoll>[];
        } else {
          return state = draftPoll;
        }
      },
    );
  }

  Future<bool> deleteAllDrafts() async {
    final deleteAll = ref.read(deleteDraftsPollProvider);
    final result = await deleteAll(
      NoParams(),
    );
    return result.fold(
      (error) {
        TToastMessages.errorToast(
          error.message,
        );
        return false;
      },
      (r) {
        state = <DraftPoll>[];
        return true;
      },
    );
  }

  Future<bool> saveDraftPoll(DraftPoll draftPoll) async {
    final saveDraft = ref.read(saveDraftPollProvider);
    final result = await saveDraft(
      SaveDraftPollParams(
        draftPoll,
      ),
    );

    return result.fold((error) {
      TToastMessages.errorToast(
        error.message,
      );
      return false;
    }, (r) {
      return true;
    });
  }

  Future<bool> deleteDraftById(
    DraftPoll draftPoll,
    int index,
  ) async {
    final deleteDraft = ref.read(deleteDraftPollProvider);
    final result = await deleteDraft(
      DeleteDraftPollParams(
        draftPoll,
      ),
    );

    return result.fold((error) {
      TToastMessages.errorToast(
        error.message,
      );
      return false;
    }, (r) {
      var drafts = state;
      drafts.removeAt(index);

      state = [...drafts];
      return true;
    });
  }

  Future<void> sendDraftPoll(
    DraftPoll draftPoll,
    int index,
  ) async {
    final result = await ref.read(sendPollProvider.notifier).sendPollNowOrLater(
          poll: PollHelperFunctions.draftPollToSend(
            draftPoll,
          ),
        );

    if (result) {
      await deleteDraftById(
        draftPoll,
        index,
      );
    }
  }
}
