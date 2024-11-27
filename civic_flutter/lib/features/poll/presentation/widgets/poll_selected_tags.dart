import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/poll/poll.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class PollSelectedTags extends ConsumerWidget {
  const PollSelectedTags({
    super.key,
    required this.tags,
    this.showRemoveTags = true,
    this.height = 50,
    this.showTopBorder = true,
    this.poll,
  });

  final List<UserRecord> tags;
  final bool showRemoveTags;
  final double height;
  final bool showTopBorder;
  final Poll? poll;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pollNotifier = ref.watch(pollsOptionsProvider(poll).notifier);
    return InkWell(
      onTap: showRemoveTags
          ? () => PollHelperFunctions.tagUsersBottomSheet(context, poll!,)
          : null,
      child: Ink(
        padding: const EdgeInsets.only(
          left: TSizes.md - 2,
          right: TSizes.md,
        ),
        decoration: BoxDecoration(
          border: showTopBorder
              ? Border(
                  top: BorderSide(
                    color: Theme.of(context).dividerColor,
                  ),
                )
              : null,
        ),
        height: height,
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
                  'With ${tags.first.userInfo!.fullName ?? tags.first.userInfo!.userName} ${tags.length == 1 ? '' : 'and ${tags.length - 1 == 1 ? '1 other' : '${tags.length - 1} others'}'}',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: TColors.primary,
                      ),
                ),
              ],
            ),
            if (showRemoveTags)
              GestureDetector(
                onTap: () {
                  pollNotifier.clearSelections();
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
