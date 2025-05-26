import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class PostCommentTreeWidget extends StatelessWidget {
  final Post rootComment;
  final ContentBuilder<Post>? contentRoot;
  final ContentBuilder<Post>? contentChild;
  final bool hasReplies;
  final int postId;
  final int commentId;

  const PostCommentTreeWidget(
    this.rootComment,
    this.hasReplies, {
    this.contentRoot,
    this.contentChild,
    required this.postId,
    required this.commentId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () async {
                    if (context.mounted) {
                      context.push(
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
                        Icon(Iconsax.arrow_circle_right,
                            size: 20, color: Theme.of(context).primaryColor),
                        Text(
                          'Show Replies',
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                        ),
                      ],
                    )),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
