import 'dart:typed_data';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectPDFAttachmentsTabView extends ConsumerWidget {
  const ProjectPDFAttachmentsTabView({
    super.key,
    required this.project,
  });

  final Project project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectCreationSate = ref.watch(projectProviderProvider(project));
    final pdfPaths = projectCreationSate.projectPDFAttachments ?? [];
    final thumbnails = pdfPaths.isEmpty
        ? const AsyncValue<List<Uint8List>>.data([])
        : ref.watch(projectPdfThumbnailProvider(pdfPaths));
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: KeepAliveWrapper(
        child: Column(
          children: [
            thumbnails.when(
              data: (data) {
                if (data.isEmpty) {
                  return ProjectPdfPicker(
                    project: project,
                  );
                }
                return ProjectPdfThumbnailViewer(
                  project: project,
                  data: data,
                );
              },
              error: (e, st) {
                return const ProjectPdfThumbnailError();
              },
              loading: () {
                return const ProjectPdfThumbnailLoader();
              },
            ),
          ],
        ),
      ),
    );
  }
}
