import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/poll/poll.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        spacing: 20,
        children: [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: pollState.controllers.length < 5
                  ? () => pollNotifier.addOption(text: '')
                  : null,
              label: const Text(
                'Add option',
              ),
              icon: Icon(
                Iconsax.add_circle,
                size: 20,
                color: pollState.controllers.length < 5
                    ? TColors.primary
                    : Theme.of(context).disabledColor,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: pollState.controllers.length < 5
                    ? Theme.of(context).cardColor
                    : Theme.of(context).disabledColor,
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
            ),
          ),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () => pollDurationDialog(context: context, poll: poll),
              label: Text(
                '${pollState.duration} ${pollState.duration == 1 ? 'Day' : 'Days'}',
              ),
              icon: const Icon(
                Iconsax.calendar_1,
                size: 20,
                color: TColors.primary,
              ),
              style: ElevatedButton.styleFrom(
                
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
