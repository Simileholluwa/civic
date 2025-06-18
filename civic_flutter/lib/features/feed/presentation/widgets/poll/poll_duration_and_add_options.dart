import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class PollDurationAndAddOptions extends ConsumerWidget {
  const PollDurationAndAddOptions({
    super.key,
    required this.post,
    required this.isEditing,
  });

  final Post post;
  final bool isEditing;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postState = ref.watch(feedProvider(post));
    final postNotifier = ref.read(feedProvider(post).notifier);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        spacing: 20,
        children: [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: postState.controllers.length < 4 && !isEditing
                  ? () => postNotifier.addOption(text: '')
                  : null,
              label: const Text(
                'Add',
              ),
              icon: Icon(
                Iconsax.add_circle,
                size: 20,
                color: postState.controllers.length < 4 && !isEditing
                    ? TColors.primary
                    : Theme.of(context).disabledColor,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: postState.controllers.length < 4
                    ? Theme.of(context).cardColor
                    : Theme.of(context).disabledColor,
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 5,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ElevatedButton.icon(
              onPressed: !isEditing
                  ? () async {
                      final selectedDateTime = await createContentPollDuration(
                        context,
                      );
                      if (selectedDateTime != null) {
                        postNotifier.setExpiration(selectedDateTime);
                      }
                    }
                  : null,
              label: Text(
                DateFormat('hh:mm a • MMM d, y').format(
                  postState.expiresAt!,
                ),
              ),
              icon: Icon(
                Iconsax.calendar_1,
                size: 20,
                color: !isEditing
                    ? TColors.primary
                    : Theme.of(context).disabledColor,
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
