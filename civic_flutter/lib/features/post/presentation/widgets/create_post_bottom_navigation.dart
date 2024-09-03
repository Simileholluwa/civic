import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/toasts_messages/toast_messages.dart';
import 'package:civic_flutter/core/widgets/custom_tooltip_shape.dart';
import 'package:civic_flutter/core/providers/media_provider.dart';
import 'package:civic_flutter/core/widgets/text_counter.dart';
import 'package:civic_flutter/features/post/presentation/provider/post_text_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    return SizedBox(
      height: 105,
      child: Column(
        children: [
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
                      onPressed: () {},
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
                        TToastMessages.successToast('Hi');
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
                  child: Consumer(builder: (context, ref, child) {
                    return TextCounter(
                      currentTextLength:
                          ref.watch(postTextProvider.notifier).getLength(),
                      maxLength: 2500,
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
