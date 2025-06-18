import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostCardBuild extends ConsumerWidget {
  const PostCardBuild({
    super.key,
    required this.noMaxLines,
    required this.post,
  });

  final bool noMaxLines;
  final Post post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postCardState = ref.watch(
      feedButtonsProvider(post),
    );
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (postCardState.hasText)
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: ContentExpandableText(
              text: postCardState.text,
              hasImage: postCardState.hasImage,
              hasVideo: postCardState.hasVideo,
              noMaxLines: noMaxLines,
              onToggleTextTap: () {},
            ),
          ),
        if (postCardState.hasImage)
          postCardState.imageUrls.length == 1
              ? ContentSingleCachedImage(
                  imageUrl: postCardState.imageUrls.first,
                )
              : ContentMultipleCachedImage(
                  imageUrls: postCardState.imageUrls,
                ),
        if (postCardState.hasVideo)
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: VideoPost(
              videoUrl: postCardState.videoUrl,
            ),
          ),
      ],
    );
  }
}
