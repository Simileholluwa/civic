import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
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

    if (targetType.isNotEmpty) {
      spans.add(
        TextSpan(
          text: ' your $targetType',
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
    switch(actionType) {
      case 'liked':
        return Icon(Iconsax.heart5, color: Colors.white, size: 15,);
      case 'commented on':
        return Icon(Iconsax.message5, color: Colors.white, size: 15,);
      case 'followed you':
        return Icon(Iconsax.user_add, color: Colors.white, size: 15,);
      case 'bookmarked':
        return Icon(Icons.bookmark_rounded, color: Colors.white, size: 15,);
      case 'quoted':
        return Icon(Iconsax.repeat, color: Colors.white, size: 15,);
      case 'mentioned':
        return Icon(Iconsax.tag_user, color: Colors.white, size: 15,);
      case 'reviewed':
        return Icon(Iconsax.magic_star5, color: Colors.white, size: 15,);
      case 'vetted':
        return Icon(Iconsax.medal_star5, color: Colors.white, size: 15,);
      default:
        return Icon(Iconsax.notification, color: Colors.white, size: 15,);
    }
  }  

  static Color getIconColor(String actionType) {
    switch(actionType) {
      case 'liked':
        return TColors.secondary;
      case 'commented on':
        return TColors.primary;
      case 'followed you':
        return Colors.blue;
      case 'bookmarked':
        return Colors.indigo;
      case 'quoted':
        return Colors.purple;
      case 'mentioned':
        return Colors.orange;
      case 'reviewed':
        return Colors.green;
      case 'vetted':
        return Colors.red;
      default:
        return Colors.orange;
    }
  }  
}
