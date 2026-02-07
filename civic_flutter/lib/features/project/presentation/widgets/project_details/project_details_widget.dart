import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';

class ProjectDetailsWidget extends StatelessWidget {
  const ProjectDetailsWidget({
    required this.project,
    super.key,
  });

  final Project project;

  @override
  Widget build(BuildContext context) {
    final imagesUrl = project.projectMediaAssets!
        .where((e) => e.kind == MediaKind.image)
        .map((e) => e.publicUrl)
        .toList();
    final aspectRatio = imagesUrl.isNotEmpty
        ? project.projectMediaAssets!
              .firstWhere(
                (e) => e.kind == MediaKind.image,
              )
              .aspectRatio
        : 1.0;
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (imagesUrl.length == 1)
            ContentSingleCachedImage(
              imageUrl: imagesUrl.first!,
              aspectRatio: aspectRatio!,
            )
          else
            ContentImageViewer(
              mediaAssets: project.projectMediaAssets!
                  .where((e) => e.kind == MediaKind.image)
                  .toList(),
              addPadding: false,
            ),
          Padding(
            padding: const EdgeInsets.only(
              top: 5,
            ),
            child: Text(
              project.title!,
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontSize: 23,
              ),
            ),
          ),
          ProjectDocumentDescription(
            project: project,
          ),
        ],
      ),
    );
  }
}
