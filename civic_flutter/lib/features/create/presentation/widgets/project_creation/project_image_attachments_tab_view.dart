import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/create/create.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectImageAttachmentsTabView extends ConsumerWidget {
  const ProjectImageAttachmentsTabView({
    required this.project,
    super.key,
  });

  final Project project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageUrls = ref.watch(
      createProjectNotifProvider(project).select(
        (s) => s.imageUrls,
      ),
    );
    final projectNotifier = ref.read(
      createProjectNotifProvider(
        project,
      ).notifier,
    );
    final current = ref.watch(
      projectImageAttachmentPageChangedProvider,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: ContentCreationImageViewer(
        imageUrls: imageUrls,
        current: current,
        pickImage: projectNotifier.pickPicture,
        takeImage: projectNotifier.takePicture,
        removeAllImages: projectNotifier.removeAllImages,
        removeImageAtIndex: projectNotifier.removeImageAtIndex,
        imageLength: imageUrls.length,
        maxLength: 5,
        pageIndex: ref.watch(projectImageAttachmentPageChangedProvider) + 1,
        onPageChanged: (index, reason) {
          ref
              .read(
                projectImageAttachmentPageChangedProvider.notifier,
              )
              .carouselPageChanged(
                index,
                reason,
              );
        },
      ),
    );
  }
}
