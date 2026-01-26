import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdaptivePostCard extends StatelessWidget {
  const AdaptivePostCard({
    required this.postWithUserState,
    this.showPollInteractions = true,
    super.key,
  });

  final PostWithUserState postWithUserState;
  final bool showPollInteractions;

  @override
  Widget build(BuildContext context) {
    final post = postWithUserState.post;
    return post.postType == PostType.article
        ? ImpressionVisibilityTracker(
            postId: post.id!,
            dwell: FeedHelperFunctions.dwellFor(post),
            threshold: FeedHelperFunctions.thresholdFor(post),
            child: ArticleCard(
              postWithUserState: postWithUserState,
            ),
          )
        : post.postType == PostType.poll
        ? ImpressionVisibilityTracker(
            postId: post.id!,
            dwell: FeedHelperFunctions.dwellFor(post),
            threshold: FeedHelperFunctions.thresholdFor(post),
            child: PollCard(
              postWithUserState: postWithUserState,
              showInteractions: showPollInteractions,
              canTap: true,
            ),
          )
        : ImpressionVisibilityTracker(
            postId: post.id!,
            dwell: FeedHelperFunctions.dwellFor(post),
            threshold: FeedHelperFunctions.thresholdFor(post),
            child: PostCardDetail(
              postWithUserState: postWithUserState,
              onTap: () async {
                await context.push(
                  '/feed/post/${post.id}',
                  extra: post,
                );
              },
            ),
          );
  }
}
