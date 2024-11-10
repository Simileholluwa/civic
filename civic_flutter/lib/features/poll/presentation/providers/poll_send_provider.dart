//ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'dart:developer';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/providers/boolean_providers.dart';
import 'package:civic_flutter/core/providers/scheduled_datetime_provider.dart';
import 'package:civic_flutter/core/toasts_messages/toast_messages.dart';
import 'package:civic_flutter/core/usecases/usecase.dart';
import 'package:civic_flutter/features/poll/domain/usecases/schedule_poll__use_case.dart';
import 'package:civic_flutter/features/poll/domain/usecases/save_poll_use_case.dart';
import 'package:civic_flutter/features/poll/presentation/providers/poll_draft_provider.dart';
import 'package:civic_flutter/features/poll/presentation/providers/poll_service_providers.dart';
import 'package:civic_flutter/features/profile/presentation/provider/profile_provider.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'poll_send_provider.g.dart';

@riverpod
class SendPoll extends _$SendPoll {
  @override
  void build() {}

  Future<void> saveFailedPollAsDraft(
    Poll poll,
    String errorMessage,
  ) async {
    final draftPoll = DraftPoll(
      draftId: DateTime.now().millisecondsSinceEpoch,
      options: PollOption(
        option: poll.options!.option,
        votes: 0,
        voters: [],
      ),
      question: poll.question,
      taggedUsers: poll.taggedUsers,
      locations: poll.locations,
      createdAt: DateTime.now(),
      mentions: poll.mentions,
      tags: poll.tags,
      pollDuration: poll.pollDuration,
    );
    final draftPollProvider = ref.read(pollDraftsProvider.notifier);
    final result = await draftPollProvider.saveDraftPoll(
      draftPoll,
    );
    if (result) {
      TToastMessages.errorToast(
        '$errorMessage. Your post was saved to drafts.',
      );
    }
  }

  Future<bool> sendPollInFuture({required Poll poll}) async {
    final sendPollInFuture = ref.read(savePollInFutureProvider);
    final scheduledDatetime = ref.read(postScheduledDateTimeProvider);
    final scheduledDatetimeProvider = ref.read(
      postScheduledDateTimeProvider.notifier,
    );
    final send = await sendPollInFuture(
      SchedulePollParams(
        poll.copyWith(
          createdAt: scheduledDatetime!,
        ),
        scheduledDatetime,
      ),
    );
    return send.fold((l) async {
      log(l.message);
      ref.read(sendPostLoadingProvider.notifier).setValue(false);
      await saveFailedPollAsDraft(
        poll,
        l.message,
      );
      return false;
    }, (r) {
      TToastMessages.successToast(
        'Your poll will be sent on ${scheduledDatetimeProvider.humanizeDateTimeForSend()}',
      );
      ref.read(sendPostLoadingProvider.notifier).setValue(false);
      return true;
    });
  }

  Future<bool> sendPoll({
    required Poll poll,
  }) async {
    final savePoll = ref.read(savePollProvider);
    final send = await savePoll(
      SavePollParams(
        poll.copyWith(
          createdAt: DateTime.now(),
        ),  
      ),
    );

    return send.fold((l) async {
      log(l.message);
      ref.read(sendPostLoadingProvider.notifier).setValue(false);
      await saveFailedPollAsDraft(
        poll,
        l.message,
      );
      return false;
    }, (r) async {
      TToastMessages.successToast('Your poll has been sent!');
      ref.read(sendPostLoadingProvider.notifier).setValue(false);

      return true;
    });
  }

  Future<bool> send({
    required Poll poll,
  }) async {
    ref.read(sendPostLoadingProvider.notifier).setValue(true);
    final me = ref.read(meUseCaseProvider);
    final userRecord = await me(NoParams());

    return userRecord.fold((error) async {
      log(error.message);
      ref.read(sendPostLoadingProvider.notifier).setValue(false);
      await saveFailedPollAsDraft(
        poll,
        error.message,
      );
      return false;
    }, (record) async {
      final scheduledDatetime = ref.read(postScheduledDateTimeProvider);
      final pollToSend = poll.copyWith(
        owner: record,
      );
      if (scheduledDatetime == null) {
        return await sendPoll(
          poll: pollToSend,
        );
      } else {
        return await sendPollInFuture(
          poll: pollToSend,
        );
      }
    });
  }
}
