import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:video_player/video_player.dart';

class VideoPost extends ConsumerWidget {
  const VideoPost({
    required this.videoUrl,
    super.key,
  });
  final String videoUrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(
      postVideoPlayerProvider(
        videoUrl,
      ),
    );
    final controllerNotifier = ref.read(
      postVideoPlayerProvider(
        videoUrl,
      ).notifier,
    );

    Widget loader() => SizedBox(
          height: 300,
          width: 200,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 70,
                width: 70,
                child: CircularProgressIndicator(
                  backgroundColor: THelperFunctions.isDarkMode(context)
                      ? TColors.dark
                      : TColors.light,
                ),
              ),
              const Icon(Iconsax.video, size: 40),
            ],
          ),
        );

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          RepaintBoundary(
            child: Container(
              constraints: const BoxConstraints(maxHeight: 500),
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(TSizes.md),
                border: Border.all(color: Theme.of(context).dividerColor),
              ),
              child: controller != null && controller.value.isInitialized
                  ? ContentKeepAliveWrapper(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(TSizes.md),
                        child: AspectRatio(
                          aspectRatio: controller.value.aspectRatio,
                          child: GestureDetector(
                            onTap: controllerNotifier.pausePlay,
                            child: VideoPlayer(controller),
                          ),
                        ),
                      ),
                    )
                  : loader(),
            ),
          ),
          if (controller != null && controller.value.isInitialized)
            Align(
              alignment: Alignment.bottomCenter,
              child: RepaintBoundary(
                child: AnimatedOpacity(
                  opacity: controller.value.isPlaying ? 0 : 1,
                  duration: const Duration(milliseconds: 300),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(TSizes.md),
                        bottomRight: Radius.circular(TSizes.md),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                controller.value.isPlaying
                                    ? Icons.pause
                                    : Icons.play_arrow,
                                color: Colors.white,
                              ),
                              onPressed: controllerNotifier.pausePlay,
                            ),
                            IconButton(
                              icon: Icon(
                                controller.value.volume > 0
                                    ? Icons.volume_off
                                    : Icons.volume_up,
                                color: Colors.white,
                              ),
                              onPressed: controllerNotifier.muteUnmute,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              controllerNotifier
                                  .formatDuration(controller.value.position),
                              style: const TextStyle(color: Colors.white),
                            ),
                            const Spacer(),
                            Text(
                              controllerNotifier
                                  .formatDuration(controller.value.duration),
                              style: const TextStyle(color: Colors.white),
                            ),
                            const SizedBox(width: 15),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                          child: SizedBox(
                            height: 7,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: VideoProgressIndicator(
                                controller,
                                allowScrubbing: true,
                                colors: const VideoProgressColors(
                                  playedColor: TColors.primary,
                                  bufferedColor: Colors.grey,
                                  backgroundColor: Colors.white,
                                ),
                                padding: EdgeInsets.zero,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
