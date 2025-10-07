import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

Future<bool?> saveProjectDraftDialog(
  WidgetRef ref,
  BuildContext context,
  Project project,
) {
  return postDialog(
    context: context,
    title: 'Save project as draft?',
    description: 'Would you like to save the changes you have made as draft?',
    onTapSkipButton: () {
      context
        ..pop()
        ..pop();
    },
    activeButtonText: 'Save as draft',
    activeButtonLoading: false,
    skipButtonLoading: false,
    skipText: "Don't save",
    onTapActiveButton: () async {
      if (context.mounted) {
        context.go(
          ProjectRoutes.namespace,
        );
      }
      await ref
          .read(projectProviderProvider(project).notifier)
          .saveProjectDraft();

      TToastMessages.successToast(
        'Your project has been saved as draft.',
      );
    },
  );
}
