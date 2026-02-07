import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PostCardDetail extends StatelessWidget {
  const PostCardDetail({
    required this.postWithUserState,
    required this.onTap,
    super.key,
    this.showInteractions = true,
    this.noMaxLines = false,
    this.showAuthor = true,
  });

  final PostWithUserState postWithUserState;
  final bool showInteractions;
  final VoidCallback? onTap;
  final bool noMaxLines;
  final bool showAuthor;

  @override
  Widget build(BuildContext context) {
    final post = postWithUserState.post;
    final timeAgo = THelperFunctions.humanizeDateTime(post.dateCreated!);
    final hasTags = post.tags != null && post.tags!.isNotEmpty;
    final hasLocations = post.locations != null && post.locations!.isNotEmpty;
    final project = post.project;
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          if (showAuthor && post.postType != PostType.postRepost)
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 12, 15, 0),
              child: ContentCreatorInfo(
                creator: post.owner!,
                timeAgo: timeAgo,
                onMoreTapped: () async {
                  await showDialog<dynamic>(
                    context: context,
                    builder: (ctx) {
                      return AlertDialog(
                        contentPadding: const EdgeInsets.only(bottom: 16),
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
          if (post.postType == PostType.regular ||
              post.postType == PostType.projectQuote ||
              post.postType == PostType.postQuote ||
              post.postType == PostType.comment ||
              post.postType == PostType.commentReply)
            PostCardBuild(
              post: post,
              noMaxLines: noMaxLines,
            ),
          if (post.postType == PostType.postQuote) 
            QuotedPostCard(
              post: post,
            ),
          if (post.postType == PostType.projectQuote)
            GestureDetector(
              onTap: () async {
                await context.push(
                  '/project/${project.id}',
                  extra: project,
                );
              },
              child: ProjectQuoteCard(
                project: project!,
              ),
            ),

          if (hasTags || hasLocations)
            ContentEngagementTagsAndLocations(
              tags: post.taggedUsers ?? [],
              locations: post.locations ?? [],
              hasTags: hasTags,
              hasLocations: hasLocations,
            ),
          if (showInteractions && post.postType != PostType.postRepost)
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
