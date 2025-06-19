//ignore_for_file:avoid_public_notifier_properties
import 'dart:async';
import 'dart:developer';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'paginated_article_list_provider.g.dart';

@Riverpod(keepAlive: true)
class PaginatedArticleList extends _$PaginatedArticleList {
  final PagingController<int, Post> pagingController =
      PagingController(firstPageKey: 1);

  @override
  PagingStatus build() {
    pagingController.addPageRequestListener((page) {
      fetchPage(page);
    });

    pagingController.addStatusListener((status) {
      state = status;
    });
    ref.onDispose(() {
      pagingController.dispose();
    });

    return pagingController.value.status;
  }

  Future<void> fetchPage(int page, {int limit = 50}) async {
    try {
      final listArticleUseCase = ref.read(getArticlesProvider);
      final result = await listArticleUseCase(
        GetArticlesParams(page, limit,),
      );
      result.fold((error) {
        log(error.toString(), name: 'PaginatedArticleList');
        pagingController.value = PagingState(
          nextPageKey: null,
          itemList: null,
          error: error.message,
        );
      }, (data) {
        if (data.canLoadMore) {
          pagingController.appendPage(
            data.results,
            data.page + 1,
          );
        } else {
          pagingController.appendLastPage(data.results);
        }
      });
    } catch (e) {
      log(e.toString(), name: 'PaginatedArticleList');
      pagingController.value = PagingState(
        nextPageKey: null,
        itemList: null,
        error: e.toString(),
      );
    }
  }

  void refresh() {
    pagingController.refresh();
  }

  void addArticle(Post post) {
    if (pagingController.itemList != null) {
      final updatedList = List<Post>.from(pagingController.itemList ?? []);
      updatedList.insert(0, post);
      pagingController.value = PagingState(
        nextPageKey: pagingController.nextPageKey,
        itemList: updatedList,
      );
    }
  }

  void removeArticleById(int? postId) {
    if (pagingController.itemList != null && postId != null) {
      final updatedList = List<Post>.from(pagingController.itemList ?? []);
      updatedList.removeWhere((element) => element.id == postId);
      pagingController.value = PagingState(
        nextPageKey: pagingController.nextPageKey,
        itemList: updatedList,
      );
    }
  }
}
