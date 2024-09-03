import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/providers/media_provider.dart';
import 'package:civic_flutter/core/router/route_names.dart';
import 'package:civic_flutter/core/toasts_messages/toast_messages.dart';
import 'package:civic_flutter/core/widgets/content_dialog.dart';
import 'package:civic_flutter/features/feed/presentation/routes/feed_routes.dart';
import 'package:civic_flutter/features/post/presentation/provider/post_draft_provider.dart';
import 'package:civic_flutter/features/post/presentation/provider/post_text_controller.dart';
import 'package:civic_flutter/features/post/presentation/widgets/image_post.dart';
import 'package:civic_flutter/features/post/presentation/widgets/video_post.dart';
import 'package:expandable_text/expandable_text.dart';
//import 'package:civic_flutter/features/post/presentation/widgets/video_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class PostWidget extends ConsumerStatefulWidget {
  const PostWidget({
    super.key,
    this.hasImage = false,
    this.hasText = false,
    this.hasVideo = false,
    this.shouldHavePostOptions = false,
    required this.post,
    required this.index,
  });

  final bool hasImage;
  final bool hasText;
  final bool hasVideo;
  final bool shouldHavePostOptions;
  final DraftPost post;
  final int index;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends ConsumerState<PostWidget> {
  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    final age = DateTime.now()
        .difference(
          DateTime.fromMillisecondsSinceEpoch(
            int.parse(
              widget.post.createdAt.millisecondsSinceEpoch.toString(),
            ),
          ),
        )
        .inDays;
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(
        horizontal: TSizes.md,
      ),
      decoration: BoxDecoration(
        color: isDark ? TColors.dark : TColors.light,
        borderRadius: BorderRadius.circular(
          TSizes.md,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: TSizes.md,
                  right: TSizes.sm,
                  top: TSizes.md,
                  bottom: TSizes.sm,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Draft ${widget.index + 1}',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: isDark ? TColors.textWhite : TColors.dark,
                          ),
                    ),
                    Text(
                      'Expires in ${10 - age} ${age == 10 ? 'today' : age == 9 ? 'day' : 'days'}',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontSize: 13,
                          ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      ref.read(mediaProvider.notifier).clearMedia();
                      ref.read(postTextProvider.notifier).reset();
                      if (widget.hasVideo) {
                        ref.read(mediaProvider.notifier).setVideo(
                              widget.post.videoUrl,
                            );
                      }
                      if (widget.hasImage) {
                        ref.read(mediaProvider.notifier).setDraftImage(
                              widget.post.imageUrls,
                            );
                      }
                      if (widget.hasText) {
                        ref.read(postTextProvider.notifier).setText(
                              widget.post.text,
                            );
                      }
                      context.pop();
                      context.pushReplacement(
                        AppRoutes.createPost,
                        extra: {
                          'id': 0,
                          'isDraft': true,
                          'draftPost': widget.post,
                        },
                      );
                    },
                    icon: const Icon(
                      Iconsax.edit,
                    ),
                  ),
                  IconButton(
                    onPressed: () => deleteDraftDialog(context),
                    icon: const Icon(
                      Iconsax.trash,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      context.go(
                        FeedRoutes.namespace,
                        extra: sendPost,
                      );
                      ref.read(mediaVideoPlayerProvider.notifier).dispose();
                    },
                    icon: const Icon(
                      Iconsax.send_1,
                    ),
                  ),
                ],
              ),
            ],
          ),
          if (widget.hasText)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: TSizes.md,
              ),
              child: ExpandableText(
                widget.post.text,
                style: Theme.of(context).textTheme.labelLarge,
                expandText: 'show more.',
                collapseText: 'show less.',
                maxLines: 3,
                linkColor: TColors.primary,
                linkStyle: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          const SizedBox(
            height: TSizes.md,
          ),
          if (widget.hasImage)
            ImagePost(
              showImageOptions: false,
              images: widget.post.imageUrls,
              height: 350,
              padding: 0,
            ),
          if (widget.hasVideo)
            Stack(
              alignment: Alignment.center,
              children: [
                const VideoPost(
                  showVideoOptions: false,
                  height: 350,
                  margin: 0,
                ),
                Container(
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                    color: TColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed:
                        ref.watch(mediaVideoPlayerProvider.notifier).pausePlay,
                    icon: Icon(
                      ref.watch(mediaVideoPlayerProvider)!.value.isPlaying
                          ? Iconsax.pause
                          : Iconsax.play,
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  void sendPost() async {
    await ref.read(postDraftsProvider.notifier).sendDraftPost(
          widget.post,
          widget.index,
        );
  }

  Future<bool?> deleteDraftDialog(
    BuildContext context,
  ) {
    return postDialog(
        context: context,
        title: 'Delete draft ${widget.index + 1}?',
        description: 'Proceed with caution as this action is '
            'irreversible.',
        onTapSkipButton: context.pop,
        activeButtonText: 'Delete draft',
        activeButtonLoading: false,
        skipButtonLoading: false,
        skipText: 'Cancel',
        onTapActiveButton: () async {
          final result =
              await ref.read(postDraftsProvider.notifier).deleteDraftById(
                    widget.post,
                    widget.index,
                  );
          if (result) {
            TToastMessages.successToast(
              'Your draft has been deleted.',
            );
          }
          if (context.mounted) context.pop();
          if (ref.read(postDraftsProvider).isEmpty) {
            if (context.mounted) context.pop();
          }
        });
  }
}
