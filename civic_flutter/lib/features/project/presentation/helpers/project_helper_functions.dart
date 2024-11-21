import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/toasts_messages/toast_messages.dart';
import 'package:civic_flutter/core/widgets/app/app_request_location_permission_dialog.dart';
import 'package:civic_flutter/features/project/presentation/helpers/project_data.dart';
import 'package:civic_flutter/features/project/presentation/pages/project_locations_screen.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class ProjectHelperFunctions {
  ProjectHelperFunctions._();

  static List<String> getSubcategories(String? selectedCategory) {
    if (selectedCategory == null) return [];
    return projectCategories[selectedCategory]!;
  }

  static List<String> getFundingSubcategories(String? selectedCategory) {
    if (selectedCategory == null) return [];
    return fundingSources[selectedCategory]!;
  }

  static List<double> getCustomItemsHeights(List<String> items) {
    final List<double> itemsHeights = [];
    for (int i = 0; i < (items.length * 2) - 1; i++) {
      if (i.isEven) {
        itemsHeights.add(45);
      }
      if (i.isOdd) {
        itemsHeights.add(4);
      }
    }
    return itemsHeights;
  }

  static List<DropdownMenuItem<String>> addDividersAfterItems(
    List<String> items,
    BuildContext context,
  ) {
    final List<DropdownMenuItem<String>> menuItems = [];
    for (final String item in items) {
      menuItems.addAll(
        [
          DropdownMenuItem<String>(
            value: item,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                item,
                style: Theme.of(context).textTheme.bodyMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          //If it's last item, we will not add Divider after it.
          if (item != items.last)
            const DropdownMenuItem<String>(
              enabled: false,
              child: Divider(
                indent: 8,
                endIndent: 10,
              ),
            ),
        ],
      );
    }
    return menuItems;
  }

  static Future<DateTime?> pickProjectStartOrDate(
    BuildContext context,
    String helpText,
  ) async {
    final pickedDate = await showDatePicker(
      context: context,
      switchToInputEntryModeIcon: const Icon(
        Icons.add,
        color: Colors.transparent,
      ),
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2050),
      helpText: helpText,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            datePickerTheme: const DatePickerThemeData(
              surfaceTintColor: Colors.transparent,
              elevation: 4,
              headerBackgroundColor: TColors.primary,
              headerForegroundColor: TColors.textWhite,
            ),
            dialogTheme: const DialogTheme(
              elevation: 10,
            ),
          ),
          child: child!,
        );
      },
    );
    if (pickedDate == null) {
      TToastMessages.infoToast(
        'No date selected',
      );
      return null;
    }
    return pickedDate;
  }

  static Future<bool?> selectLocationBottomSheet({
    required BuildContext context,
    required Project project,
  }) {
    return showModalBottomSheet<bool>(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (context) {
        return ProjectLocationsScreen(
          project: project,
        );
      },
    );
  }

  static Future<void> selectLocation(
    BuildContext context,
    Project project,
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
        selectLocationBottomSheet(context: context, project: project);
      }
    }
  }
}
