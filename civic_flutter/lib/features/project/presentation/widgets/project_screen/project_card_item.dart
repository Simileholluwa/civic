import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProjectCardItem extends ConsumerWidget {
  const ProjectCardItem({
    required this.project,
    required this.canTap,
    required this.creatorAvatarRadius,
    required this.showPolitcalStatus,
    required this.maxHeight,
    required this.showInteractions,
    super.key,
  });

  final Project project;
  final bool canTap;
  final double creatorAvatarRadius;
  final bool showPolitcalStatus;
  final double maxHeight;
  final bool showInteractions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectCardState = ref.watch(
      projectCardWidgetProvider(
        project,
      ),
    );
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
              creator: projectCardState.creator!,
              timeAgo: projectCardState.timeAgo!,
              radius: creatorAvatarRadius,
              showPoliticalStatus: showPolitcalStatus,
            ),
          ),
          if (!projectCardState.isDeleted!)
            projectCardState.imagesUrl!.length == 1
                ? ContentSingleCachedImage(
                    imageUrl: projectCardState.imagesUrl!.first,
                    aspectRatio: maxHeight,
                  )
                : ContentMultipleCachedImage(
                    imageUrls: projectCardState.imagesUrl!,
                    maxHeight: maxHeight,
                  )
          else
            DeletedProjectPlaceholder(
              project: project,
              showInteractions: showInteractions,
            ),
          if (!projectCardState.isDeleted!)
            ProjectQuickDetails(
              project: project,
            ),
          if (!projectCardState.isDeleted!)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 5,
                children: [
                  Text(
                    projectCardState.title!,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  ContentExpandableText(
                    text: projectCardState.description!,
                    onToggleTextTap: () {},
                    hasImage: true,
                    maxLines: 3,
                  ),
                ],
              ),
            ),
          if (showInteractions)
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 15),
              child: ProjectInteractionButtons(
                project: project,
              ),
            ),
        ],
      ),
    );
  }
}
