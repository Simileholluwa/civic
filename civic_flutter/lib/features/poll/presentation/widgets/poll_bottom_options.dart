import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/poll/poll.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class PollBottomOptions extends ConsumerWidget {
  const PollBottomOptions({
    super.key,
     this.poll,
  });
  final Poll? poll;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pollState = ref.watch(pollsOptionsProvider(poll));
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
                  PollHelperFunctions.tagUsersBottomSheet(
                    context,
                    poll!,
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
                onPressed: () => PollHelperFunctions.selectLocation(
                  context,
                  poll!,
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
              
            ],
          ),
            Padding(
            padding: const EdgeInsets.only(
              right: TSizes.sm,
            ),
            child: CreatContentTextCounter(
              maxLength: 300,
              currentTextLength: pollState.question.length,
            ),
          ),
        ],
      ),
    );
  }
}
