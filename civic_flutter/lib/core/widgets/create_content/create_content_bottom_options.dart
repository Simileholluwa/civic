import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/widgets/create_content/create_content_text_counter.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CreateContentBottomOptions extends StatelessWidget {
  const CreateContentBottomOptions({
    super.key,
     this.showSelectMedia = true,
     this.maxLength = 2500,
  });

  final bool showSelectMedia;
  final int maxLength;

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
              if (showSelectMedia)
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
           Padding(
            padding: const EdgeInsets.only(
              right: TSizes.sm,
            ),
            child: CreatContentTextCounter(
              maxLength: maxLength,
            ),
          ),
        ],
      ),
    );
  }
}
