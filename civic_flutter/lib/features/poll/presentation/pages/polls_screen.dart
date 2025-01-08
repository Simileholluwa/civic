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
    final isDark = THelperFunctions.isDarkMode(context);
    return AppInfiniteList<Poll>(
      pagingController: pagingControllerNotifier.pagingController,
      scrollController: ref.read(pollScrollControllerProvider),
      itemBuilder: (context, poll, index) {
        final pollCardState = ref.watch(pollCardWidgetProvider(poll));
        return Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 12, 15, 10),
              child: ContentCreatorInfo(
                creator: pollCardState.creator,
                timeAgo: pollCardState.timeAgo,
                numberOfViews: pollCardState.numberOfViews,
              ),
            ),
            if (pollCardState.hasText)
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: ContentExpandableText(
                      text: pollCardState.question,
                    ),
                  ),
                ],
              ),
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                ...poll.options!.option.asMap().entries.map(
                  (entry) {
                    final option = entry.value;
                    final index = entry.key;
                    final numberOfVotes = poll.options!.votes[index];
                    final totalVotes =
                        poll.options!.votes.reduce((a, b) => a + b);
                    final voteValue =
                        totalVotes == 0 ? 0.0 : numberOfVotes / totalVotes;
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                      child: Column(
                        spacing: 10,
                        children: [
                          Row(
                            spacing: 10,
                            children: [
                              SizedBox(
                                height: 20,
                                width: 20,
                                child: Checkbox(
                                  value: false,
                                  onChanged: (value) {},
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  option,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Text(
                                numberOfVotes.toString(),
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                            child: LinearProgressIndicator(
                              value: voteValue,
                              backgroundColor:
                                  isDark ? TColors.dark : TColors.light,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                TColors.primary,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ContentInteractionButton(
                    icon: Iconsax.heart,
                    title: '1.2k',
                    onTap: () {},
                    color: Theme.of(context).textTheme.labelMedium!.color!,
                  ),
                  ContentInteractionButton(
                    icon: Iconsax.messages_1,
                    title: '1.2k',
                    onTap: () {},
                    color: Theme.of(context).textTheme.labelMedium!.color!,
                  ),
                  ContentInteractionButton(
                    icon: Iconsax.repeate_music5,
                    title: '1.2k',
                    onTap: () {},
                    color: Theme.of(context).textTheme.labelMedium!.color!,
                  ),
                  ContentInteractionButton(
                    icon: Icons.share,
                    title: '',
                    showTitle: false,
                    onTap: () {},
                    color: Theme.of(context).textTheme.labelMedium!.color!,
                  ),
                  ContentInteractionButton(
                    icon: Iconsax.bookmark,
                    title: '',
                    showTitle: false,
                    onTap: () {},
                    color: Theme.of(context).textTheme.labelMedium!.color!,
                  ),
                  ContentInteractionButton(
                    icon: Iconsax.more_2,
                    title: '',
                    showTitle: false,
                    onTap: () {},
                    color: Theme.of(context).textTheme.labelMedium!.color!,
                  ),
                ],
              ),
            ),
            if (index !=
                pagingControllerNotifier.pagingController.itemList!.length - 1)
              const Divider(
                height: 0,
              ),
          ],
        );
      },
      onRefresh: pagingControllerNotifier.refresh,
    );
  }
}
