import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
// import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/widgets/content_dialog.dart';
import 'package:civic_flutter/features/post/presentation/provider/post_draft_provider.dart';
import 'package:civic_flutter/features/post/presentation/widgets/post_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class DraftsScreen extends ConsumerStatefulWidget {
  const DraftsScreen({super.key});

  static String route() => 'drafts';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DraftsScreenState();
}

class _DraftsScreenState extends ConsumerState<DraftsScreen> {
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(postDraftsProvider);
    // final isDark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: context.pop,
          icon: const Icon(
            Iconsax.arrow_left_2,
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
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(
          vertical: TSizes.sm,
        ),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final type = data[index].postType;
          switch (type) {
            case PostType.image || PostType.images:
              return PostWidget(
                post: data[index],
                hasImage: true,
                index: index,
              );
            case PostType.text:
              return PostWidget(
                post: data[index],
                hasText: true,
                index: index,
              );
            case PostType.textWithImage || PostType.textWithImages:
              return PostWidget(
                post: data[index],
                hasText: true,
                hasImage: true,
                index: index,
              );
            case PostType.video:
              return PostWidget(
                post: data[index],
                hasVideo: true,
                index: index,
              );
            case PostType.textWithVideo:
              return PostWidget(
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

  Future<Widget?> deleteDraftsDialog(BuildContext context) {
    return postDialog(
      context: context,
      title: 'Delete all drafts?',
      description: 'Proceed with caution as this action is '
          'irreversible.',
      onTapSkipButton: context.pop,
      activeButtonText: 'Delete all',
      activeButtonLoading: false,
      skipButtonLoading: false,
      onTapActiveButton: () =>
          ref.read(postDraftsProvider.notifier).deleteAllDrafts(
                context,
              ),
    );
  }
}
