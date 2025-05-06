import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';

class ProjectCard extends ConsumerWidget {
  const ProjectCard({
    super.key,
    required this.project,
    this.canTap = true,
    this.showInteractions = true,
    this.maxHeight = 300,
    this.creatorAvatarRadius = 25,
    this.showPolitcalStatus = true,
  });

  final bool canTap;
  final double creatorAvatarRadius;
  final double maxHeight;
  final Project project;
  final bool showInteractions;
  final bool showPolitcalStatus;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final liveProject = ref.watch(
      projectStreamProvider(
        project.id!,
        project,
      ),
    );
    return liveProject.when(data: (project) {
      return ProjectCardItem(
        project: project,
        canTap: canTap,
        creatorAvatarRadius: creatorAvatarRadius,
        showPolitcalStatus: showPolitcalStatus,
        maxHeight: maxHeight,
        showInteractions: showInteractions,
      );
    }, error: (err, st) {
      return ProjectCardItem(
        project: project,
        canTap: canTap,
        creatorAvatarRadius: creatorAvatarRadius,
        showPolitcalStatus: showPolitcalStatus,
        maxHeight: maxHeight,
        showInteractions: showInteractions,
      );
    }, loading: () {
      return const SizedBox();
    });
  }
}

class ProjectCardItem extends ConsumerWidget {
  const ProjectCardItem({
    super.key,
    required this.project,
    required this.canTap,
    required this.creatorAvatarRadius,
    required this.showPolitcalStatus,
    required this.maxHeight,
    required this.showInteractions,
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
    final projectCardNotifier = ref.watch(
      projectCardWidgetProvider(
        project,
      ).notifier,
    );
    return InkWell(
      onTap: canTap
          ? () {
              context.push(
                '/feed/${project.id}/details',
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
          !projectCardState.isDeleted!
              ? projectCardState.imagesUrl!.length == 1
                  ? ContentSingleCachedImage(
                      imageUrl: projectCardState.imagesUrl!.first,
                      maxHeight: maxHeight,
                    )
                  : ContentMultipleCachedImage(
                      imageUrls: projectCardState.imagesUrl!,
                      maxHeight: maxHeight,
                    )
              : DeletedProjectPlaceholder(
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
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          fontSize: 23,
                        ),
                  ),
                  ContentExpandableText(
                    text: projectCardState.description!,
                    onToggleTextTap: () {},
                    hasImage: true,
                    maxLines: 4,
                  ),
                ],
              ),
            ),
          if (showInteractions)
            Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
              child: ProjectInteractionButtons(
                projectCardNotifier: projectCardNotifier,
                project: project,
              ),
            ),
        ],
      ),
    );
  }
}
