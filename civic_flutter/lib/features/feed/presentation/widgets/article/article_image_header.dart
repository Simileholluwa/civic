import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/create/create.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArticleImageHeader extends StatelessWidget {
  const ArticleImageHeader({
    required this.post,
    required this.showPadding,
    super.key,
  });

  final Post post;
  final bool showPadding;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Padding(
        padding: showPadding
            ? const EdgeInsets.fromLTRB(15, 0, 15, 0)
            : EdgeInsets.zero,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: AspectRatio(
            aspectRatio: 16 / 9,
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
                          imageUrls: [
                            post.mediaAssets!.first.publicUrl!,
                          ],
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
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          border: Border.all(
                            color: Theme.of(context).dividerColor,
                      
                          ),
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                        ),
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: ContentCachedImage(
                            url: post.mediaAssets!.first.publicUrl!,
                            height: post.mediaAssets!.first.height!.toDouble(),
                          ),
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
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                            color: Theme.of(context).primaryColor,
                          ),
                          child: const Text(
                            'Article',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 18,
                        right: 18,
                        bottom: 18,
                        child: Text(
                          post.text!,
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
        ),
      ),
    );
  }
}
