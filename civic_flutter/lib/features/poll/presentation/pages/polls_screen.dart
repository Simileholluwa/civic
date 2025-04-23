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
                  onToggleTextTap: (){},
                ),
              ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  TSizes.borderRadiusLg,
                ),
                border: Border.all(
                  color: Theme.of(context).dividerColor,
                ),
              ),
              child: ListView.separated(
                itemCount: poll.options!.option.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) {
                  return const Divider(
                    thickness: 2,
                    height: 0,
                  );
                },
                itemBuilder: (context, index) {
                  final option = poll.options!.option[index];
                  final numberOfVotes = poll.options!.votes[index];
                  final totalVotes =
                      poll.options!.votes.reduce((a, b) => a + b);
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: index == 0
                          ? const BorderRadius.only(
                              topRight: Radius.circular(
                                TSizes.borderRadiusLg,
                              ),
                              topLeft: Radius.circular(
                                TSizes.borderRadiusLg,
                              ),
                            )
                          : index == poll.options!.option.length - 1
                              ? const BorderRadius.only(
                                  bottomRight: Radius.circular(
                                    TSizes.borderRadiusLg,
                                  ),
                                  bottomLeft: Radius.circular(
                                    TSizes.borderRadiusLg,
                                  ),
                                )
                              : BorderRadius.zero,
                      color: Colors.transparent,
                    ),
                    child: ListTile(
                      onTap: () {},
                      title: Text(
                        option,
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                      subtitle: Row(
                        spacing: 10,
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 10,
                              child: LinearProgressIndicator(
                                value: totalVotes == 0
                                    ? 0
                                    : numberOfVotes / totalVotes,
                                backgroundColor: Theme.of(context).cardColor,
                                borderRadius: BorderRadius.circular(
                                  100,
                                ),
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            totalVotes != 0
                                ? '${((numberOfVotes / totalVotes) * 100).toStringAsFixed(2)}%'
                                : '0.00%',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  color: Theme.of(context).hintColor,
                                ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
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
