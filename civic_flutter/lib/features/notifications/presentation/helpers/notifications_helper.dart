import 'package:flutter/material.dart';

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

    spans.add(TextSpan(
      text: ' $actionType your $targetType',
      style: style,
    ));

    if (content != null) {
      spans.add(TextSpan(
        text: ': $content',
        style: style,
      ));
    }

    return TextSpan(children: spans);
  }
}
