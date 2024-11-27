import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class ProjectImageAttachmentsOptions extends ConsumerWidget {
  const ProjectImageAttachmentsOptions({
    super.key,
    required this.project,
  });

  final Project project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectState = ref.watch(
      projectProviderProvider(project),
    );
    final projectNotifier = ref.watch(
      projectProviderProvider(project).notifier,
    );

    final pageIndex = ref.watch(projectImageAttachmentPageChangedProvider) + 1;
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
                onPressed: projectNotifier.removeAllImages,
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
                projectNotifier.removeImageAtIndex(
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
            if (projectState.projectImageAttachments!.length < 5)
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Iconsax.gallery_add),
                    onPressed: projectNotifier.pickPicture,
                    color: TColors.textWhite,
                  ),
                  IconButton(
                    icon: const Icon(Iconsax.camera),
                    onPressed: projectNotifier.takePicture,
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
                  '$pageIndex/${projectState.projectImageAttachments!.length}',
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
