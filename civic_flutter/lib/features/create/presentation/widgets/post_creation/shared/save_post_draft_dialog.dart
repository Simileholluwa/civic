import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<bool?> savePostDraftDialog(
  BuildContext context,
  PostType postType,
) {
  final type = postType == PostType.article
      ? 'article'
      : postType == PostType.poll
          ? 'poll'
          : 'post';
  return postDialog(
    context: context,
    title: 'Save $type as draft?',
    description: 'Would you like to save the changes you have made as draft?',
    onTapSkipButton: () {
      context.pop(false);
    },
    activeButtonText: 'Save as draft',
    activeButtonLoading: false,
    skipButtonLoading: false,
    skipText: "Don't save",
    onTapActiveButton: () async {
      if (context.mounted) {
        // User chose to save as draft -> return true
        context.pop(true);
      }
    },
  );
}
