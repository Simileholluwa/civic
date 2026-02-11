import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transparent_image/transparent_image.dart';

class AddedVettingImage extends ConsumerWidget {
  const AddedVettingImage({
    required this.projectVetting,
    super.key,
  });

  final ProjectVetting? projectVetting;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final regex = RegExp(r'\b(https?://[^\s/$.?#].[^\s]*)\b');
    final vettedProjectState = ref.watch(
      projectVetProvider(
        projectVetting,
      ),
    );
    final pageIndex = ref.watch(vettingImagePageChangedProvider);
    final pageIndexNotifier =
        ref.watch(vettingImagePageChangedProvider.notifier);
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          constraints: const BoxConstraints(
            maxHeight: 400,
          ),
          margin: const EdgeInsets.only(
            top: 5,
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
                  pageIndexNotifier.carouselPageChanged(
                    index,
                    reason,
                  );
                },
              ),
              items: vettedProjectState.images.map((image) {
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
        if (vettedProjectState.images.isNotEmpty)
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (vettedProjectState.images.length > 1)
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
                        vettedProjectState.images.asMap().entries.map((entry) {
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
                            alpha: pageIndex == entry.key ? 0.9 : 0.4,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              AddedVettingImageOptions(
                projectVetting: projectVetting,
              ),
            ],
          ),
      ],
    );
  }
}
