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
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (notification.post!.text?.isNotEmpty ?? false)
          ContentExpandableText(
            text: notification.post!.text!,
            hasImage: notification.post!.imageUrls?.isNotEmpty ?? false,
            hasVideo: notification.post!.videoUrl?.isNotEmpty ?? false,
            onToggleTextTap: () {},
            textStyle: DefaultTextStyle.of(context).style.copyWith(
                  color: Theme.of(context).hintColor,
                ),
          ),
        if (notification.post!.imageUrls?.isNotEmpty ?? false)
          PostImagePost(
            post: notification.post!,
            showInteractions: false,
            addPadding: false,
          ),
        if (notification.post!.videoUrl?.isNotEmpty ?? false)
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: VideoPost(
              videoUrl: notification.post!.videoUrl!,
            ),
          ),
      ],
    );
  }
}
