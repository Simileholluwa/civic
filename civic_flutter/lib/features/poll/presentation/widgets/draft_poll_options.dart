import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/poll/poll.dart';
import 'package:civic_flutter/features/feed/presentation/routes/feed_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class DraftPollOptions extends ConsumerWidget {
  const DraftPollOptions({
    super.key,
    required this.poll,
    required this.index,
  });

  final DraftPoll poll;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: TSizes.sm,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          TSizes.sm,
        ),
        color:
            THelperFunctions.isDarkMode(context) ? TColors.dark : TColors.light,
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              context.pop();
              ref.invalidate(pollsOptionsProvider);
              context.replace(
                AppRoutes.createPoll,
                extra: {
                  'id': 0,
                  'draft': poll,
                },
              );
            },
            icon: const Icon(
              Iconsax.edit,
            ),
          ),
          IconButton(
            onPressed: () {
              postDialog(
                context: context,
                title: 'Delete draft ${index + 1}?',
                description: 'Proceed with caution as this action is '
                    'irreversible.',
                onTapSkipButton: context.pop,
                activeButtonText: 'Delete draft',
                activeButtonLoading: false,
                skipButtonLoading: false,
                skipText: 'Cancel',
                onTapActiveButton: () async {
                  final result = await ref
                      .read(pollDraftsProvider.notifier)
                      .deleteDraftById(
                        poll,
                        index,
                      );
                  if (result) {
                    TToastMessages.successToast(
                      'Your draft has been deleted.',
                    );
                  }
                  if (context.mounted) context.pop();
                  if (ref.read(pollDraftsProvider).isEmpty) {
                    if (context.mounted) context.pop();
                  }
                },
              );
            },
            icon: const Icon(
              Iconsax.trash,
            ),
          ),
          IconButton(
            onPressed: () {
              context.go(
                FeedRoutes.namespace,
                extra: () async {
                  await ref.read(pollDraftsProvider.notifier).sendDraftPoll(
                        poll,
                        index,
                      );
                },
              );
            },
            icon: const Icon(
              Iconsax.send_1,
            ),
          ),
        ],
      ),
    );
  }
}
