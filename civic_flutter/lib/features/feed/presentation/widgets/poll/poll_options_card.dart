import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PollOptionsCard extends ConsumerWidget {
  const PollOptionsCard({
    required this.post,
    super.key,
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
      feedButtonsProvider(
        newPost,
      ),
    );
    final postCardNotifier = ref.watch(
      feedButtonsProvider(
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
        final numberOfVotes = postCardState.pollOptions[index].votesCount!;
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
                            ? '${((numberOfVotes / totalVotes) * 100).toStringAsFixed(
                                2,
                              )}%'
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
