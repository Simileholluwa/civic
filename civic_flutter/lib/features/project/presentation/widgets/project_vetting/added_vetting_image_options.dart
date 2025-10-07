import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class AddedVettingImageOptions extends ConsumerWidget {
  const AddedVettingImageOptions({
    required this.projectVetting, super.key,
  });

  final ProjectVetting? projectVetting;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vettedProjectState = ref.watch(
      projectVetProvider(
        projectVetting,
      ),
    );
    final vettedProjectNotifier = ref.watch(
      projectVetProvider(
        projectVetting,
      ).notifier,
    );

    final pageIndex = ref.watch(vettingImagePageChangedProvider) + 1;
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
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
                onPressed: vettedProjectNotifier.clearImages,
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
                vettedProjectNotifier.removeImageAtIndex(
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
            if (vettedProjectState.images.length < 5)
              IconButton(
                onPressed: vettedProjectNotifier.pickImageProof,
                icon: const Icon(
                  Iconsax.gallery,
                  color: TColors.textWhite,
                ),
              ),
            if (vettedProjectState.images.length < 5)
              IconButton(
                onPressed: vettedProjectNotifier.captureImageProof,
                icon: const Icon(
                  Iconsax.camera,
                  color: TColors.textWhite,
                ),
              ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Iconsax.magicpen,
                color: TColors.textWhite,
                size: 22,
              ),
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
                  '$pageIndex/${vettedProjectState.images.length}',
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
