import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';

class MentionHashtagLinkTextEditingController extends TextEditingController {
  MentionHashtagLinkTextEditingController(
      {super.text,});

  @override
  TextSpan buildTextSpan(
      {required BuildContext context,
      required bool withComposing, TextStyle? style,}) {
    final children = <InlineSpan>[];

    // Regex pattern to match @mentions, #hashtags, and links
    final regex = RegExp(r'(@\w+|#\w+|http[s]?:\/\/|www\.)[^\s]+');
    final matches = regex.allMatches(text);

    var currentIndex = 0;

    // Iterate over the matches and split the text accordingly
    for (final match in matches) {
      if (match.start > currentIndex) {
        // Add the text before the match as normal text
        children.add(
          TextSpan(
            text: text.substring(
              currentIndex,
              match.start,
            ),
            style: style,
          ),
        );
      }

      final matchText = match.group(0)!;

      // Add the matched part with the appropriate style
      if (matchText.startsWith('#')) {
        children.add(TextSpan(
          text: matchText,
          style: style?.copyWith(
            color: TColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),);
      } else if (matchText.startsWith('@')) {
        
          children.add(TextSpan(
            text: matchText,
            style: style?.copyWith(
              color: TColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),);
        
      } else if (matchText.startsWith('http') || matchText.startsWith('www')) {
        children.add(TextSpan(
          text: matchText,
          style: style?.copyWith(
            color: TColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),);
      }

      currentIndex = match.end;
    }

    // Add any remaining text after the last match
    if (currentIndex < text.length) {
      children.add(
        TextSpan(
          text: text.substring(
            currentIndex,
          ),
          style: style,
        ),
      );
    }

    return TextSpan(
      children: children,
      style: style,
    );
  }
}
