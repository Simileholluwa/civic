import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/providers/integer_provider.dart';
import 'package:civic_flutter/core/widgets/create_content/create_content_image_options.dart';
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
    int current = ref.watch(pageChangedProvider);
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
          if (showImageOptions) const CreateContentImageOptions(),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
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
                        onPageChanged: (index, reason) {
                          ref
                              .read(pageChangedProvider.notifier)
                              .carouselPageChanged(
                                index,
                                reason,
                              );
                        }),
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
              if (images.length > 1)
                Container(
                  margin: const EdgeInsets.only(bottom: TSizes.md,),
                  padding: const EdgeInsets.symmetric(horizontal: TSizes.sm,),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100,),
                    color: Colors.black54,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: images.asMap().entries.map((entry) {
                      return Container(
                        width: 12.0,
                        height: 12.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: 
                                Colors.white
                              .withOpacity(
                            current == entry.key ? 0.9 : 0.4,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
