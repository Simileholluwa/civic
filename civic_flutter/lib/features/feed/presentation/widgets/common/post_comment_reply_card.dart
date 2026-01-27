import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PostCommentReplyCard extends ConsumerWidget {
  const PostCommentReplyCard({
    required this.postId,
    this.scrollPhysics,
    this.firstPageProgressIndicator,
    this.shrinkWrap,
    super.key,
  });

  final int postId;
  final ScrollPhysics? scrollPhysics;
  final bool? shrinkWrap;
  final Widget? firstPageProgressIndicator;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pagingState = ref.watch(
      paginatedRepliesListProvider(postId),
    );
    return AppInfiniteList<PostWithUserState>(
      pagingController: pagingState,
      canCreate: false,
      shrinkWrap: shrinkWrap,
      showDivider: false,
      scrollPhysics: scrollPhysics,
      itemBuilder: (context, postWithUserState, index) {
        final feedProv = feedButtonsProvider(
          PostWithUserStateKey(postWithUserState),
        );
        final reply = postWithUserState.post;
        final commentCount = ref.watch(
          feedProv.select(
            (s) => s.numberOfComments,
          ),
        );
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            children: [
              if (index == 0)
                const SizedBox(height: 15)
              else
                const SizedBox(height: 5),
              PostCommentTreeWidget(
                commentId: reply.id!,
                postId: postId,
                reply,
                commentCount != 0,
                contentRoot: (context, reply) {
                  return PostCommentAndReplyContent(
                    postWithUserState: postWithUserState,
                    onReply: () async {
                      await context.push(
                        '/create/post/0',
                        extra: {
                          'rootPost': reply,
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
      onRefresh: pagingState.refresh,
      noItemsFound: const ContentNoItemsFound(),
      firstPageProgressIndicator: Center(
        child: LoadingAnimationWidget.progressiveDots(
          color: TColors.primary,
          size: 50,
        ),
      ),
      firstPageErrorIndicator: CommentRepliesPageError(
        onTap: pagingState.refresh,
        errorMessage: pagingState.error is Failure
            ? (pagingState.error! as Failure).message
            : 'Something went wrong. Please try again.',
      ),
    );
  }
}
