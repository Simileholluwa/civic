import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';

class PostCardBuild extends StatelessWidget {
  const PostCardBuild({
    required this.noMaxLines,
    required this.post,
    this.showPadding = true,
    this.expandOnTextTap = true,
    this.onToggleTextTap,
    super.key,
  });

  final bool noMaxLines;
  final Post post;
  final bool showPadding;
  final bool expandOnTextTap;
  final VoidCallback? onToggleTextTap;

  @override
  Widget build(BuildContext context) {
    final hasText = post.text != null && post.text!.isNotEmpty;
    final assets = post.mediaAssets ?? const <MediaAsset>[];
    final imageAssetUrls = assets
        .where((a) => a.kind == MediaKind.image)
        .map((a) => a.publicUrl)
        .toList(growable: false);
    String? videoAssetUrl;
    for (final a in assets) {
      if (a.kind == MediaKind.video && (a.publicUrl ?? '').isNotEmpty) {
        videoAssetUrl = a.publicUrl;
        break;
      }
    }
    final hasVideo = videoAssetUrl != null && videoAssetUrl.isNotEmpty;
    final hasImage = imageAssetUrls.isNotEmpty;
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
              expandOnTextTap: expandOnTextTap,
              onToggleTextTap: onToggleTextTap,
            ),
          ),
        if (hasImage)
          imageAssetUrls.length == 1
              ?  Padding(
                padding: showPadding ? const EdgeInsets.symmetric(horizontal: 15,) : EdgeInsets.zero,
                child: ContentSingleCachedImage(
                    imageUrl: imageAssetUrls.first!,
                    aspectRatio: post.mediaAssets!.first.aspectRatio ??
                        THelperFunctions.calculateAspectRatio(
                          width: post.mediaAssets!.first.width,
                          height: post.mediaAssets!.first.height,
                        ) ??
                        1.0,
                  useMargin: false,
                  ),
              )
              : Padding(
                padding: showPadding ? const EdgeInsets.symmetric(horizontal: 15,) : EdgeInsets.zero,
                child: ContentImageViewer(
                    mediaAssets: post.mediaAssets ?? [],
                    addPadding: false,
                  ),
              ),
        if (hasVideo)
          Padding(
            padding: showPadding ? const EdgeInsets.fromLTRB(15, 0, 15, 0) : EdgeInsets.zero,
            child: VideoPost(
              videoUrl: videoAssetUrl,
            ),
          ),
      ],
    );
  }
}
