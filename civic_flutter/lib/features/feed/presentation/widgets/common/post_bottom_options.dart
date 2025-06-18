import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class PostBottomOptions extends ConsumerWidget {
  const PostBottomOptions({
    super.key,
    required this.post,
    this.showMedia = true,
    this.isReplyOrComment = false,
    this.maxLength = 2500,
    this.tagLoc,
  });
  final Post post;
  final bool showMedia;
  final bool isReplyOrComment;
  final int maxLength;
  final bool? tagLoc;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postState = ref.watch(feedProvider(post));
    final postNotifier = ref.watch(feedProvider(post).notifier);
    final showTagLoc = tagLoc ??
        postState.imageUrls.isNotEmpty || postState.videoUrl.isNotEmpty;
    return Container(
      height: 55,
      padding: const EdgeInsets.only(
        left: TSizes.xs,
        right: TSizes.sm,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Visibility(
                visible: showTagLoc,
                child: IconButton(
                  onPressed: () {
                    FeedHelperFunctions.tagUsersBottomSheet(
                      context,
                      post,
                    );
                  },
                  icon: const Icon(
                    Iconsax.tag_user5,
                  ),
                ),
              ),
              Visibility(
                visible: showTagLoc,
                child: IconButton(
                  onPressed: () => FeedHelperFunctions.selectLocation(
                    context,
                    post,
                  ),
                  icon: const Icon(
                    Iconsax.location5,
                  ),
                ),
              ),
              Visibility(
                visible: !isReplyOrComment,
                child: IconButton(
                  onPressed: () {
                    THelperFunctions.showScheduleDialog(
                      context,
                    );
                  },
                  icon: const Icon(
                    Icons.timer,
                  ),
                ),
              ),
              Visibility(
                visible: showMedia,
                child: IconButton(
                  onPressed: postNotifier.pickPicture,
                  icon: const Icon(
                    Iconsax.gallery5,
                  ),
                ),
              ),
              Visibility(
                visible: showMedia,
                child: IconButton(
                  onPressed: postNotifier.takePicture,
                  icon: const Icon(
                    Iconsax.camera5,
                  ),
                ),
              ),
              Visibility(
                visible: !isReplyOrComment && showMedia,
                child: IconButton(
                  onPressed: postNotifier.takeVideo,
                  icon: const Icon(
                    Icons.video_camera_front_rounded,
                  ),
                ),
              ),
              Visibility(
                visible: !isReplyOrComment && showMedia,
                child: IconButton(
                  onPressed: postNotifier.pickVideo,
                  icon: const Icon(
                    Icons.video_file_rounded,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: TSizes.sm,
            ),
            child: CreatContentTextCounter(
              maxLength: isReplyOrComment ? 400 : maxLength,
              currentTextLength: postState.text.length,
            ),
          ),
        ],
      ),
    );
  }
}
