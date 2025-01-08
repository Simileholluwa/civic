import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';

class ContentSingleCachedImage extends StatelessWidget {
  const ContentSingleCachedImage({
    required this.imageUrl,
    super.key,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.fromLTRB(15, 0, 15, 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          TSizes.md,
        ),
        color: Theme.of(context).cardColor,
        border: Border.all(
          color: Theme.of(context).dividerColor,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(TSizes.md),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: 400,
          ),
          child: ContentCachedImage(url: imageUrl),   
        ),
      ),
    );
  }
}
