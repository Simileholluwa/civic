//ignore_for_file:avoid_public_notifier_properties
import 'dart:async';
import 'dart:developer';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/article/article.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'article_paginated_list_provider.g.dart';

@Riverpod(keepAlive: true)
class PaginatedArticleList extends _$PaginatedArticleList {
  final PagingController<int, Article> pagingController =
      PagingController(firstPageKey: 1);

  @override
  PagingStatus build() {
    pagingController.addPageRequestListener((page) {
      fetchPage(page);
    });

    pagingController.addStatusListener((status) {
      state = status;
    });
    return PagingStatus.loadingFirstPage;
  }

  Future<void> fetchPage(int page, {int limit = 10}) async {
    final listArticleUseCase = ref.read(getArticlesProvider);
    final result = await listArticleUseCase(
      GetArticlesParams(
        page,
        limit,
      ),
    );
    result.fold((error) => log(error.message), (data) {
      if (data.canLoadMore) {
        pagingController.appendPage(
          data.results,
          data.page + 1,
        );
      } else {
        pagingController.appendLastPage(data.results);
      }
    });
  }

  void refresh() {
    pagingController.refresh();
  }
}