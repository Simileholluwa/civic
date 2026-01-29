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
    final theme = Theme.of(context);
    final timeAgo = THelperFunctions.humanizeDateTime(post.dateCreated!);
    final hasTags = post.tags != null && post.tags!.isNotEmpty;
    final hasLocations = post.locations != null && post.locations!.isNotEmpty;

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
          if (post.postType == PostType.projectQuote)
            Container(
              margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              padding: const EdgeInsets.only(
                bottom: 16,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  TSizes.md,
                ),
                border: Border.all(
                  color: theme.dividerColor,
                ),
              ),
              child: ProjectCard(
                projectWithUserState: ProjectWithUserState(
                  project: post.project!,
                ),
                showInteractions: false,
                maxHeight: 200,
              ),
            ),
          if (post.postType == PostType.postRepost)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RepostHeader(post: post),
                if (post.parent!.postType == PostType.article)
                  ArticleCard(
                    postWithUserState: PostWithUserState(
                      post: post.parent!,
                    ),
                  )
                else
                  post.parent!.postType == PostType.poll
                      ? PollCard(
                          postWithUserState: PostWithUserState(
                            post: post.parent!,
                          ),
                        )
                      : Column(
                          spacing: 10,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 12, 15, 0),
                              child: ContentCreatorInfo(
                                creator: post.parent!.owner!,
                                timeAgo: THelperFunctions.humanizeDateTime(
                                  post.parent!.dateCreated!,
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
                              post: post.parent!,
                              noMaxLines: false,
                            ),
                            if (post.parent!.postType == PostType.projectQuote)
                              Container(
                                margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                                padding: const EdgeInsets.only(
                                  bottom: 16,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    TSizes.md,
                                  ),
                                  border: Border.all(
                                    color: theme.dividerColor,
                                  ),
                                ),
                                child: ProjectCard(
                                  projectWithUserState: ProjectWithUserState(
                                    project: post.parent!.project!,
                                  ),
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
                            PostInteractionButtons(
                              postWithUserState: PostWithUserState(
                                post: post.parent!,
                              ),
                              onReply: () async {
                                await context.push(
                                  '/feed/post/${post.id}/comments',
                                );
                              },
                            ),
                          ],
                        ),
              ],
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
