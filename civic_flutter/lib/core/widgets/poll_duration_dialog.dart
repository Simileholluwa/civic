import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/features/poll/presentation/providers/poll_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

Future<bool?> pollDurationDialog({
  required BuildContext context,
}) {
  return showDialog<bool>(
      context: context,
      builder: (context) {
        return Consumer(builder: (context, ref, _) {
          final pollState = ref.watch(pollsOptionsProvider);
          final pollNotifier = ref.read(pollsOptionsProvider.notifier);
          final durationText = [
            '1 Day',
            '2 Days',
            '3 Days',
            '4 Days',
            '5 Days',
            '6 Days',
            '7 Days',
          ];
          final durationInt = [1, 2, 3, 4, 5, 6, 7];
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                TSizes.sm,
              ),
            ),
            
            elevation: 8,
            content: SizedBox(
              height: 435,
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Poll duration',
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
                  const SizedBox(
                    height: TSizes.md,
                  ),
                  const Divider(
                    height: 0,
                  ),
                  ListView.separated(
                    itemCount: durationText.length,
                    shrinkWrap: true,
                    separatorBuilder: (_, __) {
                      return const Divider(
                        height: 0,
                      );
                    },
                    itemBuilder: (context, index) {
                      final isSelected =
                          durationInt[index] == pollState.duration.inDays;
                      return ListTile(
                        title: Text(
                          durationText[index],
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: isSelected ? TColors.primary : Theme.of(context).iconTheme.color,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 0,),
                        onTap: () {
                          pollNotifier.setDuration(
                            Duration(
                              days: durationInt[index],
                            ),
                          );
                          context.pop();
                        },
                        trailing: isSelected ? const Icon(Icons.check, color: TColors.primary,) : null,
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        });
      });
}
