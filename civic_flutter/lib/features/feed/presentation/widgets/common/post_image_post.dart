import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transparent_image/transparent_image.dart';

class PostImagePost extends ConsumerWidget {
  const PostImagePost({
    required this.post,
    super.key,
  });

  final Post post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final regex = RegExp(r'\b(https?://[^\s/$.?#].[^\s]*)\b');
    final current = ref.watch(pageChangedProvider);
    final postState = ref.watch(
      feedProvider(post),
    );
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 500,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: TSizes.md,
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            constraints: const BoxConstraints(
              maxWidth: 500,
              maxHeight: 500,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).dividerColor,
              ),
              borderRadius: BorderRadius.circular(
                TSizes.md,
              ),
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                TSizes.md,
              ),
              child: CarouselSlider(
                options: CarouselOptions(
                  scrollPhysics: const ClampingScrollPhysics(),
                  height: 498,
                  enableInfiniteScroll: false,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    ref.read(pageChangedProvider.notifier).carouselPageChanged(
                          index,
                          reason,
                        );
                  },
                ),
                items: postState.imageUrls.map((image) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(
                            TSizes.md,
                          ),
                        ),
                        child: FadeInImage(
                          image: regex.hasMatch(image)
                              ? CachedNetworkImageProvider(image)
                              : FileImage(
                                  File(image),
                                ) as ImageProvider,
                          placeholder: MemoryImage(
                            kTransparentImage,
                          ),
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ),
          if (postState.imageUrls.isNotEmpty)
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (postState.imageUrls.length > 1)
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: TSizes.md,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: TSizes.sm,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        100,
                      ),
                      color: Colors.black54,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                          postState.imageUrls.asMap().entries.map((entry) {
                        return Container(
                          width: 12,
                          height: 12,
                          margin: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 4,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withValues(
                              alpha: current == entry.key ? 0.9 : 0.4,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                PostImageOptions(
                  post: post,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
