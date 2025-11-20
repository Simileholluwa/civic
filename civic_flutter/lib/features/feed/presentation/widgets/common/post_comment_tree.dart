import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class PostCommentTreeWidget extends StatelessWidget {
  const PostCommentTreeWidget(
    this.rootComment,
    this.hasReplies, {
    required this.postId,
    required this.commentId,
    this.contentRoot,
    super.key,
  });
  final Post rootComment;
  final ContentBuilder<Post>? contentRoot;
  final bool hasReplies;
  final int postId;
  final int commentId;

  @override
  Widget build(BuildContext context) {
    return ImpressionVisibilityTracker(
      postId: rootComment.id!,
      dwell: FeedHelperFunctions.dwellFor(rootComment),
      threshold: FeedHelperFunctions.thresholdFor(rootComment),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RootCommentWidget(
            contentRoot!(
              context,
              rootComment,
            ),
            hasReplies,
            rootComment.owner!.userInfo!.imageUrl!,
          ),
          if (hasReplies)
            CommentChildWidget(
              isLast: true,
              hasAvatar: false,
              content: Row(
                children: [
                  GestureDetector(
                    onTap: () async {
                      if (context.mounted) {
                        await context.push(
                          '/feed/post/$postId/replies/$commentId',
                        );
                      }
                    },
                    child: SizedBox(
                      height: 60,
                      child: Center(
                        child: Row(
                          spacing: 5,
                          children: [
                            Icon(
                              Iconsax.arrow_circle_right,
                              size: 20,
                              color: Theme.of(context).primaryColor,
                            ),
                            Text(
                              'Show Replies',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
