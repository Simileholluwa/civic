import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/providers/media_provider.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/widgets/create_content/create_content_drafts_appbar.dart';
import 'package:civic_flutter/features/post/presentation/provider/post_draft_provider.dart';
import 'package:civic_flutter/features/post/presentation/widgets/draft_posts_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PostDraftsScreen extends ConsumerWidget {
  const PostDraftsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(postDraftsProvider);
    // final isDark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(
          50,
        ),
        child: CreateContentDraftsAppbar(
          actionPressed: () => THelperFunctions.deleteDraftsDialog(
            context,
            ref,
          ),
          data: data,
          leadingPressed: () {
            context.pop();
            ref.watch(mediaVideoPlayerProvider.notifier).dispose();
          },
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
            height: TSizes.sm,
          );
        },
        itemCount: data.length,
      ),
    );
  }
}
