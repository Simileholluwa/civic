import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class QuotedPostCard extends StatelessWidget {
  const QuotedPostCard({
    required this.post,
    super.key,
    this.depth = 0,
    this.maxDepth = 2,
    this.showMargin = true,
  });

  final Post post;
  final int depth;
  final int maxDepth;
  final bool showMargin;

  @override
  Widget build(BuildContext context) {
    if (post.parent == null || post.parent!.owner == null) {
      return Container(
        margin: showMargin ? const EdgeInsets.fromLTRB(15, 0, 15, 0) : null,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TSizes.md),
          border: Border.all(color: Theme.of(context).dividerColor),
        ),
        child: Text(
          'Post no longer available',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).cardColor,
            fontStyle: FontStyle.italic,
          ),
        ),
      );
    }

    return Container(
      margin: showMargin ? const EdgeInsets.fromLTRB(15, 0, 15, 0) : null,
      padding: const EdgeInsets.all(
        15,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          TSizes.md,
        ),
        border: Border.all(
          color: Theme.of(context).dividerColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: 5,
        children: [
          if (depth < maxDepth)
            QuotedPostCreatorInfo(
              owner: post.parent!.owner!,
              dateCreated: post.parent!.dateCreated!,
            ),
          if (post.parent!.postType == PostType.poll && depth < maxDepth)
            PollQuoteCard(post: post),
          if (post.parent!.postType == PostType.article && depth < maxDepth)
            ArticleCard(
              postWithUserState: PostWithUserState(
                post: post.parent!,
              ),
              showPadding: false,
              maxLines: 2,
              showInteractions: false,
              showCreatorInfo: false,
            ),
          if ((post.parent!.postType == PostType.regular ||
                  post.parent!.postType == PostType.projectQuote ||
                  post.parent!.postType == PostType.postQuote ||
                  post.parent!.postType == PostType.comment ||
                  post.parent!.postType == PostType.commentReply) &&
              depth < maxDepth)
            InkWell(
              onTap: () async {
                await context.push(
                  '/feed/post/${post.parent!.id!}',
                );
              },
              child: PostCardBuild(
                post: post.parent!,
                noMaxLines: false,
                showPadding: false,
                onToggleTextTap: () {},
                expandOnTextTap: false,
              ),
            ),
          // Show nested content only if we haven't reached max depth
          if (depth < maxDepth) ...[
            if (post.parent!.postType == PostType.projectQuote)
              _buildNestedProjectQuote(context),
            if (post.parent!.postType == PostType.postQuote)
              _buildNestedQuote(context),
          ],
          // Show view more button when we reach max depth and there's more content
          if (depth >= maxDepth && 
              (post.parent!.parentId != null || 
               post.parent!.projectId != null ||
               post.parent!.postType == PostType.projectQuote ||
               post.parent!.postType == PostType.postQuote))
            _buildViewMoreButton(context),
        ],
      ),
    );
  }

  Widget _buildNestedProjectQuote(BuildContext context) {
    if (depth >= maxDepth - 1) {
      return _buildViewMoreButton(context);
    }

    if (post.parent?.project == null) {
      return _buildViewMoreButton(context);
    }

    return GestureDetector(
      onTap: () async {
        await context.push(
          '/project/${post.parent!.project!.id}',
        );
      },
      child: ProjectQuoteCard(
        project: post.parent!.project!,
        useMargin: false,
      ),
    );
  }

  Widget _buildNestedQuote(BuildContext context) {
    if (depth >= maxDepth) {
      return _buildViewMoreButton(context);
    }

    if (post.parent?.parent == null) {
      return _buildViewMoreButton(context);
    }

    return QuotedPostCard(
      post: post.parent!,
      depth: depth + 1,
      maxDepth: maxDepth,
      showMargin: false,
    );
  }

  Widget _buildViewMoreButton(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (post.parent?.postType == PostType.projectQuote &&
            post.parent?.project?.id != null) {
          await context.push(
            '/project/${post.parent!.project!.id}',
          );
        } else {
          await context.push(
            '/feed/post/${post.parent!.id!}',
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.only(top: 8),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.more_horiz,
              size: 16,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            const SizedBox(width: 4),
            Text(
              post.parent?.postType == PostType.projectQuote
                  ? 'View project'
                  : 'View full thread',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
