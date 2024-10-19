//ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'dart:developer';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/providers/boolean_providers.dart';
import 'package:civic_flutter/core/providers/location_service_provider.dart';
import 'package:civic_flutter/core/providers/mention_hashtag_link_provider.dart';
import 'package:civic_flutter/core/providers/scheduled_datetime_provider.dart';
import 'package:civic_flutter/core/providers/tag_selections_provider.dart';
import 'package:civic_flutter/core/toasts_messages/toast_messages.dart';
import 'package:civic_flutter/core/usecases/usecase.dart';
import 'package:civic_flutter/features/poll/domain/usecases/save_in_future_use_case.dart';
import 'package:civic_flutter/features/poll/domain/usecases/save_poll_use_case.dart';
import 'package:civic_flutter/features/poll/presentation/providers/poll_draft_provider.dart';
import 'package:civic_flutter/features/poll/presentation/providers/poll_provider.dart';
import 'package:civic_flutter/features/poll/presentation/providers/poll_service_providers.dart';
import 'package:civic_flutter/features/post/presentation/provider/post_text_provider.dart';
import 'package:civic_flutter/features/profile/presentation/provider/profile_provider.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'poll_send_provider.g.dart';

@riverpod
class SendPoll extends _$SendPoll {
  @override
  void build() {}

  Future<void> saveFailedPostAsDraft(
    String errorMessage,
  ) async {
    final draftPoll = DraftPoll(
      draftId: DateTime.now().millisecondsSinceEpoch,
      options: PollOption(
        option: ref.watch(pollsOptionsProvider).optionText,
        votes: 0,
        voters: [],
      ),
      question: ref.watch(postTextProvider).text,
      taggedUsers: ref.watch(tagSelectionsProvider),
      locations: ref.watch(selectLocationsProvider),
      createdAt: DateTime.now(),
      mentions: ref.watch(selectedMentionsProvider),
      tags: ref.watch(hashtagsProvider),
      pollDuration: ref.watch(pollsOptionsProvider).duration.inDays,
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
      SavePollInFutureParams(
        poll,
        scheduledDatetime!,
      ),
    );
    return send.fold((l) async {
      log(l.message);
      ref.read(sendPostLoadingProvider.notifier).setValue(false);
      await saveFailedPostAsDraft(
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
        poll,
      ),
    );

    return send.fold((l) async {
      log(l.message);
      ref.read(sendPostLoadingProvider.notifier).setValue(false);
      await saveFailedPostAsDraft(
        l.message,
      );
      return false;
    }, (r) async {
      TToastMessages.successToast('Your poll has been sent!');
      ref.read(sendPostLoadingProvider.notifier).setValue(false);

      return true;
    });
  }

  Future<bool> sendPollNowOrFuture({
    required String question,
    required List<AWSPlaces> locations,
    required List<UserRecord> taggedUsers,
    required List<UserRecord> mentions,
    required List<String> tags,
    required Duration pollDuration,
    required List<String> option,
  }) async {
    ref.read(sendPostLoadingProvider.notifier).setValue(true);
    final me = ref.read(meUseCaseProvider);
    final userRecord = await me(NoParams());

    return userRecord.fold((error) async {
      log(error.message);
      ref.read(sendPostLoadingProvider.notifier).setValue(false);
      await saveFailedPostAsDraft(
        error.message,
      );
      return false;
    }, (record) async {
      final scheduledDatetime = ref.read(postScheduledDateTimeProvider);
      final pollToSend = Poll(
        ownerId: record.id!,
        owner: record,
        question: question,
        taggedUsers: taggedUsers,
        locations: locations,
        mentions: mentions,
        options: PollOption(
          option: option,
          votes: 0,
          voters: [],
        ),
        tags: tags,
        pollDuration: DateTime.now().add(
          pollDuration,
        ),
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
