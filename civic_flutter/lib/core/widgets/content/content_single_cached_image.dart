import 'package:cached_network_image/cached_network_image.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/create/create.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContentSingleCachedImage extends ConsumerWidget {
  const ContentSingleCachedImage({
    required this.imageUrl,
    required this.aspectRatio, this.useMargin = true,
    this.isUrl = true,
    super.key,
  });

  final String imageUrl;
  final bool useMargin;
  final bool isUrl;
  final double aspectRatio;


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () async {
        ref.read(bottomNavVisibilityProvider.notifier).hide();
        await Navigator.of(context).push(
          MaterialPageRoute<Widget>(
            builder: (_) => PostImageGalleryPage(
              imageUrls: [imageUrl],
            ),
          ),
        );
        ref.read(bottomNavVisibilityProvider.notifier).show();
      },
      child: Container(
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
          child: AspectRatio(
            aspectRatio: aspectRatio > 1.0 ? aspectRatio : 1.0,
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) {
                return Center(
                  child: Icon(
                    Icons.broken_image,
                    size: 50,
                    color: Theme.of(context).colorScheme.error,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
