import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PostCardDetail extends StatelessWidget {
  const PostCardDetail({
    required this.postWithUserState,
    required this.onTap,
    super.key,
    this.showInteractions = true,
    this.hasProject = false,
    this.noMaxLines = false,
    this.showAuthor = true,
  });

  final PostWithUserState postWithUserState;
  final bool showInteractions;
  final bool hasProject;
  final VoidCallback? onTap;
  final bool noMaxLines;
  final bool showAuthor;

  @override
  Widget build(BuildContext context) {
    final post = postWithUserState.post;
    final hasTags = post.tags != null && post.tags!.isNotEmpty;
    final hasLocations = post.locations != null && post.locations!.isNotEmpty;
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          if (showAuthor)
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 12, 15, 0),
              child: ContentCreatorInfo(
                creator: post.owner!,
                timeAgo: THelperFunctions.humanizeDateTime(
                  post.dateCreated!,
                ),
                onMoreTapped: () async {
                  await showDialog<dynamic>(
                    context: context,
                    builder: (ctx) {
                      return AlertDialog(
                        contentPadding: const EdgeInsets.only(
                          bottom: 16,
                        ),
                        content: ShowPostActions(
                          postWithUserState: postWithUserState,
                          originalPostId: post.id!,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          PostCardBuild(
            post: post,
            noMaxLines: noMaxLines,
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
          if (hasTags || hasLocations)
            ContentEngagementTagsAndLocations(
              tags: post.taggedUsers ?? [],
              locations: post.locations ?? [],
              hasTags: hasTags,
              hasLocations: hasLocations,
            ),
          if (showInteractions)
            PostInteractionButtons(
              postWithUserState: postWithUserState,
              onReply: () async {
                await context.push(
                  '/feed/post/${post.id}/comments',
                );
              },
            ),
        ],
      ),
    );
  }
}
