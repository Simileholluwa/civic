import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/providers/location_service_provider.dart';
import 'package:civic_flutter/core/providers/media_provider.dart';
import 'package:civic_flutter/core/providers/mention_hashtag_link_provider.dart';
import 'package:civic_flutter/core/providers/tag_selections_provider.dart';
import 'package:civic_flutter/core/toasts_messages/toast_messages.dart';
import 'package:civic_flutter/core/widgets/content_dialog.dart';
import 'package:civic_flutter/features/feed/presentation/routes/feed_routes.dart';
import 'package:civic_flutter/features/post/presentation/provider/post_draft_provider.dart';
import 'package:civic_flutter/features/post/presentation/provider/post_text_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

Future<bool?> savePostDraftDialog(
    WidgetRef ref,
    BuildContext context,
  ) =>
      postDialog(
        context: context,
        title: 'Save post as draft?',
        description: 'Draft post will be saved in drafts for '
            'a maximum of 10 days.',
        onTapSkipButton: () {
          context.go(
            FeedRoutes.namespace,
            extra: null,
          );
          ref.read(mediaVideoPlayerProvider.notifier).dispose();
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
          ref.read(mediaVideoPlayerProvider.notifier).dispose();
          final media = ref.watch(mediaProvider);
          final videoUrl = media.isEmpty
              ? ''
              : THelperFunctions.isVideo(media.first)
                  ? media.first
                  : '';
          final imageUrls = media.isEmpty
              ? <String>[]
              : THelperFunctions.isImage(media.first)
                  ? media
                  : <String>[];
          final result =
              await ref.read(postDraftsProvider.notifier).saveDraftPost(
                    DraftPost(
                      draftId: DateTime.now().millisecondsSinceEpoch,
                      postType: THelperFunctions.determinePostType(
                        text: ref.watch(postTextProvider).text,
                        pickedImages: imageUrls,
                        pickedVideo: videoUrl,
                      ),
                      text: ref.watch(postTextProvider).text,
                      imagesPath: imageUrls,
                      videoPath: videoUrl,
                      taggedUsers: taggedUsers,
                      locations: ref.watch(selectLocationsProvider),
                      createdAt: DateTime.now(),
                      mentions: ref.watch(selectedMentionsProvider),
                      tags: ref.watch(hashtagsProvider),
                    ),
                  );
          if (result) {
            TToastMessages.successToast(
              'Your post has been saved as draft.',
            );
          }
        },
      );