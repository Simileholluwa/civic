import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PollCard extends ConsumerWidget {
  const PollCard({
    super.key,
    required this.post,
    this.onTap,
    this.fromDetails = false,
  });

  final Post post;
  final bool fromDetails;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final livePost = ref.watch(
      postStreamProvider(
        post.id!,
        post,
      ),
    );
    final newPost = livePost.value ?? post;
    final postCardState = ref.watch(
      feedButtonsProvider(
        newPost,
      ),
    );

    return InkWell(
      onTap: fromDetails
          ? null
          : onTap ?? () {
              context.push(
                '/feed/poll/${post.id}',
                extra: newPost,
              );
            },
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 12, 15, 0),
            child: ContentCreatorInfo(
              creator: postCardState.creator!,
              timeAgo: postCardState.timeAgo,
            ),
          ),
          if (postCardState.hasText)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: ContentExpandableText(
                text: postCardState.text,
                onToggleTextTap: () {},
              ),
            ),
          PollOptionsCard(post: newPost),
          if (postCardState.hasTags || postCardState.hasLocation)
            ContentEngagementTagsAndLocations(
              tags: postCardState.tags,
              locations: postCardState.locations,
              hasTags: postCardState.hasTags,
              hasLocations: postCardState.hasLocation,
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      postCardState.totalVotes == 0
                          ? 'No votes'
                          : '${postCardState.numberOfVoters} ${postCardState.totalVotes == 1 ? 'vote' : 'votes'}',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: Theme.of(context).hintColor,
                          ),
                    ),
                    Text(
                      FeedHelperFunctions.formatTimeLeft(
                        newPost.poll!.expiresAt!,
                      ),
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: Theme.of(context).hintColor,
                          ),
                    ),
                  ],
                ),
                if (postCardState.hasVoted && !postCardState.pollEnded)
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Clear vote',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: TColors.primary,
                          ),
                    ),
                  ),
              ],
            ),
          ),
          if (!fromDetails)
            PostInteractionButtons(
              post: newPost,
              onReply: () {
                context.push(
                  '/feed/post/${post.id}/comments',
                );
              },
              originalPostId: post.id!,
              isPoll: true,
            ),
        ],
      ),
    );
  }
}
