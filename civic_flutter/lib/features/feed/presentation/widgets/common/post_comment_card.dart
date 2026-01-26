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
    this.shrinkWrap,
  });

  final int id;
  final ScrollPhysics? scrollPhysics;
  final bool? shrinkWrap;
  final Widget? firstPageProgressIndicator;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pagingState = ref.watch(
      paginatedCommentListProvider(id),
    );
    return AppInfiniteList<PostWithUserState>(
      pagingController: pagingState,
      scrollPhysics: scrollPhysics,
      shrinkWrap: shrinkWrap,
      canCreate: false,
      showDivider: false,
      itemBuilder: (context, postWithUserState, index) {
        final comment = postWithUserState.post;
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
                    postWithUserState: postWithUserState,
                    onReply: () async {
                      await context.push(
                        '/create/post/0',
                        extra: {
                          'rootPost': comment,
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
