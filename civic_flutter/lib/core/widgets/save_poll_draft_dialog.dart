import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/providers/location_service_provider.dart';
import 'package:civic_flutter/core/providers/mention_hashtag_link_provider.dart';
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

Future<bool?> savePollDraftDialog(
  WidgetRef ref,
  BuildContext context,
) =>
    postDialog(
      context: context,
      title: 'Save poll as draft?',
      description: 'Draft poll will be saved in drafts for '
          'a maximum of 10 days.',
      onTapSkipButton: () {
        context.go(
          FeedRoutes.namespace,
          extra: null,
        );
      },
      activeButtonText: 'Save as draft',
      activeButtonLoading: false,
      skipButtonLoading: false,
      skipText: "Don't save",
      onTapActiveButton: () async {
        if (context.mounted) {
          context.go(
            FeedRoutes.namespace,
            extra: null,
          );
        }
        final taggedUsers = ref.watch(tagSelectionsProvider);
        final result =
            await ref.read(pollDraftsProvider.notifier).saveDraftPoll(
                  DraftPoll(
                    draftId: DateTime.now().millisecondsSinceEpoch,
                    options: PollOption(
                      option: ref.watch(pollsOptionsProvider).optionText,
                      votes: 0,
                      voters: [],
                    ),
                    question: ref.watch(postTextProvider).text,
                    taggedUsers: taggedUsers,
                    locations: ref.watch(selectLocationsProvider),
                    createdAt: DateTime.now(),
                    mentions: ref.watch(selectedMentionsProvider),
                    tags: ref.watch(hashtagsProvider),
                    pollDuration: DateTime.now().add(
                      ref.watch(pollsOptionsProvider).duration,
                    ),
                  ),
                );
        if (result) {
          TToastMessages.successToast(
            'Your poll has been saved as draft.',
          );
        }
      },
    );
