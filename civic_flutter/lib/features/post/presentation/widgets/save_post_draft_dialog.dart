import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/providers/media_provider.dart';
import 'package:civic_flutter/core/providers/mention_hashtag_link_provider.dart';
import 'package:civic_flutter/core/toasts_messages/toast_messages.dart';
import 'package:civic_flutter/core/widgets/create_content/create_content_dialog.dart';
import 'package:civic_flutter/features/feed/presentation/routes/feed_routes.dart';
import 'package:civic_flutter/features/post/presentation/provider/post_draft_provider.dart';
import 'package:civic_flutter/features/post/presentation/provider/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

Future<bool?> savePostDraftDialog(
  WidgetRef ref,
  BuildContext context,
  Post post,
) {
  final postState = ref.watch(regularPostProvider(post));
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
      if (post.videoUrl.isNotEmpty) {
        ref
            .read(mediaVideoPlayerProvider(postState.videoUrl).notifier)
            .dispose();
      }
      if (context.mounted) {
        context.go(
          FeedRoutes.namespace,
          extra: null,
        );
      }
      final result = await ref.read(postDraftsProvider.notifier).saveDraftPost(
            DraftPost(
              draftId: DateTime.now().millisecondsSinceEpoch,
              postType: THelperFunctions.determinePostType(
                text: postState.text,
                pickedImages: postState.imageUrls,
                pickedVideo: postState.videoUrl,
              ),
              text: postState.text,
              imagesPath: postState.imageUrls,
              videoPath: postState.videoUrl,
              taggedUsers: postState.taggedUsers,
              locations: postState.locations,
              createdAt: DateTime.now(),
              mentions: ref.watch(selectedMentionsProvider),
              tags: ref.watch(hashtagsProvider(postState.text)),
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
