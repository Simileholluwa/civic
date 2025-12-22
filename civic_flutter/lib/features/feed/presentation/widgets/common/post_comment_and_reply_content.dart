import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PostCommentAndReplyContent extends StatelessWidget {
  const PostCommentAndReplyContent({
    required this.postWithUserState,
    required this.originalPostId,
    super.key,
    this.onReply,
    this.onLike,
    this.isReply = false,
    this.isComment = false,
    this.onShowReplies,
  });

  final PostWithUserState postWithUserState;
  final VoidCallback? onReply;
  final VoidCallback? onLike;
  final bool isReply;
  final VoidCallback? onShowReplies;
  final bool isComment;
  final int originalPostId;

  @override
  Widget build(BuildContext context) {
    final replyOrComment = postWithUserState.post;
    final text = replyOrComment.text;
    final hasText = text != null && text.isNotEmpty;
    final imageUrls = replyOrComment.imageUrls;
    final hasImages = imageUrls?.isNotEmpty ?? false;
    final singleImage = hasImages && imageUrls!.length == 1;
    final taggedUsers = replyOrComment.taggedUsers ?? [];
    final locations = replyOrComment.locations ?? [];
    final hasTags = taggedUsers.isNotEmpty;
    final hasLocations = locations.isNotEmpty;

    return InkWell(
      onTap: () async {
        await context.push(
          '/feed/post/${replyOrComment.id}',
          extra: replyOrComment,
        );
      },
      child: Column(
        spacing: 10,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CreatorNameAndAccountInfo(
            creator: replyOrComment.owner!,
            timeAgo: THelperFunctions.humanizeDateTime(
              replyOrComment.dateCreated!,
            ),
            onMoreTapped: () async {
              await showDialog<dynamic>(
                context: context,
                builder: (ctx) {
                  return AlertDialog(
                    contentPadding: const EdgeInsets.only(
                      bottom: 16,
                    ),
                    content: ShowPostActions(
                      postWithUserState: postWithUserState,
                      originalPostId: replyOrComment.parentId!,
                      isReply: isReply,
                      isComment: isComment,
                    ),
                  );
                },
              );
            },
          ),
          if (hasText)
            ContentExpandableText(
              text: text,
              noMaxLines: true,
            ),
          if (hasImages)
            RepaintBoundary(
              child: singleImage
                  ? ContentSingleCachedImage(
                      imageUrl: imageUrls.first,
                      useMargin: false,
                    )
                  : ContentMultipleCachedImage(
                      imageUrls: imageUrls!,
                      useMargin: false,
                    ),
            ),
          if (hasTags || hasLocations)
            ContentEngagementTagsAndLocations(
              usePadding: false,
              tags: taggedUsers,
              locations: locations,
              hasTags: hasTags,
              hasLocations: hasLocations,
            ),
          PostInteractionButtons(
            postWithUserState: postWithUserState,
            hasPadding: false,
            onReply: onReply,
          ),
          if (replyOrComment.commentCount == 0)
            const SizedBox(
              height: 5,
            ),
        ],
      ),
    );
  }
}

class RowIconText extends StatelessWidget {
  const RowIconText({
    required this.icon,
    required this.title,
    super.key,
    this.color,
  });

  final IconData icon;
  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: color,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: color,
                  fontSize: 16,
                ),
          ),
        ),
      ],
    );
  }
}
