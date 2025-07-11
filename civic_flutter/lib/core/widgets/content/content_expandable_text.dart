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
    required this.onToggleTextTap,
    this.maxLines,
    this.fontSize = 17,
  });

  final String text;
  final bool hasVideo;
  final bool hasImage;
  final int? maxLines;
  final bool noMaxLines;
  final VoidCallback? onToggleTextTap;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = DefaultTextStyle.of(context).style;
    return ExpandableRichText(
      text,
      onToggleTextTap: onToggleTextTap,
      expandText: noMaxLines ? '' : 'see more',
      collapseText: 'see less',
      mentionStyle: defaultTextStyle.copyWith(
        color: TColors.primary,
        fontWeight: FontWeight.w600,
      ),
      toggleTextStyle: defaultTextStyle.copyWith(
        color: Theme.of(context).hintColor,
      ),
      hashtagStyle: defaultTextStyle.copyWith(
        color: TColors.primary,
        fontWeight: FontWeight.w500,
      ),
      urlStyle: defaultTextStyle.copyWith(
        color: TColors.primary,
        fontWeight: FontWeight.w500,
      ),
      toggleTextColor: TColors.primary,
      style: defaultTextStyle,
      maxLines: maxLines ?? (noMaxLines ? 100 : (hasVideo || hasImage ? 3 : 6)),
    );
  }
}
