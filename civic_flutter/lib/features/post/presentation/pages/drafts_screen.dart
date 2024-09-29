import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/device/device_utility.dart';
import 'package:civic_flutter/core/providers/media_provider.dart';
// import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/widgets/content_dialog.dart';
import 'package:civic_flutter/features/post/presentation/provider/post_draft_provider.dart';
import 'package:civic_flutter/features/post/presentation/widgets/draft_posts_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DraftsScreen extends ConsumerStatefulWidget {
  const DraftsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DraftsScreenState();
}

class _DraftsScreenState extends ConsumerState<DraftsScreen> {
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(postDraftsProvider);
    // final isDark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          TDeviceUtils.getAppBarHeight() + 20,
        ),
        child: Container(
          margin: const EdgeInsets.only(
            top: TSizes.md + 4,
          ),
          child: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
              onPressed: () {
                context.pop();
                ref.watch(mediaVideoPlayerProvider.notifier).dispose();
              },
              icon: const Icon(
                Icons.clear,
              ),
            ),
            titleSpacing: 0,
            actions: [
              Padding(
                padding: const EdgeInsets.only(
                  right: TSizes.sm,
                ),
                child: TextButton(
                  onPressed:
                      data.isEmpty ? null : () => deleteDraftsDialog(context),
                  child: Text(
                    'DELETE ALL',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: data.isEmpty ? null : TColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(
          vertical: TSizes.sm,
        ),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final type = data[index].postType;
          switch (type) {
            case PostType.image || PostType.images:
              return DraftPostsWidget(
                post: data[index],
                hasImage: true,
                index: index,
              );
            case PostType.text:
              return DraftPostsWidget(
                post: data[index],
                hasText: true,
                index: index,
              );
            case PostType.textWithImage || PostType.textWithImages:
              return DraftPostsWidget(
                post: data[index],
                hasText: true,
                hasImage: true,
                index: index,
              );
            case PostType.video:
              ref.watch(mediaProvider.notifier).setVideo(data[index].videoPath);
              return DraftPostsWidget(
                post: data[index],
                hasVideo: true,
                index: index,
              );
            case PostType.textWithVideo:
              return DraftPostsWidget(
                post: data[index],
                hasText: true,
                hasVideo: true,
                index: index,
              );
            case PostType.none:
              return const Text('none');
          }
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: TSizes.md,
          );
        },
        itemCount: data.length,
      ),
    );
  }

  Future<bool?> deleteDraftsDialog(BuildContext context) {
    return postDialog(
      context: context,
      title: 'Delete all drafts?',
      description: 'Proceed with caution as this action is '
          'irreversible.',
      onTapSkipButton: context.pop,
      activeButtonText: 'Delete all',
      activeButtonLoading: false,
      skipButtonLoading: false,
      skipText: 'Cancel',
      onTapActiveButton: () async {
        context.pop();
        final result =
            await ref.read(postDraftsProvider.notifier).deleteAllDrafts();
        if (result) {
          if (context.mounted) context.pop();
        }
      },
    );
  }
}
