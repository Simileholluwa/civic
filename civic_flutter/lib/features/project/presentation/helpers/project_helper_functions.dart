import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

class ProjectHelperFunctions {
  ProjectHelperFunctions._();

  static List<String> getSubcategories(String? selectedCategory) {
    if (selectedCategory == null) return [];
    return projectCategories[selectedCategory]!.toSet().toList();
  }

  static List<String> getFundingSubcategories(String? selectedCategory) {
    if (selectedCategory == null) return [];
    return fundingSources[selectedCategory]!.toSet().toList();
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
            datePickerTheme: DatePickerThemeData(
              surfaceTintColor: Colors.transparent,
              elevation: 4,
              headerBackgroundColor: TColors.primary,
              headerForegroundColor: TColors.textWhite,
              backgroundColor: THelperFunctions.isDarkMode(context)
                  ? TColors.dark
                  : TColors.textWhite,
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

  static Project projectToSend(
    int? postId,
    int ownerId,
    ProjectCreationState projectCreationSate,
  ) {
    return Project(
      id: postId,
      ownerId: ownerId,
      title: projectCreationSate.title,
      description: projectCreationSate.description,
      projectCategory: projectCreationSate.projectCategory,
      projectSubCategory: projectCreationSate.projectSubCategory,
      fundingCategory: projectCreationSate.fundingCategory,
      fundingSubCategory: projectCreationSate.fundingSubCategory,
      startDate: projectCreationSate.startDate,
      endDate: projectCreationSate.endDate,
      physicalLocations: projectCreationSate.physicalLocations,
      manualLocations: projectCreationSate.manualLocations,
      virtualLocations: projectCreationSate.virtualLocations,
      projectVideoUrl: projectCreationSate.projectVideoUrl,
      projectPDFAttachments: projectCreationSate.projectPDFAttachments,
      projectImageAttachments: projectCreationSate.projectImageAttachments,
      status: projectCreationSate.status,
      currency: projectCreationSate.currency,
      projectCost: projectCreationSate.projectCost,
      fundingNote: projectCreationSate.fundingNote,
      completionRate: projectCreationSate.completionRate,
      dateCreated: DateTime.now(),
      likesCount: 0,
      commentsCount: 0,
      repostCount: 0,
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

  static void scrollToActiveIndicator(
    GlobalKey activeIndicatorKey,
    ScrollController scrollController,
    BuildContext context,
  ) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (activeIndicatorKey.currentContext != null) {
        final RenderBox renderBox =
            activeIndicatorKey.currentContext!.findRenderObject() as RenderBox;
        final position = renderBox.localToGlobal(Offset.zero);

        final screenWidth = MediaQuery.of(context).size.width;

        if (position.dx < 0 || position.dx > screenWidth - 50) {
          scrollController.animateTo(
            position.dx,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      }
    });
  }

  static void sendProject(
    WidgetRef ref,
    ProjectCreationState projectCreationSate,
    int id,
    int ownerId,
  ) async {
    await ref.read(sendProjectProvider.notifier).sendProject(
          id != 0
              ? projectToSend(
                  id,
                  ownerId,
                  projectCreationSate,
                )
              : projectToSend(
                  null,
                  0,
                  projectCreationSate,
                ),
        );
  }

  static String humanizeProjectCost(double number) {
    if (number >= 1000000000) {
      return '${(number / 1000000000).toStringAsFixed(2)}B';
    } else if (number >= 1000000) {
      return '${(number / 1000000).toStringAsFixed(2)}M';
    } else if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(2)}K';
    } else {
      return number.toString();
    }
  }

  static String humanizeProjectDuration(DateTime startDate, DateTime endDate) {
    final duration = endDate.difference(startDate);

    // Extracting duration components
    final years = duration.inDays ~/ 365;
    final months = (duration.inDays % 365) ~/ 30;
    final days = (duration.inDays % 365) % 30;

    // Building a human-readable string
    final parts = <String>[];
    if (years > 0) parts.add('$years year${years > 1 ? 's' : ''}');
    if (months > 0) parts.add('$months month${months > 1 ? 's' : ''}');
    if (days > 0) parts.add('$days day${days > 1 ? 's' : ''}');

    return parts.isEmpty ? 'just now' : parts.join(', ');
  }
}
