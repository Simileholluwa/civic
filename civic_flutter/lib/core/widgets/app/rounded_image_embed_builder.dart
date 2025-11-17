import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill/internal.dart';

class RoundedImageEmbedBuilder extends EmbedBuilder {
  RoundedImageEmbedBuilder({required this.borderRadius});

  final BorderRadius borderRadius;

  @override
  String get key => BlockEmbed.imageType;

  @override
  Widget build(BuildContext context, EmbedContext embedContext) {
    final data = embedContext.node.value.data;
    final imageUrl = data is String ? data : data.toString();

    ImageProvider provider;
    if (isAndroidApp || isIosApp) {
      if (imageUrl.startsWith('http://') || imageUrl.startsWith('https://')) {
        provider = CachedNetworkImageProvider(
          imageUrl,
        );
      } else {
        provider = FileImage(
          File(
            imageUrl,
          ),
        );
      }
    } else {
      final uri = Uri.tryParse(imageUrl);
      if (uri != null && uri.scheme.isNotEmpty) {
        switch (uri.scheme) {
          case 'file':
            provider = FileImage(
              File(
                uri.toFilePath(),
              ),
            );
          case 'asset':
            provider = AssetImage(uri.path);
          case 'http':
          case 'https':
            provider = CachedNetworkImageProvider(
              imageUrl,
            );
          default:
            provider = FileImage(
              File(
                imageUrl,
              ),
            );
        }
      } else {
        provider = FileImage(
          File(
            imageUrl,
          ),
        );
      }
    }

    final imageWidget = Image(
      image: provider,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 20,
            ),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: const Color(0xfffff1f1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 20,
            ),
            child: Center(
              child: Text(
                'We were unable to load this image. It may have been deleted or moved.',
                style: TextStyle(
                  color: Color(0xffff4545),
                ),
              ),
            ),
          ),
        );
      },
    );

    return ClipRRect(
      borderRadius: borderRadius,
      child: imageWidget,
    );
  }
}
