import 'dart:async';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/notifications/notifications.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class NotificationsHelper {
  static InlineSpan buildNotificationText(
    BuildContext context,
    String content,
  ) {
    final style = DefaultTextStyle.of(context).style;
    final boldStyle = style.copyWith(fontWeight: FontWeight.w600);

    // Parse occurrences of <b>...</b> (case-insensitive) and build spans for
    // the text outside and inside those tags. This avoids relying on split
    // with capturing groups which can be error-prone for variations.
    final spans = <InlineSpan>[];
    final boldRegExp =
        RegExp('<b>(.*?)</b>', caseSensitive: false, dotAll: true);
    var lastEnd = 0;

    for (final match in boldRegExp.allMatches(content)) {
      // Add text before the <b> match
      if (match.start > lastEnd) {
        final before = content.substring(lastEnd, match.start);
        if (before.isNotEmpty) {
          spans.add(TextSpan(text: before, style: style));
        }
      }

      // Add the bold text (group 1)
      final boldText = match.group(1) ?? '';
      if (boldText.isNotEmpty) {
        spans.add(TextSpan(text: boldText, style: boldStyle));
      }

      lastEnd = match.end;
    }

    // Add any trailing text after the last match
    if (lastEnd < content.length) {
      final tail = content.substring(lastEnd);
      if (tail.isNotEmpty) {
        spans.add(
          TextSpan(
            text: tail,
            style: style,
          ),
        );
      }
    }

    return TextSpan(children: spans);
  }

  static final Map<NotificationActionType, IconData> _iconMap = {
    NotificationActionType.like: Iconsax.heart5,
    NotificationActionType.comment: Iconsax.message5,
    NotificationActionType.follow: Icons.person_add,
    NotificationActionType.react: Icons.thumb_up_alt_rounded,
    NotificationActionType.tag: Iconsax.tag_user5,
    NotificationActionType.mention: Iconsax.tag_user,
    NotificationActionType.quote: Iconsax.repeate_music5,
    NotificationActionType.review: Iconsax.magic_star5,
    NotificationActionType.vet: Iconsax.medal_star5,
    NotificationActionType.repost: Iconsax.repeate_music5,
    NotificationActionType.reply: Iconsax.message_add5,
    NotificationActionType.vote: Iconsax.chart_success5,
  };

  static Widget notifIcon(
    NotificationActionType actionType, {
    double size = 15,
  }) {
    final iconData = _iconMap[actionType] ?? Iconsax.notification5;

    // Create the widget once
    return Icon(
      iconData,
      color: Colors.white,
      size: size,
    );
  }

  static final Map<NotificationActionType, Color> _colorMap = {
    NotificationActionType.like: TColors.secondary,
    NotificationActionType.comment: TColors.primary,
    NotificationActionType.follow: Colors.blue,
    NotificationActionType.react: Colors.pink,
    NotificationActionType.tag: Colors.teal,
    NotificationActionType.mention: Colors.orange,
    NotificationActionType.quote: Colors.purple,
    NotificationActionType.review: Colors.green,
    NotificationActionType.vet: Colors.indigo,
    NotificationActionType.repost: Colors.brown,
    NotificationActionType.reply: Colors.cyan,
    NotificationActionType.vote: Colors.amber,
  };

  static Color getIconColor(
    NotificationActionType actionType,
  ) {
    // Use a default color if not found.
    return _colorMap[actionType] ?? Colors.orange;
  }

  static Future<bool?> deleteNotificationsDialog(
    BuildContext context,
  ) {
    return postDialog(
      context: context,
      title: 'Delete all notifications?',
      description: 'Are you sure you want to delete all '
          'notifications? This action cannot be undone.',
      onTapSkipButton: () {
        context.pop(false);
      },
      activeButtonText: 'Delete all',
      activeButtonLoading: false,
      skipButtonLoading: false,
      skipText: 'Cancel',
      onTapActiveButton: () async {
        if (context.mounted) {
          context.pop(true);
        }
      },
    );
  }

  static NotificationPreference getPreferenceForType(
    AppNotificationSettings settings,
    NotificationSettingType type,
  ) {
    switch (type) {
      case NotificationSettingType.follows:
        return settings.follows;
      case NotificationSettingType.likes:
        return settings.likes;
      case NotificationSettingType.comments:
        return settings.comments;
      case NotificationSettingType.mentions:
        return settings.mentions;
      case NotificationSettingType.projectReviewReactions:
        return settings.projectReviewReactions;
      case NotificationSettingType.helpfulProjectReviews:
        return settings.helpfulProjectReviews;
      case NotificationSettingType.projectVettingReactions:
        return settings.projectVettingReactions;
      case NotificationSettingType.tags:
        return settings.tags;
      case NotificationSettingType.projectReviews:
        return settings.projectReviews;
      case NotificationSettingType.projectVetting:
        return settings.projectVetting;
      case NotificationSettingType.projectQuotes:
        return settings.projectQuotes;
      case NotificationSettingType.push:
        return settings.projectQuotes;
    }
  }
}
