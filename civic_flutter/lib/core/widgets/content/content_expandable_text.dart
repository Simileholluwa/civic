import 'package:civic_flutter/core/core.dart';
import 'package:expandable_richtext/expandable_rich_text.dart';
import 'package:flutter/material.dart';

class ContentExpandableText extends StatelessWidget {
  const ContentExpandableText({
    required this.text,
    this.onToggleTextTap,
    super.key,
    this.hasVideo = false,
    this.hasImage = false,
    this.noMaxLines = false,
    this.textStyle,
    this.maxLines,
    this.showSeeMore = true,
    this.expandOnTextTap = false,
    this.fontSize = 18,
  });

  final String text;
  final bool hasVideo;
  final bool hasImage;
  final int? maxLines;
  final TextStyle? textStyle;
  final bool noMaxLines;
  final VoidCallback? onToggleTextTap;
  final double fontSize;
  final bool expandOnTextTap;
  final bool showSeeMore;

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = textStyle ?? DefaultTextStyle.of(context).style;
    return ExpandableRichText(
      text,
      onToggleTextTap: onToggleTextTap,
      expandText: noMaxLines ? '' : showSeeMore ? 'see more' : '',
      mentionStyle: defaultTextStyle.copyWith(
        color: TColors.primary,
        fontWeight: FontWeight.w600,
        fontSize: fontSize,
      ),
      expandOnTextTap: expandOnTextTap,
      toggleTextStyle: defaultTextStyle.copyWith(
        color: Theme.of(context).hintColor,
        fontSize: fontSize,
      ),
      hashtagStyle: defaultTextStyle.copyWith(
        color: TColors.primary,
        fontWeight: FontWeight.w500,
        fontSize: fontSize,
      ),
      urlStyle: defaultTextStyle.copyWith(
        color: TColors.primary,
        fontWeight: FontWeight.w500,
        fontSize: fontSize,
      ),
      toggleTextColor: TColors.primary,
      style: defaultTextStyle.copyWith(
        fontSize: fontSize,
      ),
      maxLines: maxLines ?? (noMaxLines ? 100 : (hasVideo || hasImage ? 3 : 6)),
    );
  }
}
