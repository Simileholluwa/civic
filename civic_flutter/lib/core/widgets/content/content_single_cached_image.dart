import 'dart:typed_data';

import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ContentSingleCachedImage extends StatelessWidget {
  const ContentSingleCachedImage({
    required this.imageUrl,
    this.useMargin = true,
    this.isUrl = true,
    this.maxHeight = 300,
    super.key,
  });

  final dynamic imageUrl;
  final bool useMargin;
  final bool isUrl;
  final double maxHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: useMargin ? const EdgeInsets.fromLTRB(15, 0, 15, 0) : null,
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
          constraints: BoxConstraints(
            maxHeight: maxHeight,
          ),
          child: isUrl
              ? ContentCachedImage(url: imageUrl as String, height: maxHeight,)
              : FadeInImage(
                  image: MemoryImage(
                    imageUrl as Uint8List,
                  ),
                  placeholder: MemoryImage(
                    kTransparentImage,
                  ),
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }
}
