import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PostCommentAndReplyContent extends StatelessWidget {
  const PostCommentAndReplyContent({
    required this.replyOrComment,
    required this.originalPostId,
    super.key,
    this.onReply,
    this.onLike,
    this.isReply = false,
    this.isComment = false,
    this.onShowReplies,
  });

  final Post replyOrComment;
  final VoidCallback? onReply;
  final VoidCallback? onLike;
  final bool isReply;
  final VoidCallback? onShowReplies;
  final bool isComment;
  final int originalPostId;

  @override
  Widget build(BuildContext context) {
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
          ),
          if (replyOrComment.text != null)
            ContentExpandableText(
              text: replyOrComment.text!,
              noMaxLines: true,
              onToggleTextTap: () {},
            ),
          if (replyOrComment.imageUrls?.isNotEmpty ?? false)
            replyOrComment.imageUrls!.length == 1
                ? ContentSingleCachedImage(
                    imageUrl: replyOrComment.imageUrls!.first,
                    useMargin: false,
                  )
                : ContentMultipleCachedImage(
                    imageUrls: replyOrComment.imageUrls!,
                    useMargin: false,
                  ),
          if (replyOrComment.taggedUsers!.isNotEmpty ||
              replyOrComment.locations!.isNotEmpty)
            ContentEngagementTagsAndLocations(
              usePadding: false,
              tags: replyOrComment.taggedUsers!,
              locations: replyOrComment.locations!,
              hasTags: replyOrComment.taggedUsers!.isNotEmpty,
              hasLocations: replyOrComment.locations!.isNotEmpty,
            ),
          PostInteractionButtons(
            post: replyOrComment,
            hasPadding: false,
            onReply: onReply,
            replyIcon1: Icons.reply_rounded,
            isReply: isReply,
            isComment: isComment,
            originalPostId: originalPostId,
            iconSize: 20,
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
