import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CreateContentPrivacy extends StatelessWidget {
  const CreateContentPrivacy({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Ink(
        padding: const EdgeInsets.only(
          left: TSizes.md - 2,
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
          children: [
            const Icon(
              Iconsax.global5,
              size: 20,
              color: TColors.primary,
            ),
            const SizedBox(
              width: TSizes.sm,
            ),
            Text(
              'Everyone can see this post and reply',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: TColors.primary,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
