import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/widgets/text_counter.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CreatePostOptions extends StatelessWidget {
  const CreatePostOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                  THelperFunctions.tagUsersBottomSheet(
                    context,
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
                onPressed: () => THelperFunctions.selectLocation(
                  context,
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
                onPressed: () => THelperFunctions.showSelectMediaDialog(
                  context,
                ),
                icon: const Icon(
                  Iconsax.gallery5,
                  color: TColors.primary,
                  size: 27,
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(
              right: TSizes.sm,
            ),
            child: TextCounter(
              maxLength: 2500,
            ),
          ),
        ],
      ),
    );
  }
}
