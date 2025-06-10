import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/poll/poll.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class PollsScreen extends ConsumerWidget {
  const PollsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pagingControllerNotifier =
        ref.watch(paginatedPollListProvider.notifier);
    return AppInfiniteList<Poll>(
      pagingController: pagingControllerNotifier.pagingController,
      scrollController: ref.read(pollScrollControllerProvider),
      itemBuilder: (context, poll, index) {
        return PollCard(poll: poll);
      },
      onRefresh: pagingControllerNotifier.refresh,
    );
  }
}

class PollCard extends ConsumerWidget {
  const PollCard({
    super.key,
    required this.poll,
    this.fromDetails = true,
  });

  final Poll poll;
  final bool fromDetails;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final livePoll = ref.watch(
      pollStreamProvider(
        poll.id!,
        poll,
      ),
    );
    final pollCardState = ref.watch(
      pollCardWidgetProvider(
        livePoll.value ?? poll,
      ),
    );
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 12, 15, 0),
          child: ContentCreatorInfo(
            creator: pollCardState.creator,
            timeAgo: pollCardState.timeAgo,
          ),
        ),
        if (pollCardState.hasText)
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: ContentExpandableText(
              text: pollCardState.question,
              onToggleTextTap: () {},
            ),
          ),
        PollOptionsCard(poll: livePoll.value ?? poll),
        if (pollCardState.hasTags || pollCardState.hasLocations)
          ContentEngagementTagsAndLocations(
            tags: pollCardState.tags,
            locations: pollCardState.locations,
            hasTags: pollCardState.hasTags,
            hasLocations: pollCardState.hasLocations,
          ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Text(
                poll.votedBy!.isEmpty
                    ? 'No votes'
                    : '${pollCardState.numberOfVoters} ${poll.votedBy!.length == 1 ? 'vote' : 'votes'}',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).hintColor,
                    ),
              ),
              Text(
                PollHelperFunctions.formatTimeLeft(
                  poll.expiresAt!,
                ),
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).hintColor,
                    ),
              ),
            ],
          ),
        ),
        if (fromDetails) PollInteractionButtons(poll: livePoll.value ?? poll),
      ],
    );
  }
}

class PollInteractionButtons extends ConsumerWidget {
  const PollInteractionButtons({
    super.key,
    required this.poll,
  });

  final Poll poll;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pollCardState = ref.watch(
      pollCardWidgetProvider(
        poll,
      ),
    );
    final pollCardNotifier = ref.watch(
      pollCardWidgetProvider(
        poll,
      ).notifier,
    );
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ContentInteractionButton(
            icon: pollCardState.isLiked ? Iconsax.heart5 : Iconsax.heart,
            onTap: () async {
              await pollCardNotifier.togglePollLikeStatus(
                poll.id!,
              );
            },
            color: pollCardState.isLiked
                ? TColors.primary
                : Theme.of(context).iconTheme.color!,
            text: pollCardState.likesCount,
          ),
          ContentInteractionButton(
            icon: Iconsax.message,
            onTap: () {},
            color: Theme.of(context).textTheme.labelMedium!.color!,
          ),
          ContentInteractionButton(
            icon: Iconsax.repeate_music,
            onTap: () {},
            color: Theme.of(context).textTheme.labelMedium!.color!,
          ),
          ContentInteractionButton(
            icon: pollCardState.isBookmarked
                ? Icons.bookmark
                : Icons.bookmark_add_outlined,
            onTap: () async {
              await pollCardNotifier.togglePollBookmarkStatus(
                poll.id!,
              );
            },
            color: pollCardState.isBookmarked
                ? TColors.primary
                : Theme.of(context).iconTheme.color!,
            text: pollCardState.bookmarksCount,
          ),
          ContentInteractionButton(
            icon: Iconsax.more_circle,
            onTap: () {
              showDialog(
                context: context,
                builder: (ctx) {
                  return AlertDialog(
                    contentPadding: const EdgeInsets.only(
                      bottom: 16,
                    ),
                    content: ShowPollActions(
                      poll: poll,
                    ),
                  );
                },
              );
            },
            color: Theme.of(context).textTheme.labelMedium!.color!,
          ),
        ],
      ),
    );
  }
}

class PollOptionsCard extends ConsumerWidget {
  const PollOptionsCard({
    super.key,
    required this.poll,
  });

  final Poll poll;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pollCardState = ref.watch(
      pollCardWidgetProvider(
        poll,
      ),
    );
    final pollCardNotifier = ref.watch(
      pollCardWidgetProvider(
        poll,
      ).notifier,
    );
    return ListView.separated(
      itemCount: pollCardState.options.length,
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
        final option = pollCardState.options[index];
        final numberOfVotes = pollCardState.pollOptions[index].votedBy!.length;
        final totalVotes = pollCardState.totalVotes;
        final userVote =
            pollCardState.votedOption == pollCardState.pollOptions[index];
        return GestureDetector(
          onTap: pollCardState.pollEnded || pollCardState.isSendingPoll
              ? null
              : () async {
                  await pollCardNotifier.castVote(
                    poll.id!,
                    pollCardState.pollOptions[index].id!,
                  );
                },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10,
              ),
              color: userVote ? Theme.of(context).primaryColor.withAlpha(50) : null,
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
                            fontWeight: userVote ? FontWeight.w600 : FontWeight.normal,
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
                        totalVotes == 0
                            ? 'No votes'
                            : totalVotes == 1
                                ? '1 vote'
                                : ' ${pollCardState.numberOfVoters} votes',
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
