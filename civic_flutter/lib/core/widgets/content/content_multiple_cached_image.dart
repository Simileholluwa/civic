import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';

class ContentMultipleCachedImage extends StatelessWidget {
  const ContentMultipleCachedImage({
    required this.imageUrls,
    this.useMargin = true,
    super.key,
  });

  final List<String> imageUrls;
  final bool useMargin;

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
                      constraints: const BoxConstraints(
                        maxHeight: 400,
                        maxWidth: 400,
                      ),
                      child: ContentCachedImage(url: url),
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
