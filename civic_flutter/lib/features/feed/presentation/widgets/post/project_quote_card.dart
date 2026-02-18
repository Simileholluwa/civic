import 'package:cached_network_image/cached_network_image.dart';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/create/create.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectQuoteCard extends StatelessWidget {
  const ProjectQuoteCard({
    required this.project,
    this.useMargin = true,
    this.showProjectOwner = true,
    super.key,
  });

  final Project project;
  final bool useMargin;
  final bool showProjectOwner;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final images = project.projectMediaAssets
        ?.where((e) => e.kind == MediaKind.image)
        .map((e) => e.publicUrl)
        .whereType<String>()
        .toList();
    return Container(
      margin: useMargin ? const EdgeInsets.fromLTRB(15, 0, 15, 0) : null,
      padding: const EdgeInsets.all(
        15,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          TSizes.md,
        ),
        border: Border.all(
          color: theme.dividerColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          if (showProjectOwner)
            QuotedPostCreatorInfo(
              owner: project.owner!,
              dateCreated: project.dateCreated!,
            ),
          Text(
            project.title!,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          ProjectPlainTextDescription(
            project: project,
          ),
          ProjectQuickDetails(
            project: project,
            showPadding: false,
          ),
          SizedBox(
            height: 40,
            child: Row(
              children: [
                SizedBox(
                  width: 90,
                  height: 40,
                  child: Stack(
                    children: [
                      for (int i = 0; i < images!.length && i < 3; i++)
                        Positioned(
                          left: i * 25.0,
                          top: 0,
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: i != 0
                                    ? theme.scaffoldBackgroundColor
                                    : theme.dividerColor,
                                width: 3,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: CachedNetworkImage(
                                imageUrl: images[i],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      if (project.projectMediaAssets!.length > 3)
                        Positioned(
                          left: 3 * 25.0,
                          top: 0,
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: theme.cardColor.withValues(
                                alpha: .8,
                              ),
                              border: Border.all(
                                color: theme.dividerColor,
                                width: 2,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              '+${project.projectMediaAssets!.length - 3}',
                              style: theme.textTheme.labelMedium,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                const Spacer(),
                Consumer(
                  builder: (context, ref, child) {
                    return TextButton(
                      onPressed: () async {
                        ref.read(bottomNavVisibilityProvider.notifier).hide();
                        await Navigator.of(context).push(
                          MaterialPageRoute<Widget>(
                            builder: (_) => PostImageGalleryPage(
                              imageUrls: images,
                            ),
                          ),
                        );
                        ref.read(bottomNavVisibilityProvider.notifier).show();
                      },
                      style: TextButton.styleFrom(
                        minimumSize: const Size(80, 40),
                        backgroundColor: Theme.of(context).cardColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      child: Text(
                        images.length > 1 ? 'View Photos' : 'View Photo',
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
