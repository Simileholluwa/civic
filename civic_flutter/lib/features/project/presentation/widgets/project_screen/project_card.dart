import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectCard extends ConsumerWidget {
  const ProjectCard({
    required this.project, super.key,
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
    return ProjectCardItem(
        project: liveProject.value ?? project,
        canTap: canTap,
        creatorAvatarRadius: creatorAvatarRadius,
        showPolitcalStatus: showPolitcalStatus,
        maxHeight: maxHeight,
        showInteractions: showInteractions,
      );
  }
}
