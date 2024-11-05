import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/toasts_messages/toast_messages.dart';
import 'package:civic_flutter/core/widgets/app/app_request_location_permission_dialog.dart';
import 'package:civic_flutter/core/widgets/create_content/create_content_select_media_dialog.dart';
import 'package:civic_flutter/features/post/presentation/pages/post_locations_screen.dart';
import 'package:civic_flutter/features/post/presentation/pages/post_tag_users_screen.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class PostHelperFunctions {
  PostHelperFunctions._();

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
    required Post post,
  }) {
    return showModalBottomSheet<bool>(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (context) {
        return PostLocationsScreen(post: post,);
      },
    );
  }

  static Future<bool?> tagUsersBottomSheet(BuildContext context, Post post,) {
    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      showDragHandle: true,
      builder: (context) {
        return PostTagUsersScreen(post: post,);
      },
    );
  }

  static Future<void> selectLocation(
    BuildContext context,
    Post post,
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
        selectLocationBottomSheet(context: context, post: post);
      }
    }
  }

  static Future<bool?> showSelectMediaDialog(
    BuildContext context,
    Post post,
  ) {
    return createContentSelectMediaDialog(
      context,
      post,
    );
  }
}