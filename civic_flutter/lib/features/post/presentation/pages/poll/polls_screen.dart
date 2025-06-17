import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PollsScreen extends ConsumerWidget {
  const PollsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pagingControllerNotifier =
        ref.watch(paginatedPollListProvider.notifier);
    return AppInfiniteList<Post>(
      pagingController: pagingControllerNotifier.pagingController,
      scrollController: ref.read(pollScrollControllerProvider),
      itemBuilder: (context, post, index) {
        return PollCard(post: post);
      },
      onRefresh: pagingControllerNotifier.refresh,
    );
  }
}

class PollCard extends ConsumerWidget {
  const PollCard({
    super.key,
    required this.post,
    this.fromDetails = false,
  });

  final Post post;
  final bool fromDetails;

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
      postCardWidgetProvider(
        newPost,
      ),
    );

    return InkWell(
      onTap: fromDetails
          ? null
          : () {
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
                      PostHelperFunctions.formatTimeLeft(
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

class PollOptionsCard extends ConsumerWidget {
  const PollOptionsCard({
    super.key,
    required this.post,
  });

  final Post post;

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
      postCardWidgetProvider(
        newPost,
      ),
    );
    final postCardNotifier = ref.watch(
      postCardWidgetProvider(
        newPost,
      ).notifier,
    );

    return ListView.separated(
      itemCount: postCardState.options.length,
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 10,
        );
      },
      itemBuilder: (context, index) {
        final option = postCardState.options[index];
        final numberOfVotes = postCardState.pollOptions[index].votedBy!.length;
        final totalVotes = postCardState.totalVotes;
        final userVote =
            postCardState.votedOption == postCardState.pollOptions[index];
        return GestureDetector(
          onTap: postCardState.pollEnded || postCardState.isSendingPoll
              ? null
              : () async {
                  await postCardNotifier.castVote(
                    post.id!,
                    postCardState.pollOptions[index].id!,
                  );
                },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10,
              ),
              color: userVote
                  ? Theme.of(context).primaryColor.withAlpha(50)
                  : null,
              border: Border.all(
                color: Theme.of(context).dividerColor,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 10,
              children: [
                Expanded(
                  child: ListTile(
                    contentPadding: const EdgeInsets.only(
                      left: 15,
                    ),
                    title: Text(
                      option,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontWeight:
                                userVote ? FontWeight.w600 : FontWeight.normal,
                          ),
                    ),
                    selected: userVote,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 10,
                    left: 5,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        totalVotes != 0
                            ? '${((numberOfVotes / totalVotes) * 100).toStringAsFixed(2)}%'
                            : '0.00%',
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                      ),
                      Text(
                        numberOfVotes == 0
                            ? 'No votes'
                            : numberOfVotes == 1
                                ? '1 vote'
                                : ' ${THelperFunctions.humanizeNumber(numberOfVotes)} votes',
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
