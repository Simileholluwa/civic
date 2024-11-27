import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class ProjectPDFttachmentsOptions extends ConsumerWidget {
  const ProjectPDFttachmentsOptions({
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
    final pdfs = projectState.projectPDFAttachments ?? [];
    final pageIndex = ref.watch(projectPDFAttachmentPageChangedProvider) + 1;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16,),
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
                onPressed: projectNotifier.removeAllPDFs,
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
                projectNotifier.removePDFAtIndex(
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
                Icons.fullscreen,
                color: TColors.textWhite,
                size: 32,
              ),
            ),
            if (pdfs.length < 5)
              IconButton(
                icon: const Icon(Iconsax.folder_add),
                onPressed: projectNotifier.pickPDFs,
                color: TColors.textWhite,
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
                  '$pageIndex/${projectState.projectPDFAttachments!.length}',
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
