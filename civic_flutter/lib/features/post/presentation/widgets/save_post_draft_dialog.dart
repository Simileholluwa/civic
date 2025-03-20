import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:civic_flutter/features/feed/presentation/routes/feed_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

Future<bool?> savePostDraftDialog(
  WidgetRef ref,
  BuildContext context,
  PostState postState,
) {
  return postDialog(
    context: context,
    title: 'Save post as draft?',
    description: 'Draft post will be saved in drafts for '
        'a maximum of 10 days.',
    onTapSkipButton: () {
      if (postState.videoUrl.isNotEmpty) {
        ref
            .read(mediaVideoPlayerProvider(postState.videoUrl).notifier)
            .dispose();
      }
      context.pop();
      context.pop();
    },
    activeButtonText: 'Save as draft',
    activeButtonLoading: false,
    skipButtonLoading: false,
    skipText: "Don't save",
    onTapActiveButton: () async {
      if (postState.videoUrl.isNotEmpty) {
        ref
            .read(
              mediaVideoPlayerProvider(
                postState.videoUrl,
              ).notifier,
            )
            .dispose();
      }
      if (context.mounted) {
        context.go(
          FeedRoutes.namespace,
          extra: null,
        );
      }
      final result = await ref.read(postDraftsProvider.notifier).saveDraftPost(
            PostHelperFunctions.createDraftPostFromPoststate(
              postState,
              ref,
            ),
          );
      if (result) {
        TToastMessages.successToast(
          'Your post has been saved as draft.',
        );
      }
    },
  );
}
