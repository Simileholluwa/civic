//ignore_for_file:avoid_public_notifier_properties
//ignore_for_file:avoid_manual_providers_as_generated_provider_dependency

import 'dart:developer';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:civic_client/civic_client.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'post_bookmark_list_provider.g.dart';

@Riverpod(keepAlive: true)
class PaginatedPostBookmarkList extends _$PaginatedPostBookmarkList {
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
      final bookmarkPostUseCase = ref.read(getUserPostBookmarksProvider);
      final result = await bookmarkPostUseCase(
        GetUserPostBookmarksParams(
          page,
          limit,
        ),
      );
      result.fold((error) {
        log(error.toString(), name: 'PaginatedPostList');
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
      log(e.toString(), name: 'PaginatedPostList');
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

  void addPost(Post post) {
    if (pagingController.itemList != null) {
      final updatedList = List<Post>.from(pagingController.itemList ?? []);
      updatedList.insert(0, post);
      pagingController.value = PagingState(
        nextPageKey: pagingController.nextPageKey,
        itemList: updatedList,
      );
    }
  }

  void removeProjectRepostById(int? projectId) {
    if (pagingController.itemList != null && projectId != null) {
      final updatedList = List<Post>.from(pagingController.itemList ?? []);
      updatedList.removeWhere((element) => element.projectId == projectId);
      pagingController.value = PagingState(
        nextPageKey: pagingController.nextPageKey,
        itemList: updatedList,
      );
    }
  }

  void removeAllPosts() {
    pagingController.value = PagingState(
      nextPageKey: pagingController.nextPageKey,
      itemList: [],
    );
  }

  void removePostById(int? postId) {
    if (pagingController.itemList != null && postId != null) {
      final updatedList = List<Post>.from(pagingController.itemList ?? []);
      updatedList.removeWhere((element) => element.id == postId);
      pagingController.value = PagingState(
        nextPageKey: pagingController.nextPageKey,
        itemList: updatedList,
      );
    }
  }

    Future<void> clearBookmarksList() async {
    removeAllPosts();
    final clearBookmarks = ref.read(clearPostBookmarksProvider);
    final result = await clearBookmarks(NoParams());
    return result.fold((error) {
      TToastMessages.errorToast(
        error.message,
      );
      return;
    }, (_) async {
      return;
    });
  }
}
