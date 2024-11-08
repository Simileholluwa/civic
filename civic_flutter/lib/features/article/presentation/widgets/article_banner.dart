import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/article/presentation/helper/article_helper_functions.dart';
import 'package:civic_flutter/features/article/presentation/providers/article_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ArticleBanner extends ConsumerWidget {
  const ArticleBanner({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articleWriter = ref.watch(
      articleWriterProvider(article),
    );
    final articleWriterNotifier =
        ref.read(articleWriterProvider(article).notifier);
    final regex = RegExp(r'\b(https?://[^\s/$.?#].[^\s]*)\b');
    var isUrlImage = regex.hasMatch(articleWriter.banner);
    return Stack(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: THelperFunctions.isDarkMode(context)
                ? TColors.dark
                : TColors.light,
            image: articleWriter.banner.isNotEmpty
                ? DecorationImage(
                    image: isUrlImage
                        ? CachedNetworkImageProvider(articleWriter.banner)
                        : FileImage(
                            File(
                              articleWriter.banner,
                            ),
                          ) as ImageProvider<Object>,
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          child: articleWriter.banner.isEmpty
              ? Column(
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
                            onPressed: () async {
                              final banner =
                                  await ArticleHelperFunctions.pickBannerImage(
                                ref,
                                context,
                              );
                              articleWriterNotifier.setBannerImage(banner);
                              isUrlImage = false;
                            }),
                        IconButton(
                            icon: Icon(
                              Iconsax.camera5,
                              size: 60,
                              color: Colors.grey[600],
                            ),
                            onPressed: () async {
                              final banner =
                                  await ArticleHelperFunctions.captureBannerImage(
                                ref,
                                context,
                              );
                              articleWriterNotifier.setBannerImage(banner);
                              isUrlImage = false;
                            }),
                      ],
                    ),
                    Text(
                      'Add a Banner Image',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                )
              : null,
        ),
        if (articleWriter.banner.isNotEmpty)
          Positioned(
            bottom: 8,
            right: 8,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: TColors.textWhite,
                    ),
                    onPressed: () {
                      articleWriterNotifier.clearBannerImage();
                      isUrlImage = false;
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Iconsax.gallery5,
                      color: TColors.textWhite,
                    ),
                    onPressed: () async {
                      final banner = await ArticleHelperFunctions.pickBannerImage(
                        ref,
                        context,
                      );
                      articleWriterNotifier.setBannerImage(banner);
                      isUrlImage = false;
                    },
                  ),
                  IconButton(
                      icon: const Icon(
                        Iconsax.camera5,
                        color: TColors.textWhite,
                      ),
                      onPressed: () async {
                        final banner =
                            await ArticleHelperFunctions.captureBannerImage(
                          ref,
                          context,
                        );
                        articleWriterNotifier.setBannerImage(banner);
                        isUrlImage = false;
                      }),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
