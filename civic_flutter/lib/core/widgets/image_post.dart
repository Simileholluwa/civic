import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/providers/integer_provider.dart';
import 'package:civic_flutter/core/widgets/image_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transparent_image/transparent_image.dart';

class ImagePost extends ConsumerWidget {
  const ImagePost({
    super.key,
    required this.images,
    this.showImageOptions = true,
    this.height = 500,
    this.showBorder = true,
    this.padding = TSizes.md,
    this.fullBorder = true,
  });

  final bool showImageOptions;
  final List<String> images;
  final double height;
  final double padding;
  final bool showBorder;
  final bool fullBorder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 500,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: padding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showImageOptions) const ImageOptions(),
          Container(
            constraints: BoxConstraints(
              maxWidth: 500,
              maxHeight: height,
            ),
            decoration: BoxDecoration(
              border: showBorder == true
                  ? Border.all(
                      color: Theme.of(context).dividerColor,
                    )
                  : null,
              borderRadius: BorderRadius.circular(
                TSizes.md,
              ),
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: ClipRRect(
              borderRadius: fullBorder
                  ? BorderRadius.circular(
                      TSizes.md,
                    )
                  : const BorderRadius.only(
                      bottomLeft: Radius.circular(
                        TSizes.md,
                      ),
                      bottomRight: Radius.circular(
                        TSizes.md,
                      ),
                    ),
              child: CarouselSlider(
                options: CarouselOptions(
                  scrollPhysics: const ClampingScrollPhysics(),
                  height: height - 2,
                  enableInfiniteScroll: false,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) => ref
                      .read(pageChangedProvider.notifier)
                      .carouselPageChanged(
                        index,
                        reason,
                      ),
                ),
                items: images.map((images) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: fullBorder
                              ? BorderRadius.circular(
                                  TSizes.md,
                                )
                              : const BorderRadius.only(
                                  bottomLeft: Radius.circular(
                                    TSizes.md,
                                  ),
                                  bottomRight: Radius.circular(
                                    TSizes.md,
                                  ),
                                ),
                        ),
                        child: FadeInImage(
                          image: FileImage(
                            File(images),
                          ),
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
          
        ],
      ),
    );
  }
}
