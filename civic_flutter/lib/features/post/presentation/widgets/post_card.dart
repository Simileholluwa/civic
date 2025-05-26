import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostCard extends ConsumerWidget {
  const PostCard({
    super.key,
    required this.onTap,
    required this.post,
    this.noMaxLines = false,
    this.showInteractions = true,
  });
  final Post post;
  final bool noMaxLines;
  final VoidCallback? onTap;
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
        onTap: onTap,
        noMaxLines: noMaxLines,
        showInteractions: showInteractions,
      );
    }, error: (err, st) {
      return PostCardItem(
        post: post,
        onTap: onTap,
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
        if (
            postCardState.postType == PostType.projectRepost)
          PostCardDetail(
            post: post,
            showInteractions: true,
            hasProject: true,
          ),
        if (postCardState.postType == PostType.regular)
          PostCardDetail(
            post: post,
            showInteractions: true,
            hasProject: false,
          ),
      ],
    );
  }
}
