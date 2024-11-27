import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/poll/poll.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PollDurationAndAddOptions extends ConsumerWidget {
  const PollDurationAndAddOptions({
    super.key,
    required this.poll,
  });

  final Poll poll;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pollState = ref.watch(pollsOptionsProvider(poll));
    final pollNotifier = ref.read(pollsOptionsProvider(poll).notifier);
    return Container(
      height: 50,
      margin: const EdgeInsets.all(TSizes.md + 4,),
      padding: const EdgeInsets.symmetric(
        horizontal: TSizes.md + 4,
        vertical: TSizes.sm,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).dividerColor,
        ),
        borderRadius: BorderRadius.circular(
          TSizes.sm,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: pollState.controllers.length < 5
                ? () => pollNotifier.addOption(text: '')
                : null,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 8,
              ),
              child: Icon(
                Icons.add,
                color: pollState.controllers.length < 5
                    ? TColors.primary
                    : Theme.of(context).disabledColor,
              ),
            ),
          ),
          const VerticalDivider(),
          InkWell(
            onTap: () =>
                pollDurationDialog(context: context, poll: poll),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.calendar_month,
                      color: TColors.primary),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    '${pollState.duration} ${pollState.duration == 1 ? 'Day' : 'Days'}',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
