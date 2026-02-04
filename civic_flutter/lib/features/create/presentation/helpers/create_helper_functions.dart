import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/create/create.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class CreateHelperFunctions {
  CreateHelperFunctions._();

  static Future<bool?> selectLocationBottomSheet({
    required BuildContext context,
    required Post post,
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
        return LocationsScreen(
          post: post,
        );
      },
    );
  }

  static Future<void> selectLocation(
    BuildContext context,
    Post post,
  ) async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      TToastMessages.infoToast(TTexts.locationServicesDisabled);
    }
    await Geolocator.requestPermission();
    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      if (context.mounted) {
        await appRequestLocationPremissionDialog(context: context);
      }
    } else if (permission == LocationPermission.deniedForever) {
      await Geolocator.openLocationSettings();
    } else {
      if (context.mounted) {
        await selectLocationBottomSheet(
          context: context,
          post: post,
        );
      }
    }
  }

  static Future<bool?> tagUsersBottomSheet({
    required BuildContext context,
    required Post post,
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
        return TagUsersScreen(
          post: post,
        );
      },
    );
  }
}
