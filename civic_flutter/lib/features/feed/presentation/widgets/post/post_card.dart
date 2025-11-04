import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PostCard extends ConsumerWidget {
  const PostCard({
    required this.post,
    super.key,
    this.showInteractions = true,
    this.onTap,
    this.showAuthor = true,
  });
  final Post post;
  final bool showInteractions;
  final VoidCallback? onTap;
  final bool showAuthor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PostCardDetail(
      post: post,
      showAuthor: showAuthor,
      hasProject: post.postType == PostType.projectRepost,
      onTap: onTap ??
          () async {
            await context.push(
              '/feed/post/${post.id}',
              extra: post,
            );
          },
    );
  }
}
