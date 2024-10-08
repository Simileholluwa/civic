import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/providers/media_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

import 'video_options.dart';

class VideoPost extends ConsumerWidget {
  const VideoPost({
    super.key,
    this.showVideoOptions = true,
    this.height = 500,
    this.margin = TSizes.md,
  });

  final bool showVideoOptions;
  final double height;
  final double margin;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 500,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: margin,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showVideoOptions) const VideoOptions(),
          Container(
            constraints: BoxConstraints(
              maxHeight: height,
            ),
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                TSizes.md,
              ),
              border: Border.all(
                color: Theme.of(context).dividerColor,
              ),
            ),
            child: Builder(
              builder: (context) {
                final videoControl = ref.watch(mediaVideoPlayerProvider);
                final controller =
                    ref.watch(mediaVideoPlayerProvider.notifier);
                return videoControl != null
                    ? videoControl.value.isInitialized
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(
                              TSizes.md,
                            ),
                            child: AspectRatio(
                              aspectRatio: videoControl.value.aspectRatio,
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: SizedBox(
                                  width: videoControl.value.size.width,
                                  height: videoControl.value.size.height,
                                  child: GestureDetector(
                                    onTap: controller.pausePlay,
                                    child: VideoPlayer(
                                      videoControl,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : const SizedBox(
                            height: 300,
                            width: 200,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                    : const SizedBox(
                        height: 300,
                        width: 200,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
              },
            ),
          ),
          
        ],
      ),
    );
  }
}
