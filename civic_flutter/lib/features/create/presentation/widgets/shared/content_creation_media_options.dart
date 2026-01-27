import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class ContentCreationMediaOptions extends ConsumerWidget {
  const ContentCreationMediaOptions({
    required this.pageIndex,
    required this.imageLength,
    required this.maxLength,
    required this.pickImage,
    required this.removeAllImages,
    required this.removeImageAtIndex,
    required this.takeImage,
    super.key,
  });

  final int pageIndex;
  final VoidCallback removeAllImages;
  final void Function(int) removeImageAtIndex;
  final int maxLength;
  final int imageLength;
  final VoidCallback pickImage;
  final VoidCallback takeImage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16,
      ),
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(
            100,
          ),
          border: Border.all(
            color: Theme.of(context).dividerColor,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
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
                onPressed: removeAllImages,
                icon: const Icon(
                  CupertinoIcons.clear,
                  size: 22,
                ),
              ),
            ),
            const SizedBox(
              width: TSizes.xs,
            ),
            IconButton(
              onPressed: () {
                removeImageAtIndex(
                  pageIndex - 1,
                );
              },
              icon: const Icon(
                Iconsax.trash,
                color: TColors.textWhite,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Iconsax.crop,
                color: TColors.textWhite,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Iconsax.magicpen,
                size: 22,
                color: TColors.textWhite,
              ),
            ),
            if (imageLength < maxLength)
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Iconsax.gallery_add),
                    onPressed: pickImage,
                    color: TColors.textWhite,
                  ),
                  IconButton(
                    icon: const Icon(Iconsax.camera),
                    onPressed: takeImage,
                    color: TColors.textWhite,
                  ),
                ],
              ),
            const SizedBox(
              width: TSizes.xs,
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
                  '$pageIndex/$imageLength',
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
