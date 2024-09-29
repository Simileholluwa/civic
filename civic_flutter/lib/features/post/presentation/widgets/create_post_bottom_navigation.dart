import 'dart:developer';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/providers/current_location_data_provider.dart';
import 'package:civic_flutter/core/widgets/create_post_options.dart';
import 'package:civic_flutter/core/widgets/privacy_widget.dart';
import 'package:civic_flutter/core/widgets/schedule_post_widget.dart';
import 'package:civic_flutter/core/widgets/selected_locations_widget.dart';
import 'package:civic_flutter/core/providers/scheduled_datetime_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreatePostBottomNavigation extends ConsumerWidget {
  const CreatePostBottomNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheduledDateTimeState = ref.watch(postScheduledDateTimeProvider);
    final selectedLocations = ref.watch(selectLocationsProvider);
    log(scheduledDateTimeState.toString());
    return SizedBox(
      height: THelperFunctions.getBottomNavigationBarHeight(
        scheduledDateTimeState,
        selectedLocations,
      ),
      child: Column(
        children: [
          selectedLocations.isNotEmpty
              ? const SelectedLocationsWidget()
              : const SizedBox.shrink(),
          scheduledDateTimeState == null
              ? const SizedBox.shrink()
              : const SchedulePostWidget(),
          const PrivacyWidget(),
          const CreatePostOptions(),
        ],
      ),
    );
  }
}
