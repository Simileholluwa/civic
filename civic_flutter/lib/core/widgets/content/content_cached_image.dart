import 'package:cached_network_image/cached_network_image.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ContentCachedImage extends StatelessWidget {
  const ContentCachedImage({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.cover,
      errorWidget: (context, url, error) {
        return Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 70,
                width: 70,
                child: CircularProgressIndicator(
                  backgroundColor:
                      THelperFunctions.isDarkMode(context)
                          ? TColors.dark
                          : TColors.light,
                ),
              ),
              const Icon(
                Iconsax.image,
                size: 40,
              ),
            ],
          ),
        );
      },
      progressIndicatorBuilder: (context, child, progress) {
        return Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 70,
                width: 70,
                child: CircularProgressIndicator(
                  value: progress.totalSize != null
                      ? progress.downloaded /
                          progress.totalSize!
                      : null,
                  backgroundColor:
                      THelperFunctions.isDarkMode(context)
                          ? TColors.dark
                          : TColors.light,
                ),
              ),
              const Icon(
                Iconsax.image,
                size: 40,
              ),
            ],
          ),
        );
      },
    );
  }
}
