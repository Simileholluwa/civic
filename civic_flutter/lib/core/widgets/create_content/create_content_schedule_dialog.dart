import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

Future<bool?> createContentScheduleDialog({
  required BuildContext context,
}) {
  return showDialog<bool>(
      context: context,
      builder: (context) {
        return Consumer(builder: (context, ref, _) {
          final scheduledDateTimeProvider =
              ref.watch(postScheduledDateTimeProvider.notifier);
          return AlertDialog(
            contentPadding: const EdgeInsets.only(
              bottom: 16,
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Schedule post',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      GestureDetector(
                        onTap: context.pop,
                        child: const Icon(
                          Icons.clear,
                          color: TColors.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  height: 0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Scheduled post will be sent at the'
                        ' selected date and time.',
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      AppTextField(
                        textController:
                            scheduledDateTimeProvider.textController(),
                        prefixIcon: Iconsax.calendar5,
                        hintText: 'Select date and time',
                        validator: TValidator.validateEmail,
                        readOnly: true,
                        onTap: () async {
                          scheduledDateTimeProvider.clearDateTime();
                          scheduledDateTimeProvider.setDateTime(
                            await createContentpickDateAndTime(context),
                          );
                          if (context.mounted) {
                            context.pop();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
      });
}
