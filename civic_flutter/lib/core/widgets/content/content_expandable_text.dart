import 'package:civic_flutter/core/core.dart';
import 'package:expandable_richtext/expandable_rich_text.dart';
import 'package:flutter/material.dart';

class ContentExpandableText extends StatelessWidget {
  const ContentExpandableText({
    super.key,
    required this.text,
    this.hasVideo = false,
    this.hasImage = false,
    this.noMaxLines = false,
    this.maxLines,
  });

  final String text;
  final bool hasVideo;
  final bool hasImage;
  final int? maxLines;
  final bool noMaxLines;

  @override
  Widget build(BuildContext context) {
    return ExpandableRichText(
      text,
      onToggleTextTap: (){},
      expandText: noMaxLines ? '' : 'see more',
      collapseText: 'see less',
      mentionStyle: Theme.of(context)
          .textTheme
          .labelMedium!
          .copyWith(
            color: TColors.primary,
            fontWeight: FontWeight.w500,
            fontSize: 17,
          ),
      toggleTextStyle: Theme.of(context)
          .textTheme
          .labelMedium!
          .copyWith(
            color: Theme.of(context).hintColor,
            fontSize: 17,
          ),
      hashtagStyle: Theme.of(context)
          .textTheme
          .labelMedium!
          .copyWith(
            color: TColors.primary,
            fontWeight: FontWeight.w500,
            fontSize: 17,
          ),
      urlStyle: Theme.of(context)
          .textTheme
          .labelMedium!
          .copyWith(
            color: TColors.primary,
            fontWeight: FontWeight.w500,
            fontSize: 17,
          ),
      toggleTextColor: TColors.primary,
      style: Theme.of(context)
          .textTheme
          .labelMedium!.copyWith(
            fontSize: 17,
          ),
      maxLines: maxLines ?? (noMaxLines ? 100 : (hasVideo || hasImage ? 3 : 6)),
    );
  }
}
