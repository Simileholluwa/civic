import 'dart:async';

import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/notifications/notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class NotificationsHelper {
  static String formatGroupedUserNames(List<String> usernames) {
    if (usernames.isEmpty) return '';
    final count = usernames.length;
    if (count == 1) return usernames.first;
    if (count == 2) return '${usernames[0]} and ${usernames[1]}';
    final others = count - 2;
    return '${usernames[0]}, ${usernames[1]} and $others other${others > 1 ? 's' : ''}';
  }

  static InlineSpan formatNotificationRichText(
    BuildContext context, {
    required String? content,
    required List<String> usernames,
    required String actionType,
    required String targetType,
    required String? triggerUser,
  }) {
    final style = DefaultTextStyle.of(context).style;
    final boldStyle = style.copyWith(fontWeight: FontWeight.bold);

    final spans = <InlineSpan>[];

    for (int i = 0; i < usernames.length; i++) {
      spans.add(TextSpan(text: usernames[i], style: boldStyle));

      if (i < usernames.length - 2) {
        spans.add(TextSpan(text: ', ', style: style));
      } else if (i == usernames.length - 2) {
        spans.add(TextSpan(text: ' and ', style: style));
      }
    }

    spans.add(
      TextSpan(
        text: ' $actionType',
        style: style,
      ),
    );

    if (triggerUser != null) {
      spans.add(
        TextSpan(
          text: " $triggerUser",
          style: boldStyle,
        ),
      );
    }

    if (targetType.isNotEmpty) {
      spans.add(
        TextSpan(
          text: " ${triggerUser != null ? "'s" : 'your'} $targetType",
          style: style,
        ),
      );
    }

    if (content != null) {
      spans.add(
        TextSpan(
          text: ': $content',
          style: style,
        ),
      );
    }

    return TextSpan(children: spans);
  }

  static Widget notifIcon(String actionType) {
    if (actionType == 'liked') {
      return Icon(
        Iconsax.heart5,
        color: Colors.white,
        size: 15,
      );
    } else if (actionType == 'commented on') {
      return Icon(
        Iconsax.message5,
        color: Colors.white,
        size: 15,
      );
    } else if (actionType.contains('reacted')) {
      return Icon(
        Icons.thumb_up_alt_rounded,
        color: Colors.white,
        size: 15,
      );
    } else if (actionType == 'followed you') {
      return Icon(
        Iconsax.user_add,
        color: Colors.white,
        size: 15,
      );
    } else if (actionType.contains('tagged')) {
      return Icon(
        Iconsax.tag_user5,
        color: Colors.white,
        size: 15,
      );
    } else if (actionType.contains('mentioned')) {
      return Icon(
        Icons.person,
        color: Colors.white,
        size: 15,
      );
    } else if (actionType == 'bookmarked') {
      return Icon(
        Icons.bookmark_rounded,
        color: Colors.white,
        size: 15,
      );
    } else if (actionType == 'quoted') {
      return Icon(
        Iconsax.repeat,
        color: Colors.white,
        size: 15,
      );
    } else if (actionType == 'mentioned') {
      return Icon(
        Iconsax.tag_user,
        color: Colors.white,
        size: 15,
      );
    } else if (actionType == 'reviewed') {
      return Icon(
        Iconsax.magic_star5,
        color: Colors.white,
        size: 15,
      );
    } else if (actionType == 'vetted') {
      return Icon(
        Iconsax.medal_star5,
        color: Colors.white,
        size: 15,
      );
    } else {
      return Icon(
        Iconsax.notification5,
        color: Colors.white,
        size: 15,
      );
    }
  }

  static Color getIconColor(String actionType) {
    if (actionType == 'liked') {
      return TColors.secondary;
    } else if (actionType == 'commented on') {
      return TColors.primary;
    } else if (actionType == 'followed you') {
      return Colors.blue;
    } else if (actionType == 'bookmarked') {
      return Colors.indigo;
    } else if (actionType.contains('tagged')) {
      return Colors.teal;
    } else if (actionType.contains('reacted')) {
      return Colors.pink;
    } else if (actionType == 'quoted') {
      return Colors.purple;
    } else if (actionType == 'mentioned') {
      return Colors.orange;
    } else if (actionType == 'reviewed') {
      return Colors.green;
    } else if (actionType == 'vetted') {
      return Colors.red;
    } else {
      return Colors.orange;
    }
  }

  static Future<bool?> deleteNotificationsDialog(
    WidgetRef ref,
    BuildContext context,
  ) {
    final notifNotifier = ref.read(
      notifProvider.notifier,
    );
    return postDialog(
      context: context,
      title: 'Delete all notifications?',
      description:
          'Are you sure you want to delete all notifications? This action cannot be undone.',
      onTapSkipButton: () {
        context.pop();
      },
      activeButtonText: 'Delete all',
      activeButtonLoading: false,
      skipButtonLoading: false,
      skipText: "Cancel",
      onTapActiveButton: () async {
        if (context.mounted) {
          context.pop();
        }
        ref
            .read(paginatedNotificationsListProvider('').notifier)
            .removeAllNotifications();
        unawaited(
          notifNotifier.deleteAllNotification(),
        );
      },
    );
  }
}
