import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';

class PostCommentAndReplyContent extends StatelessWidget {
  const PostCommentAndReplyContent({
    super.key,
    required this.replyOrComment,
    this.onReply,
    this.onLike,
    this.isReply = false,
    this.hasReplies = false,
    this.onShowReplies,
  });

  final Post replyOrComment;
  final VoidCallback? onReply;
  final VoidCallback? onLike;
  final bool isReply;
  final bool hasReplies;
  final VoidCallback? onShowReplies;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!isReply)
          CreatorNameAndAccountInfo(
            creator: replyOrComment.owner!,
            timeAgo: THelperFunctions.humanizeDateTime(
              replyOrComment.dateCreated ?? DateTime.now(),
            ),
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
        Row(
          spacing: 10,
          children: [
            Row(
              spacing: 10,
              children: [
                GestureDetector(
                  onTap: onLike,
                  child: Text(
                    'Like',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                ),
                const Text('•'),
                GestureDetector(
                  onTap: onReply,
                  child: Text(
                    'Reply',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                ),
              ],
            ),
            if (hasReplies)
              Row(
                spacing: 10,
                children: [
                  const Text('•'),
                  GestureDetector(
                    onTap: onShowReplies,
                    child: Text(
                      'Show Replies',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ],
    );
  }
}

class RowIconText extends StatelessWidget {
  const RowIconText({
    super.key,
    required this.icon,
    required this.title,
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
