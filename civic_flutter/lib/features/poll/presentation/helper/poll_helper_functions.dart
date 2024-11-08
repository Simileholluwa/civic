import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/toasts_messages/toast_messages.dart';
import 'package:civic_flutter/core/widgets/app/app_request_location_permission_dialog.dart';
import 'package:civic_flutter/core/widgets/create_content/create_content_dialog.dart';
import 'package:civic_flutter/features/poll/presentation/pages/poll_drafts_screen.dart';
import 'package:civic_flutter/features/poll/presentation/pages/poll_locations_screen.dart';
import 'package:civic_flutter/features/poll/presentation/pages/poll_tag_users_screen.dart';
import 'package:civic_flutter/features/poll/presentation/providers/poll_draft_provider.dart';
import 'package:civic_flutter/features/poll/presentation/providers/poll_provider.dart';
import 'package:civic_flutter/features/poll/presentation/providers/poll_send_provider.dart';
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
        return PollLocationsScreen(poll: poll,);
      },
    );
  }

  static Future<bool?> tagUsersBottomSheet(BuildContext context, Poll poll,) {
    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      showDragHandle: true,
      builder: (context) {
        return PollTagUsersScreen(poll: poll,);
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
        selectLocationBottomSheet(context: context, poll: poll,);
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
  ) {
    final pollState = ref.watch(pollsOptionsProvider(poll));
    final canSendPoll = pollState.question.isNotEmpty &&
        pollState.optionText.every((text) => text.isNotEmpty);
    if (canSendPoll) {
      ref.read(sendPollProvider.notifier).send(
            poll: poll,
          );
    }
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
}