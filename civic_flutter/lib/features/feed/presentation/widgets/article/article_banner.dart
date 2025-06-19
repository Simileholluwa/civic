import 'package:civic_client/civic_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'dart:io';
import 'package:civic_flutter/core/core.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ArticleBanner extends ConsumerWidget {
  const ArticleBanner({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postState = ref.watch(feedProvider(post));
    final postNotifier = ref.watch(feedProvider(post).notifier);
    final regex = RegExp(r'\b(https?://[^\s/$.?#].[^\s]*)\b');
    var isUrlImage = postState.imageUrls.isEmpty
        ? false
        : regex.hasMatch(postState.imageUrls.first);
    return Stack(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            image: postState.imageUrls.isNotEmpty
                ? DecorationImage(
                    image: isUrlImage
                        ? CachedNetworkImageProvider(postState.imageUrls.first)
                        : FileImage(
                            File(
                              postState.imageUrls.first,
                            ),
                          ) as ImageProvider<Object>,
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          child: postState.imageUrls.isEmpty
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
                              postNotifier.clearMedia();
                              await postNotifier.pickPicture(1);
                              isUrlImage = false;
                            }),
                        IconButton(
                            icon: Icon(
                              Iconsax.camera5,
                              size: 60,
                              color: Colors.grey[600],
                            ),
                            onPressed: () async {
                              postNotifier.clearMedia();
                              await postNotifier.takePicture(1);
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
        if (postState.imageUrls.isNotEmpty)
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
                      postNotifier.clearMedia();
                      isUrlImage = false;
                    },
                  ),
                  IconButton(
                      icon: const Icon(
                        Iconsax.gallery5,
                        color: TColors.textWhite,
                      ),
                      onPressed: () async {
                        postNotifier.clearMedia();
                        await postNotifier.pickPicture();
                        isUrlImage = false;
                      }),
                  IconButton(
                    icon: const Icon(
                      Iconsax.camera5,
                      color: TColors.textWhite,
                    ),
                    onPressed: () async {
                      postNotifier.clearMedia();
                      await postNotifier.takePicture();
                      isUrlImage = false;
                    },
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
