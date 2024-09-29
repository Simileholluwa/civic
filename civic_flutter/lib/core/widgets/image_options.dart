import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/providers/integer_provider.dart';
import 'package:civic_flutter/core/providers/media_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class ImageOptions extends ConsumerWidget {
  const ImageOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = THelperFunctions.isDarkMode(context);
    final controller = ref.watch(mediaProvider.notifier);
    final pageIndex = ref.watch(pageChangedProvider) + 1;
    return Padding(
      padding: const EdgeInsets.only(
        left: TSizes.md,
      ),
      child: Container(
        width: 45,
        decoration: BoxDecoration(
          color: isDark ? TColors.dark : TColors.light,
          borderRadius: BorderRadius.circular(
            100,
          ),
        ),
        child: Column(
          children: [
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).scaffoldBackgroundColor,
                border: Border.all(
                  color: Theme.of(context).dividerColor,
                ),
              ),
              child: IconButton(
                onPressed: controller.clearMedia,
                icon: const Icon(
                  CupertinoIcons.clear,
                  size: 22,
                ),
              ),
            ),
            const SizedBox(
              height: TSizes.xs,
            ),
            IconButton(
              onPressed: () {
                controller.removeImageAtIndex(
                  pageIndex - 1,
                );
              },
              icon: const Icon(
                Iconsax.trash,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Iconsax.crop,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Iconsax.magicpen,
                size: 22,
              ),
            ),
            const SizedBox(
              height: TSizes.xs,
            ),
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).scaffoldBackgroundColor,
                border: Border.all(
                  color: Theme.of(context).dividerColor,
                ),
              ),
              child: Center(
                child: Text(
                  '$pageIndex/${ref.watch(mediaProvider).length}',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
