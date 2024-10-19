import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/providers/location_service_provider.dart';
import 'package:civic_flutter/core/providers/media_provider.dart';
import 'package:civic_flutter/core/providers/mention_hashtag_link_provider.dart';
import 'package:civic_flutter/core/providers/tag_selections_provider.dart';
import 'package:civic_flutter/core/toasts_messages/toast_messages.dart';
import 'package:civic_flutter/core/widgets/create_content/create_content_dialog.dart';
import 'package:civic_flutter/features/feed/presentation/routes/feed_routes.dart';
import 'package:civic_flutter/features/post/presentation/provider/post_draft_provider.dart';
import 'package:civic_flutter/features/post/presentation/provider/post_text_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class DraftPostsIcons extends ConsumerWidget {
  const DraftPostsIcons({
    super.key,
    required this.post,
    required this.hasImage,
    required this.hasText,
    required this.hasVideo,
    required this.index,
  });

  final DraftPost post;
  final bool hasVideo;
  final bool hasText;
  final bool hasImage;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: TSizes.sm,
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
              ref
                  .read(
                    mediaProvider.notifier,
                  )
                  .clearMedia();
              ref
                  .read(
                    postTextProvider.notifier,
                  )
                  .reset();
              if (hasVideo) {
                ref
                    .read(
                      mediaProvider.notifier,
                    )
                    .setVideo(
                      post.videoPath,
                    );
              }
              if (hasImage) {
                ref
                    .read(
                      mediaProvider.notifier,
                    )
                    .setDraftImage(
                      post.imagesPath,
                    );
              }
              if (hasText) {
                ref
                    .read(
                      postTextProvider.notifier,
                    )
                    .setText(
                      post.text,
                    );
              }
              if (post.locations.isNotEmpty) {
                ref
                    .read(
                      selectLocationsProvider.notifier,
                    )
                    .setLocations(
                      post.locations,
                    );
              }
              if (post.taggedUsers.isNotEmpty) {
                ref
                    .read(
                      tagSelectionsProvider.notifier,
                    )
                    .setTags(
                      post.taggedUsers,
                    );
              }
              if (post.mentions.isNotEmpty) {
                ref
                    .read(
                      selectedMentionsProvider.notifier,
                    )
                    .setMentions(
                      post.mentions,
                    );
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
                  final result =
                      await ref.read(postDraftsProvider.notifier).deleteDraftById(
                            post,
                            index,
                          );
                  if (result) {
                    TToastMessages.successToast(
                      'Your draft has been deleted.',
                    );
                  }
                  if (context.mounted) context.pop();
                  if (ref.read(postDraftsProvider).isEmpty) {
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
                  await ref.read(postDraftsProvider.notifier).sendDraftPost(
                        post,
                        index,
                      );
                },
              );
              ref.read(mediaVideoPlayerProvider.notifier).dispose();
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
