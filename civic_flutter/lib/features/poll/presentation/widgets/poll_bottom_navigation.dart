import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/poll/poll.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PollBottomNavigation extends ConsumerWidget {
  const PollBottomNavigation({
    super.key,
    required this.poll,
  });

  final Poll poll;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheduledDateTimeState = ref.watch(postScheduledDateTimeProvider);
    final pollState = ref.watch(
      pollsOptionsProvider(
        poll,
      ),
    );
    final bottomHeight = PollHelperFunctions.getBottomNavigationBarHeight(
      scheduledDateTimeState,
      pollState.locations,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: pollState.taggedUsers.isEmpty ? bottomHeight : bottomHeight + 50,
          child: Column(
            children: [
              pollState.taggedUsers.isNotEmpty
                  ? PollSelectedTags(
                      tags: pollState.taggedUsers,
                      poll: poll,
                    )
                  : const SizedBox.shrink(),
              pollState.locations.isNotEmpty
                  ? PollSelectedLocations(
                      locations: pollState.locations,
                      poll: poll,
                    )
                  : const SizedBox.shrink(),
              scheduledDateTimeState == null
                  ? const SizedBox.shrink()
                  : const CreateContentSchedule(),
              const CreateContentPrivacy(),
              PollBottomOptions(
                poll: poll,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
