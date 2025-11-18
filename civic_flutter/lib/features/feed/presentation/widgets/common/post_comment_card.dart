import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PostCommentCard extends ConsumerWidget {
  const PostCommentCard({
    required this.id,
    super.key,
    this.scrollPhysics,
    this.firstPageProgressIndicator,
  });

  final int id;
  final ScrollPhysics? scrollPhysics;
  final Widget? firstPageProgressIndicator;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pagingState = ref.watch(
      paginatedCommentListProvider(id),
    );
    return AppInfiniteList<Post>(
      pagingController: pagingState,
      scrollPhysics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      canCreate: false,
      showDivider: false,
      itemBuilder: (context, value, index) {
        final liveComment = ref.watch(
          postStreamProvider(
            value.id!,
            value,
          ),
        );
        final comment = liveComment.value ?? value;

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
                postId: id,
                comment,
                comment.commentCount != 0,
                contentRoot: (context, reply) {
                  return PostCommentAndReplyContent(
                    replyOrComment: reply,
                    onReply: () async {
                      await context.push(
                        '/create/post/0',
                        extra: {
                          'parent': comment,
                        },
                      );
                    },
                    originalPostId: id,
                    isComment: true,
                  );
                },
              ),
            ],
          ),
        );
      },
      onRefresh: pagingState.refresh,
      firstPageProgressIndicator: firstPageProgressIndicator,
      noItemsFound: const ContentNoItemsFound(),
      firstPageErrorIndicator: CommentRepliesPageError(
        onTap: pagingState.refresh,
        errorMessage: pagingState.error is Failure
            ? (pagingState.error! as Failure).message
            : 'Something went wrong. Please try again.',
      ),
    );
  }
}
