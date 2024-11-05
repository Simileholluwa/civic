import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/router/route_names.dart';
import 'package:civic_flutter/core/toasts_messages/toast_messages.dart';
import 'package:civic_flutter/core/widgets/create_content/create_content_dialog.dart';
import 'package:civic_flutter/features/feed/presentation/routes/feed_routes.dart';
import 'package:civic_flutter/features/post/presentation/provider/post_draft_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class DraftPostsIcons extends ConsumerWidget {
  const DraftPostsIcons({
    super.key,
    required this.post,
    required this.index,
  });

  final DraftPost post;
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
              context.pop();
              context.replace(
                AppRoutes.createPost,
                extra: {
                  'id': 0,
                  'draft': post,
                }
              );
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
