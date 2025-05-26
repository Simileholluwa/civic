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
  });

  final int postId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final commentPagingControllerNotifier = ref.watch(
      paginatedPostCommentListProvider(postId).notifier,
    );
    return AppInfiniteList<Post>(
      pagingController: commentPagingControllerNotifier.pagingController,
      scrollPhysics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, comment, index) {
        final commentNotifier = ref.watch(
          regularPostProvider(comment).notifier,
        );
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
                comment.commentedBy?.isNotEmpty ?? false,
                contentRoot: (context, reply) {
                  return PostCommentAndReplyContent(
                    replyOrComment: reply,
                    onReply: () async {
                      await commentNotifier.sendReply(comment.id!);
                    },
                  );
                },
                contentChild: (context, reply) {
                  
                  return PostCommentAndReplyContent(
                    replyOrComment: reply,
                    onReply: () async {
                      await commentNotifier.sendReply(reply.id!);
                    },
                    isReply: true,
                    hasReplies: reply.commentedBy!.isNotEmpty,
                    onShowReplies: () {
                      context.push(
                        '/feed/post/$postId/replies/${reply.id!}'
                      );
                    },
                  );
                },
              ),
              if (comment.commentedBy?.isEmpty ?? false)
                const SizedBox(height: 10),
            ],
          ),
        );
      },
      onRefresh: () => commentPagingControllerNotifier.refresh(),
      noItemsFound: ContentNoItemsFound(),
    );
  }
}
