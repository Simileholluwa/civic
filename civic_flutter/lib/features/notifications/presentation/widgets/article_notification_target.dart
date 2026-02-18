import 'dart:convert';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class ArticleNotificationTarget extends StatelessWidget {
  const ArticleNotificationTarget({
    required this.notification,
    super.key,
  });

  final AppNotification notification;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Theme.of(context).dividerColor,
        ),
      ),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ArticleImageHeader(
            post: notification.post!,
            showPadding: false,
          ),
          ContentExpandableText(
            text: Document.fromJson(
              jsonDecode(
                    notification.post!.article!.content!,
                  )
                  as List,
            ).toPlainText(),
            maxLines: 3,
            onToggleTextTap: () {},
            showSeeMore: false,
          ),
        ],
      ),
    );
  }
}
