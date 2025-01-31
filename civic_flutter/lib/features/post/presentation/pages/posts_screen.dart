import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PostsScreen extends ConsumerWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pagingControllerNotifier =
        ref.watch(paginatedPostListProvider.notifier);
    return AppInfiniteList<Post>(
      pagingController: pagingControllerNotifier.pagingController,
      scrollController: ref.read(postScrollControllerProvider),
      itemBuilder: (context, post, index) {
        final isVisibleNotifier = ref.watch(
          appScrollVisibilityProvider.notifier,
        );
        return PostCard(
          onTap: () {
            context.pushNamed(
              PostDetailScreen.routeName(),
              pathParameters: {
                'id': post.id.toString(),
              },
            );
            isVisibleNotifier.hide();
          },
          post: post,
        );
      },
      onRefresh: pagingControllerNotifier.refresh,
    );
  }
}
