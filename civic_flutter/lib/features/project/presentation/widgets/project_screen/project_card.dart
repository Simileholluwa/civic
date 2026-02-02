import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    required this.projectWithUserState,
    super.key,
    this.canTap = true,
    this.showInteractions = true,
    this.maxHeight = 300,
    this.creatorAvatarRadius = 25,
    this.showPolitcalStatus = true,
  });

  final bool canTap;
  final double creatorAvatarRadius;
  final double maxHeight;
  final ProjectWithUserState projectWithUserState;
  final bool showInteractions;
  final bool showPolitcalStatus;

  @override
  Widget build(BuildContext context) {
    final project = projectWithUserState.project;
    final imagesUrl =
        project.projectMediaAssets
            ?.where((e) => e.kind == MediaKind.image)
            .map((e) => e.publicUrl)
            .whereType<String>()
            .toList() ??
        [];
    return InkWell(
      onTap: canTap
          ? () async {
              await context.push(
                '/project/${project.id}',
                extra: project,
              );
            }
          : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 12, 15, 0),
            child: ContentCreatorInfo(
              creator: project.owner!,
              timeAgo: THelperFunctions.humanizeDateTime(
                project.dateCreated!,
              ),
              radius: creatorAvatarRadius,
              showPoliticalStatus: showPolitcalStatus,
              onMoreTapped: () async {
                await showDialog<dynamic>(
                  context: context,
                  builder: (ctx) {
                    return AlertDialog(
                      contentPadding: const EdgeInsets.only(
                        bottom: 16,
                      ),
                      content: ShowProjectActions(
                        projectWithUserState: projectWithUserState,
                        fromDetails: true,
                      ),
                    );
                  },
                );
              },
            ),
          ),
          if (imagesUrl.length == 1)
            ContentSingleCachedImage(
              imageUrl: imagesUrl.first,
              aspectRatio:
                  project.projectMediaAssets
                      ?.firstWhere((e) => e.kind == MediaKind.image)
                      .aspectRatio ??
                  1.0,
            )
          else
            ContentImageViewer(
              mediaAssets:
                  project.projectMediaAssets
                      ?.where((e) => e.kind == MediaKind.image)
                      .toList() ??
                  [],
            ),
          ProjectQuickDetails(
            project: project,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 5,
              children: [
                Text(
                  project.title!,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ProjectPlainTextDescription(
                  project: project,
                ),
              ],
            ),
          ),
          if (showInteractions)
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 15),
              child: ProjectInteractionButtons(
                projectWithUserState: projectWithUserState,
              ),
            ),
        ],
      ),
    );
  }
}
