import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

class DarftPostText extends StatelessWidget {
  const DarftPostText({
    super.key,
    required this.post,
  });

  final DraftPost post;

  @override
  Widget build(BuildContext context) {
    return ExpandableText(
      post.text,
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
      maxLines: 3,
      linkColor: TColors.primary,
      linkStyle: Theme.of(context).textTheme.labelLarge,
    );
  }
}
