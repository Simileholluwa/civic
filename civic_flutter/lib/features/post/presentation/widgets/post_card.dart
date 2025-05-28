import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PostCard extends ConsumerWidget {
  const PostCard({
    super.key,
    required this.post,
    this.noMaxLines = false,
    this.showInteractions = true,
  });
  final Post post;
  final bool noMaxLines;
  final bool showInteractions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final livePost = ref.watch(
      postStreamProvider(
        post.id!,
        post,
      ),
    );
    return livePost.when(data: (newPost) {
      return PostCardItem(
        post: newPost,
        onTap: () {
          context.push(
            '/feed/post/${post.id}',
          );
        },
        noMaxLines: noMaxLines,
        showInteractions: showInteractions,
      );
    }, error: (err, st) {
      return PostCardItem(
        post: post,
        onTap: () {
          context.push(
            '/feed/post/${post.id}',
          );
        },
        noMaxLines: noMaxLines,
        showInteractions: showInteractions,
      );
    }, loading: () {
      return const SizedBox();
    });
  }
}

class PostCardItem extends ConsumerWidget {
  const PostCardItem({
    super.key,
    required this.post,
    required this.onTap,
    required this.noMaxLines,
    this.showInteractions = true,
  });

  final Post post;
  final VoidCallback? onTap;
  final bool noMaxLines;
  final bool showInteractions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postCardState = ref.watch(
      postCardWidgetProvider(post),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        if (postCardState.postType == PostType.projectRepost)
          PostCardDetail(
            post: post,
            showInteractions: true,
            hasProject: true,
            onTap: onTap,
          ),
        if (postCardState.postType == PostType.regular)
          PostCardDetail(
            post: post,
            showInteractions: true,
            hasProject: false,
            onTap: onTap,
          ),
      ],
    );
  }
}
