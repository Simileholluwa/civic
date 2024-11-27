import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/providers/integer_provider.dart';
import 'package:civic_flutter/features/project/presentation/providers/project_provider.dart';
import 'package:civic_flutter/features/project/presentation/widgets/project_pdf_attachments_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:transparent_image/transparent_image.dart';

class ProjectPDFAttachmentsTabView extends ConsumerWidget {
  const ProjectPDFAttachmentsTabView({
    super.key,
    required this.project,
  });

  final Project project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectState = ref.watch(projectProviderProvider(project));
    final projectNotifier =
        ref.watch(projectProviderProvider(project).notifier);
    final pdfs = projectState.projectPDFAttachments ?? [];
    int current = ref.watch(projectPDFAttachmentPageChangedProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: [
          if (pdfs.isEmpty)
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
                    IconButton(
                      icon: Icon(
                        Iconsax.folder5,
                        size: 60,
                        color: Colors.grey[600],
                      ),
                      onPressed: projectNotifier.pickPDFs,
                    ),
                    Center(
                      child: Text(
                        'Select up to 5 PDFs from your device.',
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
          if (pdfs.isNotEmpty)
            Container(
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
                  FutureBuilder(
                      future: projectNotifier.getPdfThumbnails(pdfs),
                      builder: (context, snapshot) {
                        log(snapshot.data.toString());
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (snapshot.data == null) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (snapshot.data!.isEmpty) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.not_accessible,
                                  size: 60,
                                  color: Colors.grey[600],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Center(
                                  child: Text(
                                    "We couldn't load your pdf.",
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                        final thumbnails = snapshot.data!;
                        return ClipRRect(
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
                                      .read(
                                          projectPDFAttachmentPageChangedProvider
                                              .notifier)
                                      .carouselPageChanged(
                                        index,
                                        reason,
                                      );
                                }),
                            items: thumbnails.map((image) {
                              return Container(
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
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
                        );
                      }),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (pdfs.length > 1)
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
                            children: pdfs.asMap().entries.map((entry) {
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
            ),
        ],
      ),
    );
  }
}
