import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class PostBookmarksScreen extends ConsumerWidget {
  const PostBookmarksScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pagingState = ref.watch(
      paginatedPostBookmarkListProvider,
    );
    final pagingNotifier = ref.watch(
      paginatedPostBookmarkListProvider.notifier,
    );
    return AppAndroidBottomNav(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                toolbarHeight: 60,
                floating: true,
                centerTitle: true,
                snap: true,
                leading: IconButton(
                  icon: const Icon(
                    Iconsax.arrow_left_2,
                  ),
                  onPressed: () {
                    context.pop();
                  },
                ),
                bottom: const PreferredSize(
                  preferredSize: Size.fromHeight(1),
                  child: Divider(
                    height: 0,
                  ),
                ),
                actions: [
                  ValueListenableBuilder(
                    valueListenable: pagingState,
                    builder: (context, value, child) {
                      final isEmpty = value.pages?.first.isEmpty ?? true;
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: isEmpty
                                ? null
                                : () async {
                                    final res = await FeedHelperFunctions
                                        .clearBookmarksDialog(
                                      context,
                                    );
                                    if (res ?? false) {
                                      await pagingNotifier.clearBookmarksList();
                                    }
                                  },
                            icon: const Icon(
                              Iconsax.trash,
                              size: 26,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                ],
                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'BOOKMARKS',
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                fontSize: 25,
                              ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 22, left: 1),
                      child: AppDecorationDot(),
                    ),
                  ],
                ),
              ),
            ];
          },
          body: AppInfiniteList<Post>(
            pagingController: pagingState,
            scrollPhysics: const NeverScrollableScrollPhysics(),
            canCreate: false,
            itemBuilder: (__, post, _) {
              if (post.postType == PostType.article) {
                return ArticleCard(
                  post: post,
                  onTap: () async {
                    await context.push(
                      '/feed/article/${post.id}',
                      extra: post,
                    );
                  },
                );
              }
              if (post.postType == PostType.poll) {
                return PollCard(
                  post: post,
                  onTap: () async {
                    await context.push(
                      '/feed/poll/${post.id}',
                      extra: post,
                    );
                  },
                );
              }
              return PostCard(
                post: post,
                onTap: () async {
                  await context.push(
                    '/feed/post/${post.id}',
                    extra: post,
                  );
                },
              );
            },
            onRefresh: pagingState.refresh,
          ),
        ),
      ),
    );
  }
}
