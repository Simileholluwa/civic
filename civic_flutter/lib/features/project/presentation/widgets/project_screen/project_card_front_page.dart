import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/create/create.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:timeago/timeago.dart' as timeago;

class ProjectCardFrontPage extends StatelessWidget {
  const ProjectCardFrontPage({
    required this.projectWithUserState,
    super.key,
  });

  final ProjectWithUserState projectWithUserState;

  @override
  Widget build(BuildContext context) {
    final project = projectWithUserState.project;
    final imagesUrl = project.projectMediaAssets
        ?.where((e) => e.kind == MediaKind.image)
        .map((e) => e.publicUrl)
        .whereType<String>()
        .toList();
    return InkWell(
      onTap:() async {
        await context.push(
          '/project/${project.id}',
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 15,
            children: [
              SizedBox(
                height: 250,
                child: Consumer(
                  builder: (context, ref, child) {
                    return GestureDetector(
                      onTap: () async {
                        ref
                            .read(
                              bottomNavVisibilityProvider.notifier,
                            )
                            .hide();
                        await Navigator.of(context).push(
                          MaterialPageRoute<Widget>(
                            builder: (_) => PostImageGalleryPage(
                              imageUrls: imagesUrl,
                            ),
                          ),
                        );
                        ref
                            .read(
                              bottomNavVisibilityProvider.notifier,
                            )
                            .show();
                      },
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                            child: CarouselSlider(
                              options: CarouselOptions(
                                height: 250,
                                enableInfiniteScroll: imagesUrl!.length > 1,
                                autoPlay: imagesUrl.length > 1,
                                viewportFraction: 1,
                                scrollPhysics: const BouncingScrollPhysics(),
                              ),
                              items: imagesUrl.map((url) {
                                return CachedNetworkImage(
                                  imageUrl: url,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                );
                              }).toList(),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black87,
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 15,
                            right: 15,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.circular(
                                  999,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Iconsax.element_35,
                                    size: 14,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    project.projectCategory ?? 'General',
                                    style: Theme.of(context).textTheme.labelMedium
                                        ?.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 18,
                            right: 18,
                            bottom: 18,
                            child: Text(
                              project.title!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.headlineLarge
                                  ?.copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: Column(
                  spacing: 15,
                  children: [
                    ContentCreatorInfo(
                      creator: project.owner!,
                      timeAgo: timeago.format(
                        project.dateCreated!,
                        locale: 'en_short',
                      ),
                      onMoreTapped: () async {
                        await showDialog<dynamic>(
                          context: context,
                          builder: (ctx) {
                            return AlertDialog(
                              contentPadding: const EdgeInsets.only(
                                bottom: 16,
                              ),
                              content: ShowProjectActions(
                                projectWithUserState: projectWithUserState,
                                fromDetails: true,
                              ),
                            );
                          },
                        );
                      },
                    ),
                    ProjectQuickDetails(
                      project: project,
                      showPadding: false,
                    ),
                    ProjectPlainTextDescription(
                      project: project,
                    ),
                  ],
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(15),
                  border: Border(
                    top: BorderSide(
                      color: Theme.of(context).dividerColor,
                    ),
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: ProjectInteractionButtons(
                  projectWithUserState: projectWithUserState,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
