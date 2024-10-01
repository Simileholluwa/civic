import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/providers/tag_selections_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class SelectedTagsWidget extends ConsumerWidget {
  const SelectedTagsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tagProvider = ref.watch(tagSelectionsProvider.notifier);
    final tagState = ref.watch(tagSelectionsProvider);
    return InkWell(
      onTap: () => THelperFunctions.tagUsersBottomSheet(context),
      child: Ink(
        padding: const EdgeInsets.only(
          left: TSizes.md - 2,
          right: TSizes.md,
        ),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Theme.of(context).dividerColor,
            ),
          ),
        ),
        height: 50,
        width: double.maxFinite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Iconsax.tag_user5,
                  size: 20,
                  color: TColors.primary,
                ),
                const SizedBox(
                  width: TSizes.sm,
                ),
                Text(
                  'With ${tagState.first.userInfo!.fullName ?? tagState.first.userInfo!.userName} ${tagState.length == 1 ? '' : 'and ${tagState.length - 1 == 1 ? '1 other' : '${tagState.length - 1} others'}'}',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: TColors.primary,
                      ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                tagProvider.clearSelections();
              },
              child: const Icon(
                Iconsax.close_square5,
                color: TColors.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
