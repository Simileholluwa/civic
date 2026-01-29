import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/create/create.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transparent_image/transparent_image.dart';

class ContentImageViewer extends ConsumerWidget {
  const ContentImageViewer({
    required this.mediaAssets,
    this.addPadding = true,
    super.key,
  });

  final List<MediaAsset> mediaAssets;
  final bool addPadding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final regex = RegExp(r'\b(https?://[^\s/$.?#].[^\s]*)\b');
    final imageAssets = mediaAssets
        .where(
          (a) =>
              a.kind == MediaKind.image && (a.publicUrl?.isNotEmpty ?? false),
        )
        .toList(growable: false);
    final imageUrls = imageAssets
        .map((a) => a.publicUrl!)
        .toList(growable: false);

    Future<void> openGallery(String tappedImage) async {
      final images = imageUrls;
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

    Widget buildDynamicCollage(List<MediaAsset> assets) {
      final display = assets.take(4).toList(growable: false);
      final extra = assets.length - display.length;

      Widget tile(MediaAsset asset, {BorderRadius? radius}) {
        final img = asset.publicUrl!;
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

      Widget overlayTile(MediaAsset asset, int extra) {
        return Stack(
          fit: StackFit.expand,
          children: [
            tile(
              asset,
              radius: const BorderRadius.only(
                bottomRight: Radius.circular(TSizes.md),
              ),
            ),
            InkWell(
              onTap: () => openGallery(asset.publicUrl!),
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

      final aspectRatios = display.map((a) {
        final w = a.width ?? 1;
        final h = a.height ?? 1;
        return w / h;
      }).toList();

      if (display.length == 2) {
        final ar0 = aspectRatios[0];
        final ar1 = aspectRatios[1];
        final isLandscape0 = ar0 >= 1.0;
        final isLandscape1 = ar1 >= 1.0;

        if (isLandscape0 && isLandscape1) {
          return Column(
            children: [
              Expanded(
                flex: (ar0 * 100).toInt(),
                child: tile(
                  display[0],
                  radius: const BorderRadius.only(
                    topLeft: Radius.circular(TSizes.md),
                    topRight: Radius.circular(TSizes.md),
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Expanded(
                flex: (ar1 * 100).toInt(),
                child: tile(
                  display[1],
                  radius: const BorderRadius.only(
                    bottomLeft: Radius.circular(TSizes.md),
                    bottomRight: Radius.circular(TSizes.md),
                  ),
                ),
              ),
            ],
          );
        } else if (!isLandscape0 && !isLandscape1) {
          return Row(
            children: [
              Expanded(
                flex: (1 / ar0 * 100).toInt(),
                child: tile(
                  display[0],
                  radius: const BorderRadius.only(
                    topLeft: Radius.circular(TSizes.md),
                    topRight: Radius.circular(TSizes.md),
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Expanded(
                flex: (1 / ar1 * 100).toInt(),
                child: tile(
                  display[1],
                  radius: const BorderRadius.only(
                    bottomLeft: Radius.circular(TSizes.md),
                    bottomRight: Radius.circular(TSizes.md),
                  ),
                ),
              ),
            ],
          );
        } else {
          return Row(
            children: [
              Expanded(
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
                child: tile(
                  display[1],
                  radius: const BorderRadius.only(
                    topRight: Radius.circular(TSizes.md),
                    bottomRight: Radius.circular(TSizes.md),
                  ),
                ),
              ),
            ],
          );
        }
      }

      if (display.length == 3) {
        final maxIdx = aspectRatios.indexOf(
          aspectRatios.reduce((a, b) => a > b ? a : b),
        );
        final main = display[maxIdx];
        final others = List<MediaAsset>.from(display)..removeAt(maxIdx);
        return Row(
          children: [
            Expanded(
              flex: 2,
              child: tile(
                main,
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
                      others[0],
                      radius: const BorderRadius.only(
                        topRight: Radius.circular(TSizes.md),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Expanded(
                    child: tile(
                      others[1],
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

      if (display.length == 4) {
        return Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: tile(
                      display[0],
                      radius: const BorderRadius.only(
                        topLeft: Radius.circular(TSizes.md),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Expanded(
                    child: tile(
                      display[2],
                      radius: const BorderRadius.only(
                        bottomLeft: Radius.circular(TSizes.md),
                      ),
                    ),
                  ),
                ],
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

      return buildSingle(display.first.publicUrl!);
    }

    return Padding(
      padding: addPadding
          ? const EdgeInsets.symmetric(horizontal: TSizes.md)
          : EdgeInsets.zero,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            constraints: const BoxConstraints(maxHeight: 500),
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).dividerColor),
              borderRadius: BorderRadius.circular(TSizes.md),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(TSizes.md),
              child: AspectRatio(
                aspectRatio: 1,
                child: imageAssets.length <= 1
                    ? buildSingle(imageUrls.first)
                    : LayoutBuilder(
                        builder: (context, constraints) {
                          return buildDynamicCollage(imageAssets);
                        },
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
