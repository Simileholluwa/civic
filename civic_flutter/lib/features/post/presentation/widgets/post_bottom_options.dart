import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class PostBottomOptions extends ConsumerWidget {
  const PostBottomOptions({
    super.key,
     required this.post,
  });
  final Post post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postState = ref.watch(regularPostProvider(post));
    final postNotifier = ref.watch(regularPostProvider(post).notifier);
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
              IconButton(
                onPressed: () {
                  PostHelperFunctions.tagUsersBottomSheet(
                    context,
                    post,
                  );
                },
                icon: const Icon(
                  Iconsax.tag_user5,
                ),
              ),
              IconButton(
                onPressed: () => PostHelperFunctions.selectLocation(
                  context,
                  post,
                ),
                icon: const Icon(
                  Iconsax.location5,
                ),
              ),
              IconButton(
                onPressed: () {
                  THelperFunctions.showScheduleDialog(
                    context,
                  );
                },
                icon: const Icon(
                  Icons.timer,
                ),
              ),
                IconButton(
                  onPressed: postNotifier.pickPicture,
                  icon: const Icon(
                    Iconsax.gallery5,
                  ),
                ),
                IconButton(
                  onPressed: postNotifier.takePicture,
                  icon: const Icon(
                    Iconsax.camera5,
                  ),
                ),
                IconButton(
                  onPressed: postNotifier.takeVideo,
                  icon: const Icon(
                    Icons.video_camera_front_rounded,
                  ),
                ),
                IconButton(
                  onPressed: postNotifier.pickVideo,
                  icon: const Icon(
                    Icons.video_file_rounded,
                  ),
                ),
            ],
          ),
           Padding(
            padding: const EdgeInsets.only(
              right: TSizes.sm,
            ),
            child: CreatContentTextCounter(
              maxLength: 2500,
              currentTextLength: postState.text.length,
            ),
          ),
        ],
      ),
    );
  }
}
