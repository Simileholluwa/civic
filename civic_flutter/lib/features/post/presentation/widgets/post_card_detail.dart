import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PostCardDetail extends ConsumerWidget {
  const PostCardDetail({
    super.key,
    required this.post,
    this.showInteractions = true,
    this.hasProject = false,
  });

  final Post post;
  final bool showInteractions;
  final bool hasProject;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postCardState = ref.watch(
      postCardWidgetProvider(post),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(15, 12, 15, 0),
          child: ContentCreatorInfo(
            creator: post.owner!,
            timeAgo: postCardState.timeAgo,
          ),
        ),
        PostCardBuild(
          onTap: () {
            context.push(
              '/feed/post/${post.id}',
            );
          },
          post: post,
          noMaxLines: false,
        ),
        if (hasProject)
          Container(
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            padding: const EdgeInsets.only(
              bottom: 16,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                TSizes.md,
              ),
              border: Border.all(
                color: Theme.of(context).dividerColor,
              ),
            ),
            child: ProjectCard(
              project: post.project!,
              showInteractions: false,
              maxHeight: 200,
            ),
          ),
        if (postCardState.hasTags || postCardState.hasLocation)
          ContentEngagementTagsAndLocations(
            tags: postCardState.tags,
            locations: postCardState.locations,
            hasTags: postCardState.hasTags,
            hasLocations: postCardState.hasLocation,
          ),
        if (showInteractions) PostInteractionButtons(post: post),
      ],
    );
  }
}
