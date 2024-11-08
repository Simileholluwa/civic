import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/providers/media_provider.dart';
import 'package:civic_flutter/features/post/presentation/provider/post_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class PostVideoOptions extends ConsumerWidget {
  const PostVideoOptions({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postState = ref.watch(
          regularPostProvider(post),
        );
    final postNotifier = ref.watch(
          regularPostProvider(post).notifier,
        );
    final videoControl = ref.watch(mediaVideoPlayerProvider(postState.videoUrl,),);
    final videoController = ref.watch(mediaVideoPlayerProvider(postState.videoUrl).notifier);
    final isDark = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.only(
        bottom: TSizes.md,
      ),
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          color: isDark ? TColors.dark : TColors.light,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).scaffoldBackgroundColor,
                border: Border.all(
                  color: Theme.of(context).dividerColor,
                ),
              ),
              child: IconButton(
                onPressed: () {
                  videoControl?.dispose();
                  postNotifier.clearMedia();
                },
                icon: const Icon(
                  CupertinoIcons.clear,
                  size: 22,
                ),
              ),
            ),
            const SizedBox(
              width: TSizes.xs,
            ),
            IconButton(
              onPressed: videoController.pausePlay,
              icon: Icon(
                videoControl!.value.isPlaying ? Iconsax.pause : Iconsax.play,
              ),
            ),
            IconButton(
              onPressed: videoController.muteUnmute,
              icon: Icon(
                videoControl.value.volume > 0
                    ? Iconsax.volume_cross
                    : Iconsax.volume_high,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Iconsax.magicpen,
                size: 22,
              ),
            ),
            const SizedBox(
              width: TSizes.xs,
            ),
          ],
        ),
      ),
    );
  }
}
