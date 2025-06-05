import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/poll/poll.dart';
import 'package:civic_flutter/features/feed/presentation/routes/feed_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

Future<bool?> savePollDraftDialog(
  WidgetRef ref,
  BuildContext context,
  Poll poll,
) {
  return postDialog(
    context: context,
    title: 'Save poll as draft?',
    description: 'Would you like to save the changes you have made?',
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

      final pollNotifier = ref.read(
        pollsOptionsProvider(
          poll,
        ).notifier,
      );
      await pollNotifier.savePollAsDraft(
        poll.id,
        null,
      );
    },
  );
}
