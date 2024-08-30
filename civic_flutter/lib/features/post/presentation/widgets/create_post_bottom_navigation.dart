import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/providers/integer_provider.dart';
import 'package:civic_flutter/core/widgets/content_dialog.dart';
import 'package:civic_flutter/core/widgets/custom_tooltip_shape.dart';
import 'package:civic_flutter/core/providers/media_provider.dart';
import 'package:civic_flutter/core/widgets/text_counter.dart';
import 'package:civic_flutter/features/post/presentation/provider/post_draft_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import 'media_options.dart';

class CreatePostBottomNavigation extends ConsumerStatefulWidget {
  const CreatePostBottomNavigation({
    super.key,
    required this.postText,
  });

  final String postText;

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
    final canSaveDraft = ref.watch(mediaProvider).isNotEmpty ||
        ref.watch(textLengthProvider) > 0;
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
                      onPressed:
                          !canSaveDraft ? null : () => saveDraftDialog(context),
                      icon: Icon(
                        Iconsax.folder_add5,
                        size: 27,
                        color: !canSaveDraft ? null : TColors.primary,
                      ),
                    ),
                    const SizedBox(
                      width: TSizes.xs,
                    ),
                    IconButton(
                      onPressed: () {},
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
                      currentTextLength: ref.watch(textLengthProvider),
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

  Future<Widget?> saveDraftDialog(BuildContext context) {
    return postDialog(
      context: context,
      title: 'Save post as draft?',
      description: 'Draft post will be saved in drafts for '
          'a maximum of 10 days.',
      onTapSkipButton: context.pop,
      activeButtonText: 'Save draft',
      activeButtonLoading: false,
      skipButtonLoading: false,
      onTapActiveButton: () {
        final media = ref.watch(mediaProvider);
        final videoUrl = media.isEmpty
            ? ''
            : THelperFunctions.isVideo(media.first)
                ? media.first
                : '';
        final imageUrls = media.isEmpty
            ? <String>[]
            : THelperFunctions.isImage(media.first)
                ? media
                : <String>[];
        ref.read(postDraftsProvider.notifier).saveDraftPost(
              context,
              DraftPost(
                draftId: DateTime.now().millisecondsSinceEpoch,
                postType: THelperFunctions.determinePostType(
                  text: widget.postText,
                  pickedImages: imageUrls,
                  pickedVideo: videoUrl,
                ),
                text: widget.postText,
                imageUrls: imageUrls,
                videoUrl: videoUrl,
                taggedUsers: [],
                latitude: 0,
                longitude: 0,
                createdAt: DateTime.now(),
              ),
            );
      },
    );
  }
}
