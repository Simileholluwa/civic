import 'dart:developer';
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/providers/current_location_data_provider.dart';
import 'package:civic_flutter/core/providers/media_provider.dart';
import 'package:civic_flutter/core/widgets/privacy_widget.dart';
import 'package:civic_flutter/core/widgets/schedule_post_widget.dart';
import 'package:civic_flutter/core/widgets/selected_locations_widget.dart';
import 'package:civic_flutter/core/widgets/show_schedule_dialog.dart';
import 'package:civic_flutter/core/widgets/text_counter.dart';
import 'package:civic_flutter/features/post/presentation/pages/tag_users_screen.dart';
import 'package:civic_flutter/features/post/presentation/provider/post_text_controller.dart';
import 'package:civic_flutter/core/providers/scheduled_datetime_provider.dart';
import 'package:civic_flutter/features/post/presentation/widgets/select_media_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class CreatePostBottomNavigation extends ConsumerWidget {
  const CreatePostBottomNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectMediaProvider = ref.watch(mediaProvider.notifier);
    final scheduledDateTimeProvider =
        ref.watch(postScheduledDateTimeProvider.notifier);
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
              : SchedulePostWidget(
                  scheduledDateTimeProvider: scheduledDateTimeProvider,
                ),
          const PrivacyWidget(),
          Container(
            height: 55,
            padding: const EdgeInsets.only(
              left: TSizes.xs,
              right: TSizes.sm,
            ),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Theme.of(context).dividerColor,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) {
                            return const TagUsersScreen();
                          },
                        );
                      },
                      icon: const Icon(
                        Iconsax.tag_user5,
                        size: 27,
                        color: TColors.primary,
                      ),
                    ),
                    const SizedBox(
                      width: TSizes.xs,
                    ),
                    IconButton(
                      onPressed: () => THelperFunctions.selectLocation(
                        context,
                      ),
                      icon: const Icon(
                        Iconsax.location5,
                        size: 27,
                        color: TColors.primary,
                      ),
                    ),
                    const SizedBox(
                      width: TSizes.xs,
                    ),
                    IconButton(
                      onPressed: () {
                        showScheduleDialog(
                          context,
                          scheduledDateTimeProvider,
                        );
                      },
                      icon: const Icon(
                        Icons.timer,
                        size: 27,
                        color: TColors.primary,
                      ),
                    ),
                    const SizedBox(
                      width: TSizes.xs,
                    ),
                    IconButton(
                      onPressed: () async {
                        await showUploadMediaDialog(
                          context,
                          selectMediaProvider,
                        );
                      },
                      icon: const Icon(
                        Iconsax.gallery5,
                        color: TColors.primary,
                        size: 27,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: TSizes.sm,
                  ),
                  child: TextCounter(
                    currentTextLength: ref.watch(postTextProvider).text.length,
                    maxLength: 2500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
