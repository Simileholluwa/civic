import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class PostCommentTreeWidget extends ConsumerWidget {
  final PostComment rootComment;
  final ContentBuilder<PostComment>? contentRoot;
  final ContentBuilder<PostComment>? contentChild;
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
  Widget build(BuildContext context, WidgetRef ref) {
    final repliesNotifier = ref.watch(postCommentRepliesProvider.notifier);
    final repliesState = ref.watch(postCommentRepliesProvider);
    final replies = repliesState.replies[commentId] ?? [];
    final isLoading = repliesState.isLoading[commentId] ?? false;
    final canLoadMore = repliesState.canLoadMore[commentId] ?? true;
    final isExpanded = ref.watch(expandedRepliesProvider(commentId));
    final isExpandedNotifier =
        ref.watch(expandedRepliesProvider(commentId).notifier);
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
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: replies.length + 1,
              itemBuilder: (context, index) {
                if (index == replies.length) {
                  return CommentChildWidget(
                    isLast: true,
                    hasAvatar: false,
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        if (isLoading)
                          SizedBox(
                            height: 60,
                            child: Center(
                              child: Row(
                                spacing: 5,
                                children: [
                                  Icon(
                                    Iconsax.arrow_circle_down,
                                    size: 20,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  Text(
                                    'Loading Replies...',
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
                          )
                        else
                          GestureDetector(
                            onTap: () async {
                              await repliesNotifier.loadReplies(
                                postId,
                                commentId,
                              );
                              if (canLoadMore) {
                                isExpandedNotifier.state = true;
                              } else {
                                repliesNotifier.resetReplies(commentId);
                                isExpandedNotifier.state = false;
                              }
                            },
                            child: SizedBox(
                              height: 60,
                              child: Center(
                                  child: Row(
                                spacing: 5,
                                children: [
                                  Icon(
                                      isExpanded && canLoadMore
                                          ? Iconsax.arrow_circle_down
                                          : isExpanded && !canLoadMore
                                              ? Iconsax.arrow_circle_up
                                              : Iconsax.arrow_circle_down,
                                      size: 20,
                                      color: Theme.of(context).primaryColor),
                                  Text(
                                    isExpanded && canLoadMore
                                        ? 'Show more replies'
                                        : isExpanded && !canLoadMore
                                            ? 'Hide replies'
                                            : 'Show Replies',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                  ),
                                ],
                              )),
                            ),
                          ),
                      ],
                    ),
                  );
                }
                return CommentChildWidget(
                  isLast: index == (replies.length),
                  content: contentChild!(context, replies[index]),
                  reply: replies[index],
                );
              },
            ),
          ),
      ],
    );
  }
}
