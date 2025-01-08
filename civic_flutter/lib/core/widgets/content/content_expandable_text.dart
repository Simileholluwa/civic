import 'package:civic_flutter/core/core.dart';
import 'package:expandable_richtext/expandable_rich_text.dart';
import 'package:flutter/material.dart';

class ContentExpandableText extends StatelessWidget {
  const ContentExpandableText({
    super.key,
    required this.text,
    this.hasVideo = false,
    this.hasImage = false,
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
          .labelMedium!
          .copyWith(
            color: TColors.primary,
            fontWeight: FontWeight.bold,
          ),
      toggleTextStyle: Theme.of(context)
          .textTheme
          .labelMedium!
          .copyWith(
            color: Theme.of(context).hintColor,
          ),
      hashtagStyle: Theme.of(context)
          .textTheme
          .labelMedium!
          .copyWith(
            color: TColors.primary,
            fontWeight: FontWeight.bold,
          ),
      toggleTextColor: TColors.primary,
      style: Theme.of(context)
          .textTheme
          .labelMedium!,
      maxLines: hasVideo || hasImage ? 3 : 6,
    );
  }
}
