import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/create/create.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';

class PostNotificationTarget extends StatelessWidget {
  const PostNotificationTarget({
    required this.notification,
    super.key,
  });

  final AppNotification notification;

  @override
  Widget build(BuildContext context) {
    final post = notification.post ?? notification.post?.parent;
    final assets = post?.mediaAssets ?? const <MediaAsset>[];
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
        if (post!.text?.isNotEmpty ?? false)
          ContentExpandableText(
            text: post.text!,
            hasImage: hasImage,
            hasVideo: hasVideo,
            onToggleTextTap: () {},
            textStyle: DefaultTextStyle.of(context).style.copyWith(
                  color: Theme.of(context).hintColor,
                ),
          ),
        if (hasImage)
          PostImagePost(
            post: post,
            showInteractions: false,
            addPadding: false,
          ),
        if (hasVideo)
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: VideoPost(
              videoUrl: videoAssetUrl,
            ),
          ),
      ],
    );
  }
}
