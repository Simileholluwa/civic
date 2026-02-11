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
    final isInitialized = controller?.value.isInitialized ?? false;

    Widget loader() => SizedBox(
          height: 300,
          width: double.maxFinite,
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

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).dividerColor),
        borderRadius: BorderRadius.circular(TSizes.md),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          RepaintBoundary(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 500),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: isInitialized && controller != null
                    ? ContentKeepAliveWrapper(
                        child: AspectRatio(
                          aspectRatio: controller.value.aspectRatio,
                          child: GestureDetector(
                            onTap: controllerNotifier.pausePlay,
                            onDoubleTapDown: (details) {
                              final box =
                                  context.findRenderObject() as RenderBox?;
                              final width = box?.size.width ?? 0;
                              final dx = details.localPosition.dx;
                              if (width > 0) {
                                if (dx >= width / 2) {
                                  controllerNotifier.seekBy(
                                    const Duration(
                                      seconds: 10,
                                    ),
                                  );
                                } else {
                                  controllerNotifier.seekBy(
                                    const Duration(
                                      seconds: -10,
                                    ),
                                  );
                                }
                              }
                            },
                            child: ClipRRect(
                              child: VideoPlayer(controller),
                              borderRadius: controller.value.aspectRatio > 0.75
                                  ? BorderRadius.circular(
                                      TSizes.md,
                                    )
                                  : BorderRadius.zero,
                            ),
                          ),
                        ),
                      )
                    : loader(),
              ),
            ),
          ),
          if (isInitialized && controller != null)
            Align(
              alignment: Alignment.bottomCenter,
              child: RepaintBoundary(
                child: ValueListenableBuilder<VideoPlayerValue>(
                  valueListenable: controller,
                  builder: (context, value, _) {
                    return IgnorePointer(
                      ignoring: value.isPlaying,
                      child: AnimatedOpacity(
                        opacity: value.isPlaying ? 0 : 1,
                        duration: const Duration(milliseconds: 300),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: Colors.black12,
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
                                      value.isPlaying
                                          ? Icons.pause
                                          : Icons.play_arrow,
                                      color: Colors.white,
                                    ),
                                    onPressed: controllerNotifier.pausePlay,
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      value.volume > 0
                                          ? Icons.volume_off
                                          : Icons.volume_up,
                                      color: Colors.white,
                                    ),
                                    onPressed: controllerNotifier.muteUnmute,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    controllerNotifier
                                        .formatDuration(value.position),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  const Spacer(),
                                  Text(
                                    controllerNotifier
                                        .formatDuration(value.duration),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  const SizedBox(width: 15),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
