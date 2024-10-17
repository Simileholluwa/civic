import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/device/device_utility.dart';
import 'package:civic_flutter/core/providers/media_provider.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/features/post/presentation/provider/post_draft_provider.dart';
import 'package:civic_flutter/features/post/presentation/widgets/draft_posts_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DraftsScreen extends ConsumerWidget {
  const DraftsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(postDraftsProvider);
    // final isDark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          TDeviceUtils.getAppBarHeight() + 10,
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(
            vertical: TSizes.md,
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
                      data.isEmpty ? null : () => THelperFunctions.deleteDraftsDialog(context, ref,),
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
        padding: const EdgeInsets.only(
          bottom: TSizes.sm,
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
}
