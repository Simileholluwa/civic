import 'dart:developer';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_list_provider.g.dart';

@Riverpod(keepAlive: true)
class PaginatedPostList extends _$PaginatedPostList {
  final PagingController<int, Post> pagingController =
      PagingController(firstPageKey: 1);

  @override
  PagingStatus build() {
    pagingController
      ..addPageRequestListener(
        fetchPage,
      )
      ..addStatusListener((status) {
        state = status;
      });
    ref.onDispose(
      pagingController.dispose,
    );
    return pagingController.value.status;
  }

  Future<void> fetchPage(int page, {int limit = 50}) async {
    try {
      final listPostUseCase = ref.read(getPostsProvider);
      final result = await listPostUseCase(
        GetPostsParams(
          page,
          limit,
        ),
      );
      result.fold((error) {
        log(error.toString(), name: 'PaginatedPostList');
        pagingController.value = PagingState(
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
    } on Exception catch (e) {
      log(e.toString(), name: 'PaginatedPostList');
      pagingController.value = PagingState(
        error: e.toString(),
      );
    }
  }

  void refresh() {
    pagingController.refresh();
  }

  void addPost(Post post) {
    if (pagingController.itemList != null) {
      final updatedList = List<Post>.from(pagingController.itemList ?? [])
        ..insert(0, post);
      pagingController.value = PagingState(
        nextPageKey: pagingController.nextPageKey,
        itemList: updatedList,
      );
    }
  }

  void removeProjectRepostById(int? projectId) {
    if (pagingController.itemList != null && projectId != null) {
      final updatedList = List<Post>.from(pagingController.itemList ?? [])
        ..removeWhere((element) => element.projectId == projectId);
      pagingController.value = PagingState(
        nextPageKey: pagingController.nextPageKey,
        itemList: updatedList,
      );
    }
  }

  void removePostById(int? postId) {
    if (pagingController.itemList != null && postId != null) {
      final updatedList = List<Post>.from(pagingController.itemList ?? [])
        ..removeWhere((element) => element.id == postId);
      pagingController.value = PagingState(
        nextPageKey: pagingController.nextPageKey,
        itemList: updatedList,
      );
    }
  }
}
