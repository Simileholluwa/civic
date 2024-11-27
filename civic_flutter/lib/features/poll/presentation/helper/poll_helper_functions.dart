import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/poll/poll.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';

class PollHelperFunctions {
  PollHelperFunctions._();

  static double getBottomNavigationBarHeight(
    DateTime? scheduledDateTimeState,
    List<AWSPlaces> selectedLocations,
  ) {
    return scheduledDateTimeState == null && selectedLocations.isEmpty
        ? 105
        : scheduledDateTimeState == null && selectedLocations.isNotEmpty
            ? 155
            : scheduledDateTimeState != null && selectedLocations.isNotEmpty
                ? 205
                : 155;
  }

  static Future<bool?> selectLocationBottomSheet({
    required BuildContext context,
    required Poll poll,
  }) {
    return showModalBottomSheet<bool>(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (context) {
        return PollLocationsScreen(
          poll: poll,
        );
      },
    );
  }

  static Future<bool?> tagUsersBottomSheet(
    BuildContext context,
    Poll poll,
  ) {
    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      showDragHandle: true,
      builder: (context) {
        return PollTagUsersScreen(
          poll: poll,
        );
      },
    );
  }

  static Future<void> selectLocation(
    BuildContext context,
    Poll poll,
  ) async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      TToastMessages.infoToast('Location services are disabled on your device');
    }
    await Geolocator.requestPermission();
    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      if (context.mounted) {
        await appRequestLocationPremissionDialog(context: context);
      }
    } else if (permission == LocationPermission.deniedForever) {
      Geolocator.openLocationSettings();
    } else {
      if (context.mounted) {
        selectLocationBottomSheet(
          context: context,
          poll: poll,
        );
      }
    }
  }

  static Future<bool?> showPollDraftsScreen(BuildContext context) {
    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      showDragHandle: true,
      builder: (context) {
        return const PollDraftsScreen();
      },
    );
  }

  static void sendPoll(
    WidgetRef ref,
    Poll poll,
    int id,
  ) {
    final pollState = ref.watch(pollsOptionsProvider(poll));

    ref.read(sendPollProvider.notifier).sendPollNowOrLater(
          poll: id != 0
              ? createPollFromPollState(
                  pollState,
                  id,
                  poll.ownerId,
                  poll,
                )
              : createPollFromPollState(
                  pollState,
                  null,
                  poll.ownerId,
                  poll,
                ),
        );
  }

  static Future<bool?> deletePollDraftsDialog(
      BuildContext context, WidgetRef ref) {
    return postDialog(
      context: context,
      title: 'Delete all drafts?',
      description: 'Proceed with caution as this action is '
          'irreversible.',
      onTapSkipButton: context.pop,
      activeButtonText: 'Delete all',
      activeButtonLoading: false,
      skipButtonLoading: false,
      skipText: 'Cancel',
      onTapActiveButton: () async {
        context.pop();
        final result =
            await ref.read(pollDraftsProvider.notifier).deleteAllDrafts();
        if (result) {
          if (context.mounted) context.pop();
        }
        TToastMessages.successToast('All drafts was deleted');
      },
    );
  }

  static Poll createPollFromDraft(
    DraftPoll draftPoll,
    UserRecord owner,
  ) {
    return Poll(
      ownerId: owner.userInfo!.id!,
      owner: owner,
      question: draftPoll.question,
      taggedUsers: draftPoll.taggedUsers,
      locations: draftPoll.locations,
      mentions: draftPoll.mentions,
      tags: draftPoll.tags,
      pollDuration: draftPoll.pollDuration,
      options: draftPoll.options,
    );
  }

  static Poll draftPollToSend(DraftPoll draftPoll) {
    return Poll(
      ownerId: 0,
      question: draftPoll.question,
      pollDuration: draftPoll.pollDuration,
      locations: draftPoll.locations,
      taggedUsers: draftPoll.taggedUsers,
      mentions: draftPoll.mentions,
      tags: draftPoll.tags,
      options: PollOption(
        votes: 0,
        voters: [],
        option: draftPoll.options!.option,
      ),
    );
  }

  static DraftPoll createDraftPollFromPoll(Poll poll) {
    return DraftPoll(
      draftId: DateTime.now().millisecondsSinceEpoch,
      options: PollOption(
        option: poll.options!.option,
        votes: 0,
        voters: [],
      ),
      question: poll.question ?? '',
      taggedUsers: poll.taggedUsers ?? [],
      locations: poll.locations ?? [],
      createdAt: DateTime.now(),
      mentions: poll.mentions ?? [],
      tags: poll.tags ?? [],
      pollDuration: poll.pollDuration,
    );
  }

  static Poll createPollFromPollState(
    PollState pollState,
    int? id,
    int ownerId,
    Poll poll,
  ) {
    return Poll(
      id: id,
      ownerId: ownerId,
      question: pollState.question,
      taggedUsers: pollState.taggedUsers,
      locations: pollState.locations,
      mentions: pollState.mentions,
      tags: pollState.tags,
      options: PollOption(
        option: pollState.optionText,
        votes: poll.options?.votes ?? 0,
        voters: poll.options?.voters ?? [],
      ),
      pollDuration: pollState.duration,
    );
  }
}
