import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class CreateContentSchedule extends ConsumerWidget {
  const CreateContentSchedule({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheduledDateTimeProvider =
              ref.watch(postScheduledDateTimeProvider.notifier);
    return InkWell(
      onTap: () => THelperFunctions.showScheduleDialog(context),
      child: Ink(
        padding: const EdgeInsets.only(
          left: TSizes.md - 2,
          right: TSizes.md,
        ),
        height: 55,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Theme.of(context).dividerColor,
            ),
          ),
        ),
        width: double.maxFinite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.timer,
                  size: 20,
                  color: TColors.primary,
                ),
                const SizedBox(
                  width: TSizes.sm,
                ),
                Text(
                  scheduledDateTimeProvider.humanizeDateTime(),
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: TColors.primary,
                      ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                scheduledDateTimeProvider.clearDateTime();
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
