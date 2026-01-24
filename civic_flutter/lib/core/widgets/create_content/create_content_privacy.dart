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
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: TSizes.sm,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(200),
          border: Border.all(
            color: Theme.of(context).dividerColor,
            width: .5,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Iconsax.global,
              color: TColors.primary,
              size: 17,
            ),
            const SizedBox(width: 10),
            Text(
              'Change privacy',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: TColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}
