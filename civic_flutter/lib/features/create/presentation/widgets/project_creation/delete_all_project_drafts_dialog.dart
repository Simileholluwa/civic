import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<bool?> deleteAllProjectDraftsDialog(
  BuildContext context,
) {
  return postDialog(
    context: context,
    title: 'Delete all project drafts?',
    description:
        'Are you sure you want to delete all project drafts? This action cannot be undone',
    onTapSkipButton: () {
      context.pop(false);
    },
    activeButtonText: 'Delete all',
    activeButtonLoading: false,
    skipButtonLoading: false,
    skipText: 'Cancel',
    activeButtonColor: TColors.secondary,
    skipButtonColor: TColors.primary,
    onTapActiveButton: () async {
      context.pop(true);
    },
  );
}
