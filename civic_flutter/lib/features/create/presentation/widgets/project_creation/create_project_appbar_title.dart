import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class CreateProjectAppbarTitle extends ConsumerWidget {
  const CreateProjectAppbarTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPageState = ref.watch(projectCurrentPageProvider);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: TSizes.sm,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(200),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Iconsax.warning_2,
            color: TColors.primary,
            size: 17,
          ),
          const SizedBox(width: 10),
          Text(
            currentPageState == 3
                ? 'All but funding note is required'
                : currentPageState == 4
                    ? 'Provide at least one location'
                    : currentPageState == 5
                        ? 'Provide at least one image'
                        : 'All fields are required',
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: TColors.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
