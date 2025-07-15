import 'dart:math';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

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
    DateTime? initialDate,
    DateTime? firstDate,
  ) async {
    final pickedDate = await showDatePicker(
      context: context,
      switchToInputEntryModeIcon: const Icon(
        Icons.add,
        color: Colors.transparent,
      ),
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(2010),
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

  static String percentageElapsed(DateTime startDate, DateTime endDate) {
    DateTime currentDate = DateTime.now();

    if (currentDate.isBefore(startDate)) {
      return 'Not started';
    }

    if (currentDate.isAfter(endDate)) {
      return 'Completed';
    }

    int totalDays = endDate.difference(startDate).inDays;
    int daysPassed = currentDate.difference(startDate).inDays;

    double percentagePassed = (daysPassed / totalDays) * 100;
    return '${percentagePassed.toStringAsFixed(2)}% complete';
  }

  static String percentageElapsedInString(
      DateTime startDate, DateTime endDate) {
    DateTime currentDate = DateTime.now();

    if (currentDate.isBefore(startDate)) {
      return '0%';
    }

    if (currentDate.isAfter(endDate)) {
      return '100%';
    }

    int totalDays = endDate.difference(startDate).inDays;
    int daysPassed = currentDate.difference(startDate).inDays;

    double percentagePassed = (daysPassed / totalDays) * 100;
    return '${percentagePassed.toStringAsFixed(1)}%';
  }

  static double percentageElapsedInDouble(
      DateTime startDate, DateTime endDate) {
    DateTime currentDate = DateTime.now();

    if (currentDate.isBefore(startDate)) {
      return 0;
    }

    if (currentDate.isAfter(endDate)) {
      return 1;
    }

    int totalDays = endDate.difference(startDate).inDays;
    int daysPassed = currentDate.difference(startDate).inDays;

    double percentagePassed = (daysPassed / totalDays);
    return percentagePassed;
  }

  static bool canVet(DateTime startDate, DateTime endDate) {
    DateTime currentDate = DateTime.now();

    if (currentDate.isBefore(startDate)) {
      return false;
    } else if (currentDate.isAfter(endDate)) {
      return true;
    } else {
      return false;
    }
  }

  static String formatNumber(double number) {
    final formatter = NumberFormat("#,###");
    return formatter.format(number);
  }

  static selectLocationBottomSheet({
    required BuildContext context,
    required Project project,
  }) {
    return showModalBottomSheet(
      context: context,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * .7,
        minHeight: MediaQuery.sizeOf(context).height * .5,
      ),
      isScrollControlled: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      builder: (context) {
        return ProjectLocationsScreen(
          project: project,
        );
      },
    );
  }

  static Future<dynamic> deleteProjectBottomSheet(
    BuildContext context,
    Project project,
    bool fromDetails,
  ) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        return Consumer(builder: (context, ref, child) {
          final projectCardState = ref.watch(
            projectCardWidgetProvider(
              project,
            ),
          );
          final projectCardNotifier = ref.watch(
            projectCardWidgetProvider(
              project,
            ).notifier,
          );
          return Scaffold(
            body: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 15,
                children: [
                  Icon(
                    Iconsax.trash,
                    color: Colors.red,
                    size: 50,
                  ),
                  Text(
                    'Delete this Project?',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          fontSize: 30,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Kindly take note of the following information associated with deleting a project.',
                    style: Theme.of(context).textTheme.labelMedium!,
                    textAlign: TextAlign.center,
                  ),
                  Divider(
                    height: 0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 15,
                    children: [
                      ProjectDeleteConsequences(
                        number: '1.',
                        consequence:
                            "Deleting a project can impact your credibility score based on users' engagement level.",
                      ),
                      ProjectDeleteConsequences(
                        number: '2.',
                        consequence:
                            "All user engagements will be retained, but no further interactions will be allowed.",
                      ),
                      ProjectDeleteConsequences(
                        number: '3.',
                        consequence:
                            "Deleted projects will be visible on the feed.",
                      ),
                      ProjectDeleteConsequences(
                        number: '4.',
                        consequence:
                            "To restore a deleted project, a fee will be required.",
                      ),
                      ProjectDeleteConsequences(
                        number: '5.',
                        consequence:
                            "Permanent deletion requires a fee and a popular vote.",
                      ),
                      GestureDetector(
                        onTap: () {
                          projectCardNotifier.toggleCanDelete();
                        },
                        child: Row(
                          spacing: 15,
                          children: [
                            SizedBox(
                              height: 20,
                              width: 20,
                              child: Checkbox(
                                value: projectCardState.canDelete,
                                onChanged: (_) {
                                  projectCardNotifier.toggleCanDelete();
                                },
                              ),
                            ),
                            Text(
                              'I understand and confirm the above',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 50,
                    child: FilledButton(
                      onPressed: projectCardState.canDelete!
                          ? () {
                              context.pop();
                              if (fromDetails) {
                                context.pop();
                              }
                              ref
                                  .read(
                                    projectCardWidgetProvider(project).notifier,
                                  )
                                  .deleteProject(
                                    project.id!,
                                  );
                            }
                          : null,
                      style: ButtonStyle().copyWith(
                        backgroundColor: WidgetStatePropertyAll(
                          projectCardState.canDelete!
                              ? Colors.red
                              : Theme.of(context).disabledColor,
                        ),
                      ),
                      child: const Text(
                        'Delete',
                      ),
                    ).withLoading(
                      loading: false,
                    ),
                  ),
                  TextButton(
                    onPressed: context.pop,
                    child: Text(
                      'Cancel',
                    ),
                  ),
                ],
              ),
            ),
          );
        });
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

  static Future<Position> getDevicePosition() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      TToastMessages.infoToast('Location services are disabled on your device');
      throw Exception("Location services are disabled.");
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        TToastMessages.infoToast('Please enable location services.');
        throw Exception("Location permissions are denied.");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Geolocator.openLocationSettings();
      throw Exception("Location services are denied forever.");
    }

    return await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(
        accuracy: LocationAccuracy.high,
      ),
    );
  }

  static double calculateDistance(
    double lat1,
    double lon1,
    double lat2,
    double lon2,
  ) {
    const earthRadius = 6371000;
    double dLat = _degreesToRadians(lat2 - lat1);
    double dLon = _degreesToRadians(lon2 - lon1);

    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_degreesToRadians(lat1)) *
            cos(_degreesToRadians(lat2)) *
            sin(dLon / 2) *
            sin(dLon / 2);

    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return earthRadius * c;
  }

  static double _degreesToRadians(double degrees) {
    return degrees * pi / 180;
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

        final screenWidth = MediaQuery.sizeOf(context).width;

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

  static Future<bool?> deleteProjectReviewDialog(BuildContext context,
      ProjectReviewProvider projectReviewNotifier, int projectId, int reviewId,
      [bool shouldPop = true]) {
    return postDialog(
      context: context,
      title: 'Delete review?',
      description: 'Proceed with caution as this action is '
          'irreversible.',
      onTapSkipButton: context.pop,
      activeButtonText: 'Delete',
      activeButtonLoading: false,
      skipButtonLoading: false,
      skipText: 'Cancel',
      onTapActiveButton: () async {
        context.pop();
        final result = await projectReviewNotifier.deleteReview(
          projectId,
          reviewId,
        );
        if (shouldPop) {
          if (result) {
            if (context.mounted) context.pop();
          }
        }
      },
    );
  }

  static Future<bool?> deleteProjectVettingDialog(
      BuildContext context, ProjectVet projectVettingNotifier, int vettingId,
      [bool shouldPop = true]) {
    return postDialog(
      context: context,
      title: 'Delete vetting?',
      description: 'Proceed with caution as this action is '
          'irreversible.',
      onTapSkipButton: context.pop,
      activeButtonText: 'Delete',
      activeButtonLoading: false,
      skipButtonLoading: false,
      skipText: 'Cancel',
      onTapActiveButton: () async {
        context.pop();
        final result = await projectVettingNotifier.deleteVetting(
          vettingId,
        );
        if (shouldPop) {
          if (result) {
            if (context.mounted) context.pop();
          }
        }
      },
    );
  }
}
