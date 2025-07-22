import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ArticlesScreen extends ConsumerWidget {
  const ArticlesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pagingControllerNotifier =
        ref.watch(paginatedArticleListProvider.notifier);

    return AppInfiniteList<Post>(
      pagingController: pagingControllerNotifier.pagingController,
      scrollPhysics: const NeverScrollableScrollPhysics(),
      createText: 'Create article',
      onCreate: () {
        context.push(
          '/create/article/0',
        );
      },
      itemBuilder: (context, post, index) {
        return ArticleCard(post: post);
      },
      onRefresh: pagingControllerNotifier.refresh,
    );
  }
}
