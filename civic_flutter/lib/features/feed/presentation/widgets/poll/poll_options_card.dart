import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PollOptionsCard extends ConsumerWidget {
  const PollOptionsCard({
    required this.postWithUserState,
    this.showPadding = true,
    this.canVote = true,
    super.key,
  });

  final PostWithUserState postWithUserState;
  final bool showPadding;
  final bool canVote;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feedProv = feedButtonsProvider(
      PostWithUserStateKey(
        postWithUserState,
      ),
    );
    final optionVoters = ref.watch(
      feedProv.select(
        (s) => s.optionVoters,
      ),
    );
    final totalVotes = ref.watch(
      feedProv.select(
        (s) => s.totalVotes,
      ),
    );
    final votedOption = ref.watch(
      feedProv.select(
        (s) => s.votedOption,
      ),
    );
    final pollEnded = ref.watch(
      feedProv.select(
        (s) => s.pollEnded,
      ),
    );
    final isSendingPoll = ref.watch(
      feedProv.select(
        (s) => s.isSendingPoll,
      ),
    );
    final postCardNotifier = ref.read(
      feedProv.notifier,
    );
    final options =
        List<PollOption>.from(
          postWithUserState.post.poll!.options ?? [],
        )..sort(
          (a, b) => (a.option ?? '').compareTo(
            b.option ?? '',
          ),
        );
    final votesMap = {
      for (final v in optionVoters) v.optionId: v.votesCount ?? 0,
    };
    final listView = ListView.separated(
      itemCount: options.length,
      shrinkWrap: true,
      padding: showPadding
          ? const EdgeInsets.symmetric(
              horizontal: 15,
            )
          : EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 10,
        );
      },
      itemBuilder: (context, index) {
        final option = options[index];
        final numberOfOptionVotes = votesMap[option.id] ?? 0;
        final userVote = votedOption?.id == option.id;
        final highestVote = votesMap.values.isEmpty
            ? 0
            : votesMap.values.reduce(
                (a, b) => a > b ? a : b,
              );
        final optionWidget = GestureDetector(
          onTap: pollEnded || isSendingPoll || !canVote
              ? null
              : () async {
                  await postCardNotifier.castVote(
                    postWithUserState.post.id!,
                    option.id!,
                  );
                },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10,
              ),
              color: highestVote == numberOfOptionVotes && highestVote != 0
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
                Flexible(
                  child: ListTile(
                    contentPadding: const EdgeInsets.only(
                      left: 15,
                    ),
                    title: Text(
                      option.option!,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontWeight: userVote
                            ? FontWeight.w600
                            : FontWeight.normal,
                      ),
                    ),
                    subtitle: Row(
                      spacing: 5,
                      children: [
                        Text(
                          totalVotes != 0
                              ? '${((numberOfOptionVotes / totalVotes) * 100).toStringAsFixed(
                                  2,
                                )}%'
                              : '0.00%',
                          style: Theme.of(context).textTheme.labelMedium!
                              .copyWith(
                                color: Theme.of(context).hintColor,
                                fontSize: 12,
                              ),
                        ),
                        Text(
                          ' • ',
                          style: Theme.of(context).textTheme.labelMedium!
                              .copyWith(
                                color: Theme.of(context).hintColor,
                                fontSize: 12,
                              ),
                        ),
                        Text(
                          numberOfOptionVotes == 0
                              ? 'No votes yet'
                              : numberOfOptionVotes == 1
                              ? '1 vote'
                              : ' ${THelperFunctions.humanizeNumber(numberOfOptionVotes)} votes',
                          style: Theme.of(context).textTheme.labelMedium!
                              .copyWith(
                                color: Theme.of(context).hintColor,
                                fontSize: 12,
                              ),
                        ),
                      ],
                    ),
                    selected: userVote,
                  ),
                ),
                if (userVote)
                  Checkbox(
                    value: userVote,
                    onChanged: (_) {},
                  ),
              ],
            ),
          ),
        );
        return optionWidget;
      },
    );
    return listView;
  }
}
