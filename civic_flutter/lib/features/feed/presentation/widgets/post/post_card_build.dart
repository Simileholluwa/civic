import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/create/create.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';

class PostCardBuild extends StatelessWidget {
  const PostCardBuild({
    required this.noMaxLines,
    required this.post,
    this.showPadding = true,
    super.key,
  });

  final bool noMaxLines;
  final Post post;
  final bool showPadding;

  @override
  Widget build(BuildContext context) {
    final hasText = post.text != null && post.text!.isNotEmpty;
    final hasVideo = post.videoUrl != null && post.videoUrl!.isNotEmpty;
    final hasImage = post.imageUrls != null && post.imageUrls!.isNotEmpty;
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hasText)
          Padding(
            padding: showPadding
                ? const EdgeInsets.fromLTRB(15, 0, 15, 0)
                : EdgeInsets.zero,
            child: ContentExpandableText(
              text: post.text!,
              hasImage: hasImage,
              hasVideo: hasVideo,
              noMaxLines: noMaxLines,
              expandOnTextTap: true,
            ),
          ),
        if (hasImage)
          PostImagePost(
            post: post,
            showInteractions: false,
          ),
        if (hasVideo)
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: VideoPost(
              videoUrl: post.videoUrl!,
            ),
          ),
      ],
    );
  }
}
