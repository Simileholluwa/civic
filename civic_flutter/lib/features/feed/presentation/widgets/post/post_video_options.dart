import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class PostVideoOptions extends ConsumerWidget {
  const PostVideoOptions({
    required this.post,
    super.key,
  });

  final Post post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postState = ref.watch(
      feedProvider(post),
    );
    final postNotifier = ref.watch(
      feedProvider(post).notifier,
    );
    final videoControl = ref.watch(
      mediaVideoPlayerProvider(
        postState.videoUrl,
      ),
    );
    final videoController =
        ref.watch(mediaVideoPlayerProvider(postState.videoUrl).notifier);
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
      ),
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: Theme.of(context).dividerColor,
          ),
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
                onPressed: () async {
                  await videoControl?.dispose();
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
                color: TColors.textWhite,
              ),
            ),
            IconButton(
              onPressed: videoController.muteUnmute,
              icon: Icon(
                videoControl.value.volume > 0
                    ? Iconsax.volume_cross
                    : Iconsax.volume_high,
                color: TColors.textWhite,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Iconsax.magicpen,
                size: 22,
                color: TColors.textWhite,
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
