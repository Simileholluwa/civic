import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/feed/feed.dart';
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
    return PostCardDetail(
      post: post,
      showInteractions: true,
      hasProject: post.postType == PostType.projectRepost,
      onTap: () {
        context.push(
          '/feed/post/${post.id}',
          extra: post,
        );
      },
    );
  }
}
