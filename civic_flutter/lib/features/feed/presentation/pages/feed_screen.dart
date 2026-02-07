import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class FeedScreen extends ConsumerWidget {
  const FeedScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pagingState = ref.watch(
      paginatedPostListProvider,
    );
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              floating: true,
              snap: true,
              actions: [
                IconButton(
                  onPressed: () async {
                    await context.push('/feed/bookmarks');
                  },
                  icon: const Icon(
                    Iconsax.note_1,
                    size: 26,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
              ],
              title: Text(
                'SOCIAL',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontSize: 25,
                ),
              ),
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(5),
                child: Divider(
                  height: 0,
                ),
              ),
            ),
          ];
        },
        body: AppInfiniteList<PostWithUserState>(
          pagingController: pagingState,
          itemBuilder: (context, postWithUserState, index) {
            return AdaptivePostCard(
              postWithUserState: postWithUserState,
            );
          },
          createText: 'Create post',
          onCreate: () async {
            await context.push(
              '/create/post/0',
            );
          },
          errorMessage: pagingState.error is Failure
              ? (pagingState.error! as Failure).message
              : 'Something went wrong. Please try again.',
          onRefresh: pagingState.refresh,
        ),
      ),
    );
  }
}
