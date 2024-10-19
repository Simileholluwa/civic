import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/providers/location_service_provider.dart';
import 'package:civic_flutter/core/widgets/create_content/create_content_bottom_options.dart';
import 'package:civic_flutter/core/widgets/create_content/create_content_privacy.dart';
import 'package:civic_flutter/core/widgets/create_content/create_content_schedule.dart';
import 'package:civic_flutter/core/widgets/create_content/create_content_selected_locations.dart';
import 'package:civic_flutter/core/providers/scheduled_datetime_provider.dart';
import 'package:civic_flutter/core/widgets/create_content/create_content_selected_tags.dart';
import 'package:civic_flutter/core/providers/tag_selections_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreatePostBottomNavigation extends ConsumerWidget {
  const CreatePostBottomNavigation({
    super.key,
    this.showSelectMedia = true,
    this.maxLength = 2500,
  });

  final bool showSelectMedia;
  final int maxLength;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheduledDateTimeState = ref.watch(postScheduledDateTimeProvider);
    final selectedLocations = ref.watch(selectLocationsProvider);
    final tagState = ref.watch(tagSelectionsProvider);
    final bottomHeight = THelperFunctions.getBottomNavigationBarHeight(
      scheduledDateTimeState,
      selectedLocations,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: tagState.isEmpty ? bottomHeight : bottomHeight + 50,
          child: Column(
            children: [
              tagState.isNotEmpty
                  ? CreateContentSelectedTags(
                      tags: ref.watch(tagSelectionsProvider),
                    )
                  : const SizedBox.shrink(),
              selectedLocations.isNotEmpty
                  ? CreateContentSelectedLocations(
                      locations: ref.watch(selectLocationsProvider),
                    )
                  : const SizedBox.shrink(),
              scheduledDateTimeState == null
                  ? const SizedBox.shrink()
                  : const CreateContentSchedule(),
              const CreateContentPrivacy(),
              CreateContentBottomOptions(
                showSelectMedia: showSelectMedia,
                maxLength: maxLength,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
