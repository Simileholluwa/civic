import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/create/create.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:transparent_image/transparent_image.dart';

class ContentCreationImageViewer extends StatelessWidget {
  const ContentCreationImageViewer({
    required this.imageUrls,
    required this.current,
    required this.pickImage,
    required this.takeImage,
    required this.onPageChanged,
    required this.pageIndex,
    required this.removeAllImages,
    required this.removeImageAtIndex,
    required this.imageLength,
    required this.maxLength,
    super.key,
  });

  final List<String> imageUrls;
  final int current;
  final VoidCallback pickImage;
  final VoidCallback takeImage;
  final VoidCallback removeAllImages;
  final void Function(int, CarouselPageChangedReason)? onPageChanged;
  final void Function(int) removeImageAtIndex;
  final int pageIndex;
  final int imageLength;
  final int maxLength;

  @override
  Widget build(BuildContext context) {
    final regex = RegExp(r'\b(https?://[^\s/$.?#].[^\s]*)\b');
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (imageUrls.isEmpty)
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
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(
                          Iconsax.gallery5,
                          size: 60,
                          color: Colors.grey[600],
                        ),
                        onPressed: pickImage,
                      ),
                      IconButton(
                        icon: Icon(
                          Iconsax.camera5,
                          size: 60,
                          color: Colors.grey[600],
                        ),
                        onPressed: takeImage,
                      ),
                    ],
                  ),
                  Center(
                    child: Text(
                      'Select or capture up to 5 images.',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        if (imageUrls.isNotEmpty)
          Stack(
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
                      onPageChanged: onPageChanged,
                    ),
                    items: imageUrls.map((image) {
                      return Builder(
                        builder: (context) {
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
                                        )
                                        as ImageProvider,
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
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (imageUrls.length > 1)
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
                        children: imageUrls.asMap().entries.map((entry) {
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
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 5,
                    ),
                    child: ContentCreationMediaOptions(
                      pageIndex: pageIndex,
                      takeImage: takeImage,
                      pickImage: pickImage,
                      maxLength: maxLength,
                      imageLength: imageLength,
                      removeAllImages: removeAllImages,
                      removeImageAtIndex: removeImageAtIndex,
                    ),
                  ),
                ],
              ),
            ],
          ),
      ],
    );
  }
}
