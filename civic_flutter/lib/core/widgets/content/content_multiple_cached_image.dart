import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';

class ContentMultipleCachedImage extends StatelessWidget {
  const ContentMultipleCachedImage({
    required this.imageUrls,
    super.key,
  });

  final List<String> imageUrls;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.fromLTRB(15, 0, 15, 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          TSizes.md,
        ),
        color: THelperFunctions.isDarkMode(context)
                ? TColors.dark
                : TColors.light,
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
