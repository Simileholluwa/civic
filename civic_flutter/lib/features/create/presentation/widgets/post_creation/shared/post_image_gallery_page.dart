import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class PostImageGalleryPage extends StatelessWidget {
  const PostImageGalleryPage({
    required this.imageUrls,
    this.initialIndex = 0,
    super.key,
  });

  final List<String> imageUrls;
  final int initialIndex;

  ImageProvider _providerFor(String url) {
    final isNetwork = url.startsWith('http://') || url.startsWith('https://');
    if (isNetwork) return CachedNetworkImageProvider(url);
    return FileImage(File(url));
  }

  @override
  Widget build(BuildContext context) {
    if (imageUrls.isEmpty) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: SizedBox.shrink(),
      );
    }

    final clampedStart = initialIndex.clamp(0, imageUrls.length - 1);
    final controller = PageController(initialPage: clampedStart);
    final currentIndex = ValueNotifier<int>(clampedStart);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(
            height: 0,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Iconsax.arrow_left_2,
          ),
          onPressed: () => context.pop(),
        ),
        title: ValueListenableBuilder<int>(
          valueListenable: currentIndex,
          builder: (context, idx, _) => Text(
            '${idx + 1}/${imageUrls.length}',
          ),
        ),
        actions: [
          ValueListenableBuilder<int>(
            valueListenable: currentIndex,
            builder: (context, idx, _) => IconButton(
              tooltip: 'Save image',
              icon: const Icon(
                Iconsax.document_download,
              ),
              onPressed: () {
                final url = imageUrls[idx];
                unawaited(
                  THelperFunctions.saveImage(
                    url,
                  ),
                );
              },
            ),
          ),
          const SizedBox(width: 5),
        ],
      ),
      body: PageView.builder(
        controller: controller,
        onPageChanged: (i) => currentIndex.value = i,
        itemCount: imageUrls.length,
        itemBuilder: (context, i) {
          final url = imageUrls[i];
          return Center(
            child: InteractiveViewer(
              minScale: 1,
              maxScale: 4,
              child: Hero(
                tag: 'post-image-${url.hashCode}',
                child: Image(
                  image: _providerFor(url),
                  loadingBuilder: (_, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: 100,
                            width: 100,
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          ),
                          const Icon(
                            Iconsax.gallery5,
                            size: 70,
                          ),
                        ],
                      ),
                    );
                  },
                  fit: BoxFit.contain,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
