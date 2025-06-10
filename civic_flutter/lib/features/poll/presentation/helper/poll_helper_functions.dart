import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/poll/poll.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class PollHelperFunctions {
  PollHelperFunctions._();

  static Future<bool?> selectLocationBottomSheet({
    required BuildContext context,
    required Poll poll,
  }) {
    return showModalBottomSheet<bool>(
      context: context,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * .7,
        minHeight: MediaQuery.sizeOf(context).height * .5,
      ),
      isScrollControlled: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
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
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * .7,
        minHeight: MediaQuery.sizeOf(context).height * .5,
      ),
      isScrollControlled: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
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

  static String formatTimeLeft(DateTime expiresAt) {
    final now = DateTime.now();
    final timeLeft = expiresAt.difference(now);
    if (timeLeft.isNegative) return ' • Poll ended';

    final days = timeLeft.inDays;
    final hours = timeLeft.inHours % 24;
    final minutes = timeLeft.inMinutes % 60;

    if (days > 0) return ' • $days day${days == 1 ? '' : 's'} left';
    if (hours > 0) {
      return ' • $hours hour${hours == 1 ? '' : 's'} ${minutes}m left';
    }
    if (minutes > 0) return ' • $minutes minute${minutes == 1 ? '' : 's'} left';

    return ' • Poll ends soon';
  }
}
