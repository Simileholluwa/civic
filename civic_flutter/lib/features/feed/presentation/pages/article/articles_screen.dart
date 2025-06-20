import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class ArticlesScreen extends ConsumerWidget {
  const ArticlesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pagingControllerNotifier =
        ref.watch(paginatedArticleListProvider.notifier);

    return AppInfiniteList<Post>(
      pagingController: pagingControllerNotifier.pagingController,
      scrollController: ref.read(articleScrollControllerProvider),
      itemBuilder: (context, post, index) {
        return ArticleCard(post: post);
      },
      onRefresh: pagingControllerNotifier.refresh,
    );
  }
}
