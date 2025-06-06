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
        final pollCardState = ref.watch(pollCardWidgetProvider(poll));
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
            ListView.separated(
              itemCount: poll.options!.length,
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
                final option = poll.options![index].option;
                final numberOfVotes = poll.options![index].votedBy!.length;
                final totalVotes = poll.votedBy!.length;
                return Container(
                  
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10,),
                    color: Theme.of(context).cardColor,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 10,
                    children: [
                      Expanded(
                        child: ListTile(
                          onTap: () {},
                          title: Text(
                            option!,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                        child: VerticalDivider(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10,),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              totalVotes != 0
                                  ? '${((numberOfVotes / totalVotes) * 100).toStringAsFixed(2)}%'
                                  : '0.00%',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                            ),
                            Text(
                              '${THelperFunctions.humanizeNumber(
                                numberOfVotes,
                              )} votes',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            if (pollCardState.hasTags || pollCardState.hasLocations)
              ContentEngagementTagsAndLocations(
                tags: pollCardState.tags,
                locations: pollCardState.locations,
                hasTags: pollCardState.hasTags,
                hasLocations: pollCardState.hasLocations,
              ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ContentInteractionButton(
                    icon: Iconsax.heart,
                    onTap: () {},
                    color: Theme.of(context).textTheme.labelMedium!.color!,
                  ),
                  ContentInteractionButton(
                    icon: Iconsax.messages_1,
                    onTap: () {},
                    color: Theme.of(context).textTheme.labelMedium!.color!,
                  ),
                  ContentInteractionButton(
                    icon: Iconsax.repeate_music5,
                    onTap: () {},
                    color: Theme.of(context).textTheme.labelMedium!.color!,
                  ),
                  ContentInteractionButton(
                    icon: Icons.share,
                    onTap: () {},
                    color: Theme.of(context).textTheme.labelMedium!.color!,
                  ),
                  ContentInteractionButton(
                    icon: Iconsax.bookmark,
                    onTap: () {},
                    color: Theme.of(context).textTheme.labelMedium!.color!,
                  ),
                  ContentInteractionButton(
                    icon: Iconsax.more_2,
                    onTap: () {},
                    color: Theme.of(context).textTheme.labelMedium!.color!,
                  ),
                ],
              ),
            ),
          ],
        );
      },
      onRefresh: pagingControllerNotifier.refresh,
    );
  }
}
