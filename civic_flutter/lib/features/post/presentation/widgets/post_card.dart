import 'dart:developer';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class PostCard extends ConsumerWidget {
  const PostCard({
    super.key,
    required this.onTap,
    required this.post,
    this.noMaxLines = false,
  });

  final VoidCallback? onTap;
  final Post post;
  final bool noMaxLines;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postCardState = ref.watch(
      postCardWidgetProvider(post),
    );
    final postCardNotifier = ref.watch(
      postCardWidgetProvider(post).notifier,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        if (postCardState.isProjectRepost && !postCardState.isProjectQuote)
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 12, 15, 0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ProjectQuickDetailWidget(
                  icon: Iconsax.repeate_music5,
                  title:
                      '${post.project!.owner!.userInfo!.fullName ?? post.project!.owner!.userInfo!.userName!} reposted this',
                  color: Colors.yellow.shade900,
                  textStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).hintColor,
                      ),
                ),
              ],
            ),
          )
        else
          Padding(
            padding: EdgeInsets.fromLTRB(
                15,
                postCardState.isProjectRepost && !postCardState.isProjectQuote
                    ? 0
                    : 12,
                15,
                0),
            child: ContentCreatorInfo(
              creator: postCardState.creator,
              timeAgo: postCardState.timeAgo,
            ),
          ),
        InkWell(
          onTap: onTap,
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (postCardState.hasText)
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: ContentExpandableText(
                    text: postCardState.text,
                    hasImage: postCardState.hasImage,
                    hasVideo: postCardState.hasVideo,
                    noMaxLines: noMaxLines,
                    onToggleTextTap: (){},
                  ),
                ),
              if (postCardState.hasImage)
                postCardState.imageUrls.length == 1
                    ? ContentSingleCachedImage(
                        imageUrl: postCardState.imageUrls.first,
                      )
                    : ContentMultipleCachedImage(
                        imageUrls: postCardState.imageUrls,
                      ),
              if (postCardState.hasVideo)
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: VideoPost(
                    videoUrl: postCardState.videoUrl,
                  ),
                ),
              if (postCardState.isProjectQuote || postCardState.isProjectRepost)
                Container(
                  margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  padding: const EdgeInsets.only(
                    bottom: 16,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      TSizes.md,
                    ),
                    border: Border.all(
                      color: Theme.of(context).dividerColor,
                    ),
                  ),
                  child: ProjectCard(
                    project: post.project!,
                    showInteractions: false,
                    maxHeight: 200,
                  ),
                ),
            ],
          ),
        ),
        if (postCardState.hasTags || postCardState.hasLocation)
          ContentEngagementTagsAndLocations(
            tags: postCardState.tags,
            locations: postCardState.locations,
            hasTags: postCardState.hasTags,
            hasLocations: postCardState.hasLocation,
          ),
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ContentInteractionButton(
                icon: postCardState.hasLiked == true
                    ? Iconsax.heart5
                    : Iconsax.heart,
                onTap: () async {
                  await postCardNotifier.togglePostLikeStatus(
                    post.id!,
                  );
                },
                color: postCardState.hasLiked == true
                    ? TColors.primary
                    : Theme.of(context).iconTheme.color!,
                text: postCardState.numberOfLikes,
              ),
              ContentInteractionButton(
                icon: Iconsax.messages,
                text: postCardState.numberOfComments,
                onTap: () async {
                  final saveComment = ref.read(savePostCommentProvider);
                  final result = await saveComment(
                    SavePostCommentParams(
                      post.id!,
                      PostComment(
                        postId: post.id!,
                        ownerId: post.owner!.userInfoId,
                        text: 'newest comment for post ${post.id}',
                      ),
                    ),
                  );
                  result.fold((l) {
                    log(l.message);
                  }, (r) {
                    final commentPagingControllerNotifier = ref.watch(
                      paginatedPostCommentListProvider(post.id!).notifier,
                    );
                    commentPagingControllerNotifier.addComment(r!);
                  });
                },
                color: Theme.of(context).textTheme.labelMedium!.color!,
              ),
              ContentInteractionButton(
                icon: Iconsax.repeate_music5,
                text: postCardState.numberOfReposts,
                onTap: () {},
                color: Theme.of(context).textTheme.labelMedium!.color!,
              ),
              ContentInteractionButton(
                icon: Iconsax.bookmark,
                onTap: () {},
                color: Theme.of(context).textTheme.labelMedium!.color!,
              ),
              ContentInteractionButton(
                icon: Icons.share,
                onTap: () {},
                color: Theme.of(context).textTheme.labelMedium!.color!,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
