import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/providers/location_service_provider.dart';
import 'package:civic_flutter/core/providers/tag_selections_provider.dart';
import 'package:civic_flutter/core/toasts_messages/toast_messages.dart';
import 'package:civic_flutter/core/widgets/content_dialog.dart';
import 'package:civic_flutter/features/feed/presentation/routes/feed_routes.dart';
import 'package:civic_flutter/features/poll/presentation/providers/poll_draft_provider.dart';
import 'package:civic_flutter/features/poll/presentation/providers/poll_provider.dart';
import 'package:civic_flutter/features/post/presentation/provider/post_text_provider.dart';
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
    final pollProvider = ref.watch(pollsOptionsProvider.notifier);
    final pollState = ref.watch(pollsOptionsProvider);
    final locationProvider = ref.watch(selectLocationsProvider.notifier);
    final tagggeUserProvider = ref.watch(tagSelectionsProvider.notifier);
    final postText = ref.read(postTextProvider.notifier);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: TSizes.sm,
      ),
      margin: const EdgeInsets.only(
        right: TSizes.md,
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
              postText.setText(poll.question);
              pollProvider.setQuestion(poll.question);
              pollProvider.setDuration(
                Duration(days: poll.pollDuration!.hour),
              );
              if (poll.locations.isNotEmpty) {
                locationProvider.setLocations(poll.locations);
              }
              if (poll.taggedUsers.isNotEmpty) {
                tagggeUserProvider.setTags(poll.taggedUsers);
              }
              for (int i = 0; i < poll.options!.option.length; i++) {
                if (i < 2) {
                  pollState.copyWith(
                    optionText: [
                      pollState.controllers[i].text = poll.options!.option[i],
                    ],
                  );
                  pollState.optionText[i] = poll.options!.option[i];
                  pollProvider.updateOption(i, poll.options!.option[i]);
                } else {
                  if (pollState.controllers.length != 5) {
                    pollState.controllers.add(
                      TextEditingController(),
                    );
                  }
                  pollState.copyWith(
                    optionText: [
                      pollState.controllers[i].text = poll.options!.option[i],
                    ],
                  );
                  pollProvider.addDraftOption(poll.options!.option[i]);
                }
              }

              context.pop();
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
