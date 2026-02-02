import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/create/create.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectPDFAttachmentsTabView extends ConsumerWidget {
  const ProjectPDFAttachmentsTabView({
    required this.project,
    super.key,
  });

  final Project project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pdfPaths = ref.watch(
      createProjectNotifProvider(project).select(
        (s) => s.pdfUrls,
      ),
    );
    final notifier = ref.read(
      createProjectNotifProvider(project).notifier,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: ContentKeepAliveWrapper(
        child: Column(
          children: [
            if (pdfPaths.isEmpty)
              ProjectPdfPicker(
                project: project,
              )
            else
              Column(
                spacing: 10,
                children: [
                  ...pdfPaths.asMap().entries.map(
                    (entry) {
                      final index = entry.key;
                      final pdf = entry.value;
                      return GestureDetector(
                        onTap: () async {
                          await launchUrl(
                            Uri.parse(
                              pdf,
                            ),
                          );
                        },
                        child: PdfAttacmentsDetail(
                          pdfPaths: pdfPaths,
                          index: index,
                          showRemove: true,
                          onRemove: () => notifier.removePDFAtIndex(index),
                        ),
                      );
                    },
                  ),
                  if (pdfPaths.length < 5)
                    ProjectPdfPicker(
                      project: project,
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
