import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/widgets/create_content/create_content_locations_and_tagged_users.dart';
import 'package:civic_flutter/core/widgets/create_content/create_content_darft_text.dart';
import 'package:civic_flutter/features/post/presentation/widgets/draft_image_post.dart';
import 'package:civic_flutter/features/post/presentation/widgets/draft_post_title.dart';
import 'package:civic_flutter/features/post/presentation/widgets/draft_posts_icons.dart';
import 'package:civic_flutter/features/post/presentation/widgets/draft_posts_video_thumbnail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DraftPostsWidget extends ConsumerWidget {
  const DraftPostsWidget({
    super.key,
    required this.index,
    required this.draftPost,
  });
  final int index;
  final DraftPost draftPost;

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
                createdAt: draftPost.createdAt!,
                index: index,
              ),
              DraftPostsIcons(
                post: draftPost,
                index: index,
              ),
            ],
          ),
          if (draftPost.text.isNotEmpty)
            CreateContentDraftText(
              text: draftPost.text,
            ),
          if (draftPost.locations.isNotEmpty || draftPost.taggedUsers.isNotEmpty)
            const SizedBox(
              height: 16,
            ),
          CreateContentLocationsAndTaggedUsers(
            locations: draftPost.locations,
            taggedUsers: draftPost.taggedUsers,
          ),
          if (draftPost.imagesPath.isNotEmpty || draftPost.videoPath.isNotEmpty)
            const SizedBox(
              height: 16,
            ),
          if (draftPost.imagesPath.isNotEmpty)
            DraftImagePost(
              post: draftPost,
            ),
          if (draftPost.videoPath.isNotEmpty)
            DraftPostsVideoThumbnail(
              post: draftPost,
            ),
        ],
      ),
    );
  }
}
