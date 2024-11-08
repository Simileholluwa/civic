import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

class CreateContentDraftText extends StatelessWidget {
  const CreateContentDraftText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return ExpandableText(
      text,
      mentionStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
            fontWeight: FontWeight.bold,
            color: TColors.primary,
          ),
      hashtagStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
            fontWeight: FontWeight.bold,
            color: TColors.primary,
          ),
      urlStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
            fontWeight: FontWeight.bold,
            color: TColors.primary,
          ),
      style: Theme.of(context).textTheme.labelLarge,
      expandText: 'show more.',
      collapseText: 'show less.',
      maxLines: 6,
      linkColor: TColors.primary,
      linkStyle: Theme.of(context).textTheme.labelLarge,
      textAlign: TextAlign.start,
    );
  }
}
