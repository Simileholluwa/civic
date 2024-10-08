import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/widgets/selected_locations_widget.dart';
import 'package:civic_flutter/core/widgets/selected_tags_widget.dart';
import 'package:civic_flutter/core/widgets/image_post.dart';
import 'package:civic_flutter/features/post/presentation/widgets/darft_post_text.dart';
import 'package:civic_flutter/features/post/presentation/widgets/draft_post_title.dart';
import 'package:civic_flutter/features/post/presentation/widgets/draft_posts_icons.dart';
import 'package:civic_flutter/features/post/presentation/widgets/draft_posts_video_thumbnail.dart';
//import 'package:civic_flutter/features/post/presentation/widgets/video_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DraftPostsWidget extends ConsumerWidget {
  const DraftPostsWidget({
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
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = THelperFunctions.isDarkMode(context);
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
              DraftPostTitle(
                post: post,
                index: index,
              ),
              DraftPostsIcons(
                hasText: hasText,
                hasVideo: hasVideo,
                hasImage: hasImage,
                post: post,
                index: index,
              ),
            ],
          ),
          if (hasText)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: TSizes.md,
              ),
              child: DarftPostText(
                post: post,
              ),
            ),
          if (post.locations.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(
                right: TSizes.md,
              ),
              child: SelectedLocationsWidget(
                locations: post.locations,
                showRemoveLocations: false,
                height: 40,
              ),
            ),
          if (post.taggedUsers.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(
                right: TSizes.md,
              ),
              child: SelectedTagsWidget(
                showRemoveTags: false,
                tags: post.taggedUsers,
                height: post.locations.isEmpty ? 40 : 20,
              ),
            ),
          const SizedBox(
            height: 16,
          ),
          if (hasImage)
            ImagePost(
              showImageOptions: false,
              images: post.imagesPath,
              height: 350,
              padding: 0,
              fullBorder: false,
            ),
          if (hasVideo)
            DraftPostsVideoThumbnail(
              post: post,
            ),
        ],
      ),
    );
  }
}
