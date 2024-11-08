import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/widgets/create_content/create_content_text_counter.dart';
import 'package:civic_flutter/features/post/presentation/helpers/post_helper_functons.dart';
import 'package:civic_flutter/features/post/presentation/provider/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class PostBottomOptions extends ConsumerWidget {
  const PostBottomOptions({
    super.key,
     required this.post,
  });
  final Post post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postState = ref.watch(regularPostProvider(post));
    return Container(
      height: 55,
      padding: const EdgeInsets.only(
        left: TSizes.xs,
        right: TSizes.sm,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Theme.of(context).dividerColor,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  PostHelperFunctions.tagUsersBottomSheet(
                    context,
                    post,
                  );
                },
                icon: const Icon(
                  Iconsax.tag_user5,
                  size: 27,
                  color: TColors.primary,
                ),
              ),
              const SizedBox(
                width: TSizes.xs,
              ),
              IconButton(
                onPressed: () => PostHelperFunctions.selectLocation(
                  context,
                  post,
                ),
                icon: const Icon(
                  Iconsax.location5,
                  size: 27,
                  color: TColors.primary,
                ),
              ),
              const SizedBox(
                width: TSizes.xs,
              ),
              IconButton(
                onPressed: () {
                  THelperFunctions.showScheduleDialog(
                    context,
                  );
                },
                icon: const Icon(
                  Icons.timer,
                  size: 27,
                  color: TColors.primary,
                ),
              ),
              const SizedBox(
                width: TSizes.xs,
              ),
                IconButton(
                  onPressed: () => PostHelperFunctions.showSelectMediaDialog(
                    context,
                    post,
                  ),
                  icon: const Icon(
                    Iconsax.gallery5,
                    color: TColors.primary,
                    size: 27,
                  ),
                ),
            ],
          ),
           Padding(
            padding: const EdgeInsets.only(
              right: TSizes.sm,
            ),
            child: CreatContentTextCounter(
              maxLength: 2500,
              currentTextLength: postState.text.length,
            ),
          ),
        ],
      ),
    );
  }
}
