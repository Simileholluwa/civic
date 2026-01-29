import 'dart:convert';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
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

  static final Map<int, String> _plainTextCache = <int, String>{};

  String _resolvePlainTextDescription() {
    final project = projectWithUserState.project;
    final projectId = project.id;
    var description = '';
    if (projectId != null && _plainTextCache.containsKey(projectId)) {
      description = _plainTextCache[projectId]!;
    } else {
      final raw = project.description;
      if (raw != null) {
        final dynamic decoded = jsonDecode(raw);
        if (decoded is List) {
          description = Document.fromJson(decoded).toPlainText();
        } else if (decoded is Map<String, dynamic>) {
          description = Document.fromJson([decoded]).toPlainText();
        }
      }
      if (projectId != null) {
        _plainTextCache[projectId] = description;
      }
    }
    return description;
  }

  @override
  Widget build(BuildContext context) {
    final project = projectWithUserState.project;
    final imagesUrl = project.projectImageAttachments!
        .map((e) => e.publicUrl)
        .toList();
    final description = _resolvePlainTextDescription();
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
            ),
          ),
          if (imagesUrl.length == 1)
            ContentSingleCachedImage(
              imageUrl: imagesUrl.first!,
              aspectRatio:
                  project.projectImageAttachments?.first.aspectRatio ?? 1.0,
            )
          else
            ContentImageViewer(
              mediaAssets: project.projectImageAttachments!,
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
                ContentExpandableText(
                  text: description,
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
                projectWithUserState: projectWithUserState,
              ),
            ),
        ],
      ),
    );
  }
}
