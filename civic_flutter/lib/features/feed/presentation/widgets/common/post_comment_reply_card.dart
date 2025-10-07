import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PostCommentReplyCard extends ConsumerWidget {
  const PostCommentReplyCard({
    required this.postId,
    super.key,
  });

  final int postId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repliesController = ref.watch(
      paginatedRepliesListProvider(postId).notifier,
    );
    return AppInfiniteList<Post>(
      pagingController: repliesController.pagingController,
      canCreate: false,
      shrinkWrap: true,
      showDivider: false,
      scrollPhysics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, value, index) {
        final liveReply = ref.watch(
          postStreamProvider(
            value.id!,
            value,
          ),
        );
        final reply = liveReply.value ?? value;
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
                commentId: reply.id!,
                postId: postId,
                reply,
                reply.commentCount != 0,
                contentRoot: (context, reply) {
                  return PostCommentAndReplyContent(
                    replyOrComment: reply,
                    onReply: () async {
                      await context.push(
                        '/create/post/0',
                        extra: {
                          'parent': reply,
                        },
                      );
                    },
                    isReply: true,
                    originalPostId: postId,
                  );
                },
              ),
            ],
          ),
        );
      },
      onRefresh: repliesController.refresh,
      noItemsFound: const ContentNoItemsFound(),
      firstPageProgressIndicator: Center(
        child: LoadingAnimationWidget.progressiveDots(
          color: TColors.primary,
          size: 50,
        ),
      ),
      firstPageErrorIndicator: CommentRepliesPageError(
        onTap: repliesController.refresh,
        errorMessage:
            "We couldn't fetch replies for this post. Please try again.",
      ),
    );
  }
}
