import 'dart:developer';
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/widgets/custom_tooltip_shape.dart';
import 'package:civic_flutter/core/providers/media_provider.dart';
import 'package:civic_flutter/core/widgets/text_counter.dart';
import 'package:civic_flutter/features/post/presentation/pages/tag_users_screen.dart';
import 'package:civic_flutter/features/post/presentation/provider/post_text_controller.dart';
import 'package:civic_flutter/features/post/presentation/provider/scheduled_datetime_provider.dart';
import 'package:civic_flutter/features/post/presentation/widgets/pick_date_and_time.dart';
import 'package:civic_flutter/features/post/presentation/widgets/schedule_post_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import 'media_options.dart';

class CreatePostBottomNavigation extends ConsumerStatefulWidget {
  const CreatePostBottomNavigation({
    super.key,
  });

  @override
  ConsumerState<CreatePostBottomNavigation> createState() =>
      _CreatePostBottomNavigationState();
}

class _CreatePostBottomNavigationState
    extends ConsumerState<CreatePostBottomNavigation>
    with SingleTickerProviderStateMixin {
  bool _isTooltipVisible = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  void _toggleTooltip() {
    setState(() {
      _isTooltipVisible = !_isTooltipVisible;
      if (_isTooltipVisible) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(mediaProvider.notifier);
    final scheduledDateTimeProvider =
        ref.watch(postScheduledDateTimeProvider.notifier);
    final scheduledDateTimeState = ref.watch(postScheduledDateTimeProvider);
    log(scheduledDateTimeState.toString());
    return SizedBox(
      height: scheduledDateTimeState == null ? 105 : 155,
      child: Column(
        children: [
          scheduledDateTimeState == null
              ? const SizedBox.shrink()
              : InkWell(
                  onTap: () async {
                    await showScheduleBottomSheet(
                      context,
                      scheduledDateTimeProvider,
                    );
                  },
                  child: Ink(
                    padding: const EdgeInsets.only(
                      left: TSizes.md - 2,
                      right: TSizes.md,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Theme.of(context).dividerColor,
                        ),
                      ),
                    ),
                    height: 50,
                    width: double.maxFinite,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.timer,
                              size: 20,
                              color: TColors.primary,
                            ),
                            const SizedBox(
                              width: TSizes.sm,
                            ),
                            Text(
                              scheduledDateTimeProvider.humanizeDateTime(),
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                    color: TColors.primary,
                                  ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            scheduledDateTimeProvider.clearDateTime();
                          },
                          child: const Icon(
                            Icons.clear,
                            size: 20,
                            color: TColors.secondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
          InkWell(
            onTap: () {},
            child: Ink(
              padding: const EdgeInsets.only(
                left: TSizes.md - 2,
              ),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Theme.of(context).dividerColor,
                  ),
                ),
              ),
              height: 50,
              width: double.maxFinite,
              child: Row(
                children: [
                  const Icon(
                    Iconsax.global5,
                    size: 20,
                    color: TColors.primary,
                  ),
                  const SizedBox(
                    width: TSizes.sm,
                  ),
                  Text(
                    'Everyone can see this post and reply',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: TColors.primary,
                        ),
                  ),
                ],
              ),
            ),
          ),
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
                      onPressed: () {},
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
                        showScheduleBottomSheet(
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
                    PortalTarget(
                      visible: _isTooltipVisible,
                      anchor: const Aligned(
                        follower: Alignment.bottomCenter,
                        target: Alignment.topCenter,
                        offset: Offset(0, -8),
                      ),
                      portalFollower: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          setState(() {
                            _isTooltipVisible = false;
                          });
                        },
                        child: ScaleTransition(
                          scale: _scaleAnimation,
                          child: _isTooltipVisible
                              ? CustomTooltipShape(
                                  children: [
                                    ListView(
                                      shrinkWrap: true,
                                      children: [
                                        MediaOptions(
                                          onTap: () {
                                            controller.pickPicture(
                                              context,
                                            );
                                            _toggleTooltip();
                                          },
                                          text: 'Gallery image',
                                        ),
                                        const Divider(),
                                        MediaOptions(
                                          onTap: () {
                                            controller.pickVideo(context);
                                            _toggleTooltip();
                                          },
                                          text: 'Gallery video',
                                        ),
                                        const Divider(),
                                        MediaOptions(
                                          onTap: () {
                                            controller.takePicture();
                                            _toggleTooltip();
                                          },
                                          text: 'Live image',
                                        ),
                                        const Divider(),
                                        MediaOptions(
                                          onTap: () {
                                            controller.takeVideo();
                                            _toggleTooltip();
                                          },
                                          text: 'Live video',
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              : const SizedBox.shrink(),
                        ),
                      ),
                      child: IconButton(
                        onPressed: _toggleTooltip,
                        icon: const Icon(
                          Iconsax.gallery5,
                          color: TColors.primary,
                          size: 27,
                        ),
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

  Future<bool?> showScheduleBottomSheet(
    BuildContext context,
    PostScheduledDateTime scheduledDateTimeProvider,
  ) {
    return schedulePostSheet(
      context: context,
      title: 'Schedule post',
      description: 'Scheduled post will be sent at the'
          ' selected date and time.',
      textController: scheduledDateTimeProvider.textController(),
      onTextFieldTapped: () async {
        context.pop();
        scheduledDateTimeProvider.setDateTime(
          await pickDateAndTime(context),
        );
      },
      onTapActiveButton: null,
    );
  }
}
