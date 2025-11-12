import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/create/create.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

class PostVideoPost extends ConsumerWidget {
  const PostVideoPost({
    required this.post,
    super.key,
  });

  final Post post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postState = ref.watch(
      postCreationProvider(post),
    );
    final videoControl = ref.watch(
      mediaVideoPlayerProvider(
        postState.videoUrl,
      ),
    );
    final controller =
        ref.watch(mediaVideoPlayerProvider(postState.videoUrl).notifier);

    return Container(
      constraints: const BoxConstraints(
        maxWidth: 500,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: TSizes.md,
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            constraints: const BoxConstraints(
              maxHeight: 500,
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
            child: videoControl != null
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
                        height: 500,
                        width: 200,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                : const SizedBox(
                    height: 500,
                    width: 200,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
          ),
          PostVideoOptions(post: post),
        ],
      ),
    );
  }
}
