import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PostsScreen extends ConsumerWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pagingState = ref.watch(
      paginatedPostListProvider,
    );

    return AppInfiniteList<PostWithUserState>(
      pagingController: pagingState,
      scrollPhysics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, postWithUserState, index) {
        final post = postWithUserState.post;
        if (post.postType == PostType.article) {
          return ImpressionVisibilityTracker(
            postId: post.id!,
            dwell: FeedHelperFunctions.dwellFor(post),
            threshold: FeedHelperFunctions.thresholdFor(post),
            child: ArticleCard(
              postWithUserState: postWithUserState,
            ),
          );
        } else if (post.postType == PostType.poll) {
          return ImpressionVisibilityTracker(
            postId: post.id!,
            dwell: FeedHelperFunctions.dwellFor(post),
            threshold: FeedHelperFunctions.thresholdFor(post),
            child: PollCard(
              postWithUserState: postWithUserState,
            ),
          );
        } else {
          return ImpressionVisibilityTracker(
            postId: post.id!,
            dwell: FeedHelperFunctions.dwellFor(post),
            threshold: FeedHelperFunctions.thresholdFor(post),
            child: PostCardDetail(
              postWithUserState: postWithUserState,
              hasProject: post.postType == PostType.projectRepost,
              onTap: () async {
                await context.push(
                  '/feed/post/${post.id}',
                  extra: post,
                );
              },
            ),
          );
        }
      },
      createText: 'Create post',
      onCreate: () async {
        await context.push(
          '/create/post/0',
        );
      },
      errorMessage: pagingState.error is Failure
          ? (pagingState.error! as Failure).message
          : 'Something went wrong. Please try again.',
      onRefresh: pagingState.refresh,
    );
  }
}
