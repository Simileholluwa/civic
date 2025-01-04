import 'package:civic_flutter/core/core.dart';
import 'package:expandable_richtext/expandable_rich_text.dart';
import 'package:flutter/material.dart';

class ContentExpandableText extends StatelessWidget {
  const ContentExpandableText({
    super.key,
    required this.text,
    required this.hasVideo,
    required this.hasImage,
  });

  final String text;
  final bool hasVideo;
  final bool hasImage;

  @override
  Widget build(BuildContext context) {
    return ExpandableRichText(
      text,
      expandText: 'see more',
      collapseText: 'see less',
      mentionStyle: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(
            fontSize: 17,
            color: TColors.primary,
            fontWeight: FontWeight.bold,
          ),
      toggleTextStyle: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(
            fontSize: 17,
            color: Theme.of(context).textTheme.labelMedium!.color,
          ),
      hashtagStyle: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(
            fontSize: 17,
            color: TColors.primary,
            fontWeight: FontWeight.bold,
          ),
      toggleTextColor: TColors.primary,
      style: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(
            fontSize: 17,
          ),
      maxLines: hasVideo || hasImage ? 3 : 6,
    );
  }
}
