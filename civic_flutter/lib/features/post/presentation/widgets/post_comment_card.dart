import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PostCommentCard extends ConsumerWidget {
  const PostCommentCard({
    super.key,
    required this.postId,
    this.scrollPhysics,
    this.firstPageProgressIndicator,
  });

  final int postId;
  final ScrollPhysics? scrollPhysics;
  final Widget? firstPageProgressIndicator;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final commentController = ref.watch(
      paginatedPostCommentListProvider(postId).notifier,
    );
    return AppInfiniteList<Post>(
      pagingController: commentController.pagingController,
      scrollPhysics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, comment, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            children: [
              if (index == 0)
                const SizedBox(height: 5)
              else
                const SizedBox(height: 10),
              PostCommentTreeWidget(
                commentId: comment.id!,
                postId: postId,
                comment,
                comment.commentCount != 0,
                contentRoot: (context, reply) {
                  return PostCommentAndReplyContent(
                    replyOrComment: reply,
                    onReply: () {
                      context.push('/create/post/0', extra: {
                        'parent': comment,
                      });
                    },
                  );
                },
                contentChild: (context, reply) {
                  return PostCommentAndReplyContent(
                    replyOrComment: reply,
                    onReply: () {
                      context.push('/create/post/0', extra: {
                        'parent': reply,
                      });
                    },
                    isReply: true,
                    hasReplies: reply.commentCount != 0,
                    onShowReplies: () {
                      context.push('/feed/post/$postId/replies/${reply.id!}');
                    },
                  );
                },
              ),
              if (comment.commentCount != 0)
                const SizedBox(height: 10),
            ],
          ),
        );
      },
      onRefresh: () => commentController.refresh(),
      firstPageProgressIndicator: firstPageProgressIndicator,
      noItemsFound: ContentNoItemsFound(),
    );
  }
}
