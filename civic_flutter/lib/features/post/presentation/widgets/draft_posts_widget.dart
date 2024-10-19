import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/widgets/create_content/create_content_locations_and_tagged_users.dart';
import 'package:civic_flutter/core/widgets/create_content/create_content_image_post.dart';
import 'package:civic_flutter/core/widgets/create_content/create_content_darft_text.dart';
import 'package:civic_flutter/features/post/presentation/widgets/draft_post_title.dart';
import 'package:civic_flutter/features/post/presentation/widgets/draft_posts_icons.dart';
import 'package:civic_flutter/features/post/presentation/widgets/draft_posts_video_thumbnail.dart';
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
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(
        horizontal: TSizes.md,
      ),
      decoration: BoxDecoration(
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
                createdAt: post.createdAt!,
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
            CreateContentDraftText(
              text: post.text,
            ),
          CreateContentLocationsAndTaggedUsers(
            locations: post.locations,
            taggedUsers: post.taggedUsers,
          ),
          if (hasImage || hasVideo)
            const SizedBox(
              height: 16,
            ),
          if (hasImage)
            ImagePost(
              showImageOptions: false,
              images: post.imagesPath,
              height: 350,
              padding: 0,
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
