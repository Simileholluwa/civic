import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/create/create.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transparent_image/transparent_image.dart';

class PostImagePost extends ConsumerWidget {
  const PostImagePost({
    required this.post,
    this.addPadding = true,
    this.showInteractions = true,
    super.key,
  });

  final Post post;
  final bool showInteractions;
  final bool addPadding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final regex = RegExp(r'\b(https?://[^\s/$.?#].[^\s]*)\b');
    final postState = ref.watch(
      postCreationProvider(post),
    );

    Future<void> openGallery(String tappedImage) async {
      final images = postState.imageUrls;
      if (images.isEmpty) return;
      final initialIndex = images.indexOf(tappedImage);
      ref.read(bottomNavVisibilityProvider.notifier).hide();
      await Navigator.of(context).push(
        MaterialPageRoute<Widget>(
          builder: (_) => PostImageGalleryPage(
            imageUrls: images,
            initialIndex: initialIndex < 0 ? 0 : initialIndex,
          ),
        ),
      );
      ref.read(bottomNavVisibilityProvider.notifier).show();
    }

    Widget buildSingle(String image) {
      final tag = 'post-image-${image.hashCode}';
      return GestureDetector(
        onTap: () => openGallery(image),
        child: Hero(
          tag: tag,
          child: FadeInImage(
            placeholderColor: Theme.of(context).cardColor,
            image: regex.hasMatch(image)
                ? CachedNetworkImageProvider(image)
                : FileImage(File(image)) as ImageProvider,
            placeholder: MemoryImage(kTransparentImage),
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    Widget buildCollage(List<String> images) {
      final display = images.take(4).toList(growable: false);
      final extra = images.length - display.length;

      Widget tile(String img, {BorderRadius? radius}) {
        return ClipRRect(
          borderRadius: radius ?? BorderRadius.circular(TSizes.sm),
          child: InkWell(
            onTap: () => openGallery(img),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Theme.of(context).cardColor,
              child: buildSingle(img),
            ),
          ),
        );
      }

      Widget overlayTile(String img, int extra) {
        return Stack(
          fit: StackFit.expand,
          children: [
            tile(
              img,
              radius: const BorderRadius.only(
                bottomRight: Radius.circular(TSizes.md),
              ),
            ),
            InkWell(
              onTap: () => openGallery(img),
              child: Container(
                color: Colors.black45,
                alignment: Alignment.center,
                child: Text(
                  '+$extra',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
          ],
        );
      }

      if (display.length == 2) {
        return Row(
          children: [
            Expanded(
              child: tile(
                display[0],
                radius: const BorderRadius.only(
                  topLeft: Radius.circular(TSizes.md),
                  bottomLeft: Radius.circular(
                    TSizes.md,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: tile(
                display[1],
                radius: const BorderRadius.only(
                  topRight: Radius.circular(TSizes.md),
                  bottomRight: Radius.circular(
                    TSizes.md,
                  ),
                ),
              ),
            ),
          ],
        );
      }
      if (display.length == 3) {
        return Row(
          children: [
            Expanded(
              flex: 2,
              child: tile(
                display[0],
                radius: const BorderRadius.only(
                  topLeft: Radius.circular(TSizes.md),
                  bottomLeft: Radius.circular(
                    TSizes.md,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: tile(
                      display[1],
                      radius: const BorderRadius.only(
                        topRight: Radius.circular(
                          TSizes.md,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Expanded(
                    child: tile(
                      display[2],
                      radius: const BorderRadius.only(
                        bottomRight: Radius.circular(
                          TSizes.md,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }
      return Row(
        children: [
          Expanded(
            flex: 2,
            child: tile(
              display[0],
              radius: const BorderRadius.only(
                topLeft: Radius.circular(TSizes.md),
                bottomLeft: Radius.circular(TSizes.md),
              ),
            ),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: tile(
                    display[1],
                    radius: const BorderRadius.only(
                      topRight: Radius.circular(TSizes.md),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Expanded(
                  child: tile(
                    display[2],
                    radius: BorderRadius.zero,
                  ),
                ),
                const SizedBox(height: 4),
                Expanded(
                  child: extra > 0
                      ? overlayTile(display[3], extra)
                      : tile(
                          display[3],
                          radius: const BorderRadius.only(
                            bottomRight: Radius.circular(TSizes.md),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ],
      );
    }

    return Padding(
      padding: addPadding
          ? const EdgeInsets.symmetric(
              horizontal: TSizes.md,
            )
          : EdgeInsets.zero,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            constraints: const BoxConstraints(
              maxHeight: 500,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).dividerColor,
              ),
              borderRadius: BorderRadius.circular(
                TSizes.md,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(TSizes.md),
              child: AspectRatio(
                aspectRatio: 1,
                child: postState.imageUrls.length <= 1
                    ? buildSingle(postState.imageUrls.first)
                    : LayoutBuilder(
                        builder: (context, constraints) {
                          return buildCollage(
                            postState.imageUrls,
                          );
                        },
                      ),
              ),
            ),
          ),
          if (postState.imageUrls.isNotEmpty && showInteractions)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: PostImageOptions(post: post),
            ),
        ],
      ),
    );
  }
}
