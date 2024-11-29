import 'dart:typed_data';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transparent_image/transparent_image.dart';

class ProjectPdfThumbnailViewer extends ConsumerWidget {
  const ProjectPdfThumbnailViewer({
    super.key,
    required this.project,
    required this.data,
  });
  final Project project;
  final List<Uint8List> data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int current = ref.watch(projectPDFAttachmentPageChangedProvider);
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 500,
        maxHeight: 500,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          TSizes.md,
        ),
        border: Border.all(
          color: Theme.of(context).dividerColor,
        ),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipRRect(
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
                    ref
                        .read(projectPDFAttachmentPageChangedProvider.notifier)
                        .carouselPageChanged(
                          index,
                          reason,
                        );
                  }),
              items: data.map((image) {
                return Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(
                      TSizes.md,
                    ),
                  ),
                  child: FadeInImage(
                    image: MemoryImage(
                      image,
                    ),
                    placeholder: MemoryImage(
                      kTransparentImage,
                    ),
                    fit: BoxFit.cover,
                  ),
                );
              }).toList(),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (data.length > 1)
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
                    children: data.asMap().entries.map((entry) {
                      return Container(
                        width: 12.0,
                        height: 12.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(
                            current == entry.key ? 0.9 : 0.4,
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
                child: ProjectPDFttachmentsOptions(
                  project: project,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
