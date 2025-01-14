import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/article/article.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ArticlesScreen extends ConsumerWidget {
  const ArticlesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pagingControllerNotifier =
        ref.watch(paginatedArticleListProvider.notifier);

    return AppInfiniteList<Article>(
      pagingController: pagingControllerNotifier.pagingController,
      scrollController: ref.read(articleScrollControllerProvider),
      itemBuilder: (context, article, index) {
        final articleCardState = ref.watch(articleCardWidgetProvider(article));
        return Column(
          spacing: 10,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 12, 15, 0),
              child: ContentCreatorInfo(
                creator: articleCardState.author,
                timeAgo: articleCardState.timeAgo,
                numberOfViews: '',
              ),
            ),
            Container(
              width: double.maxFinite,
              margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  TSizes.md,
                ),
                color: Theme.of(context).cardColor,
                border: Border.all(
                  color: Theme.of(context).dividerColor,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(TSizes.md),
                      topRight: Radius.circular(TSizes.md),
                    ),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: ContentCachedImage(
                        url: articleCardState.bannerUrl,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 5,
                      children: [
                        Text(
                          articleCardState.title,
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                        ),
                        Text(
                          articleCardState.description,
                          style: Theme.of(context).textTheme.labelMedium,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ContentInteractionButton(
                    icon: Iconsax.heart,
                    title: '1.2k',
                    onTap: () {},
                    color: Theme.of(context).textTheme.labelMedium!.color!,
                  ),
                  ContentInteractionButton(
                    icon: Iconsax.messages_1,
                    title: '1.2k',
                    onTap: () {},
                    color: Theme.of(context).textTheme.labelMedium!.color!,
                  ),
                  ContentInteractionButton(
                    icon: Iconsax.repeate_music5,
                    title: '1.2k',
                    onTap: () {},
                    color: Theme.of(context).textTheme.labelMedium!.color!,
                  ),
                  ContentInteractionButton(
                    icon: Icons.share,
                    title: '',
                    showTitle: false,
                    onTap: () {},
                    color: Theme.of(context).textTheme.labelMedium!.color!,
                  ),
                  ContentInteractionButton(
                    icon: Iconsax.bookmark,
                    title: '',
                    showTitle: false,
                    onTap: () {},
                    color: Theme.of(context).textTheme.labelMedium!.color!,
                  ),
                  ContentInteractionButton(
                    icon: Iconsax.more_2,
                    title: '',
                    showTitle: false,
                    onTap: () {},
                    color: Theme.of(context).textTheme.labelMedium!.color!,
                  ),
                ],
              ),
            ),
            if (index !=
                pagingControllerNotifier.pagingController.itemList!.length - 1)
              const Divider(
                height: 0,
              ),
          ],
        );
      },
      onRefresh: pagingControllerNotifier.refresh,
    );
  }
}
