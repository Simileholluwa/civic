import 'dart:typed_data';

import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ContentMultipleCachedImage extends StatelessWidget {
  const ContentMultipleCachedImage({
    required this.imageUrls,
    this.useMargin = true,
    this.isUrl = true,
    this.maxHeight = 300,
    super.key,
  });

  final List<dynamic> imageUrls;
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
        borderRadius: BorderRadius.circular(
          TSizes.md,
        ),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imageUrls.asMap().entries.map((image) {
                final url = image.value;
                final isLast = image.key == imageUrls.length - 1;
                return Row(
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: maxHeight,
                        maxWidth: maxHeight,
                      ),
                      child: isUrl
                          ? ContentCachedImage(url: url as String, height: maxHeight,)
                          : FadeInImage(
                              image: MemoryImage(
                                url as Uint8List,
                              ),
                              placeholder: MemoryImage(
                                kTransparentImage,
                              ),
                              fit: BoxFit.cover,
                            ),
                    ),
                    if (!isLast)
                      const SizedBox(
                        width: 10,
                      ),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
