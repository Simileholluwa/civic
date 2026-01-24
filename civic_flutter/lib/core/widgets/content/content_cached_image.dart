import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ContentCachedImage extends StatelessWidget {
  const ContentCachedImage({
    required this.url,
    required this.height,
    super.key,
  });

  final String url;
  final double height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.cover,
      errorWidget: (context, url, error) {
        return SizedBox(
          height: height,
        );
      },
    );
  }
}
