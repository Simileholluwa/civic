import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PollCard extends ConsumerWidget {
  const PollCard({
    required this.postWithUserState,
    super.key,
    this.onTap,
    this.canTap = false,
    this.showInteractions = true,
  });

  final PostWithUserState postWithUserState;
  final bool canTap;
  final VoidCallback? onTap;
  final bool showInteractions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final post = postWithUserState.post;
    final feedProv =
        feedButtonsProvider(PostWithUserStateKey(postWithUserState));
    final totalVotes = ref.watch(
      feedProv.select(
        (s) => s.totalVotes,
      ),
    );
    final numberOfVoters = ref.watch(
      feedProv.select(
        (s) => s.numberOfVoters,
      ),
    );
    final hasVoted = ref.watch(
      feedProv.select(
        (s) => s.hasVoted,
      ),
    );
    final pollEnded = ref.watch(
      feedProv.select(
        (s) => s.pollEnded,
      ),
    );
    final hasText = post.text != null && post.text!.isNotEmpty;
    final hasTags = post.tags != null && post.tags!.isNotEmpty;
    final hasLocations = post.locations != null && post.locations!.isNotEmpty;
    return InkWell(
      onTap: !canTap
          ? null
          : onTap ??
              () async {
                await context.push(
                  '/feed/poll/${post.id}',
                  extra: post,
                );
              },
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 12, 15, 0),
            child: ContentCreatorInfo(
              creator: post.owner!,
              timeAgo: THelperFunctions.humanizeDateTime(
                post.dateCreated!,
              ),
              onMoreTapped: () async {
                await showDialog<dynamic>(
                  context: context,
                  builder: (ctx) {
                    return AlertDialog(
                      contentPadding: const EdgeInsets.only(
                        bottom: 16,
                      ),
                      content: ShowPostActions(
                        postWithUserState: postWithUserState,
                        originalPostId: post.id!,
                        isPoll: true,
                      ),
                    );
                  },
                );
              },
            ),
          ),
          if (hasText)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: ContentExpandableText(
                text: post.text!,
                expandOnTextTap: true,
              ),
            ),
          RepaintBoundary(
            child: PollOptionsCard(
              postWithUserState: postWithUserState,
            ),
          ),
          if (hasTags || hasLocations)
            ContentEngagementTagsAndLocations(
              tags: post.taggedUsers ?? [],
              locations: post.locations ?? [],
              hasTags: hasTags,
              hasLocations: hasLocations,
            ),
          RepaintBoundary(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        totalVotes == 0
                            ? 'No votes'
                            : '$numberOfVoters ${totalVotes == 1 ? 'vote' : 'votes'}',
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: Theme.of(context).hintColor,
                                ),
                      ),
                      Text(
                        FeedHelperFunctions.formatTimeLeft(
                          post.poll!.expiresAt ?? DateTime.now(),
                        ),
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: Theme.of(context).hintColor,
                                ),
                      ),
                    ],
                  ),
                  if (hasVoted && !pollEnded)
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Clear vote',
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: TColors.primary,
                                ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          if (showInteractions)
            PostInteractionButtons(
              postWithUserState: postWithUserState,
              onReply: () async {
                await context.push(
                  '/feed/post/${post.id}/comments',
                );
              },
            ),
        ],
      ),
    );
  }
}
