import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

Future<bool?> savePostDraftDialog(
  WidgetRef ref,
  BuildContext context,
  Post post,
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
      context.pop();
      context.pop();
    },
    activeButtonText: 'Save as draft',
    activeButtonLoading: false,
    skipButtonLoading: false,
    skipText: "Don't save",
    onTapActiveButton: () async {
      if (context.mounted) {
        context.pop();
      }
      final postNotifier = ref.read(
        feedProvider(
          post,
        ).notifier,
      );
      if (type == 'article') {
        await postNotifier.saveArticleAsDraft(
          post.id,
          null,
        );
      } else if (type == 'poll') {
        await postNotifier.savePollAsDraft(
          post.id,
          null,
        );
      } else {
        await postNotifier.savePostAsDraft(
          post.id,
          null,
        );
      }
    },
  );
}
