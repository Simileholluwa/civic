import 'dart:convert';

import 'package:civic_client/civic_client.dart' as cc;
import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class ArticleNotificationTarget extends StatelessWidget {
  const ArticleNotificationTarget({
    required this.notification,
    super.key,
  });

  final cc.Notification notification;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Row(
          spacing: 10,
          children: [
            Expanded(
              child: Text(
                notification.post!.text!,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.left,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10,
                ),
                color: Theme.of(context).primaryColor,
              ),
              child: const Text(
                'Article',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              TSizes.md,
            ),
            color: Theme.of(context).cardColor,
            border: Border.all(
              color: Theme.of(context).dividerColor,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
              TSizes.md,
            ),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: ContentCachedImage(
                url: notification.post!.imageUrls!.first,
                height: 200,
              ),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 5,
          children: [
            ContentExpandableText(
              text: Document.fromJson(
                jsonDecode(
                  notification.post!.article!.content!,
                ) as List,
              ).toPlainText(),
              hasImage: true,
              maxLines: 3,
              onToggleTextTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
