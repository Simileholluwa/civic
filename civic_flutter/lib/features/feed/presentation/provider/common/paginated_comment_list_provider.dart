//ignore_for_file:avoid_public_notifier_properties
import 'dart:developer';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:civic_client/civic_client.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'paginated_comment_list_provider.g.dart';

@riverpod
class PaginatedCommentList extends _$PaginatedCommentList {
  final PagingController<int, Post> pagingController =
      PagingController(firstPageKey: 1);

  @override
  PagingStatus build(int postId) {
    pagingController.addPageRequestListener((page) {
      fetchPage(postId, page);
    });

    pagingController.addStatusListener((status) {
      state = status;
    });

    ref.onDispose(() {
      pagingController.dispose();
    });
    return PagingStatus.loadingFirstPage;
  }

  Future<void> fetchPage(int postId, int page, {int limit = 50}) async {
    try {
      if (pagingController.itemList != null) {
        pagingController.value = PagingState(
          itemList: null,
        );
      }
      final listPostCommentUseCase = ref.read(getPostCommentsProvider);
      final result = await listPostCommentUseCase(
        GetPostCommentsParams(
          postId,
          page,
          limit,
        ),
      );
      result.fold((error) {
        log(error.message, name: 'PaginatedPostCommentList');
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
      log(e.toString(), name: 'PaginatedPostCommentList');
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

  void addComment(Post comment) {
    if (pagingController.itemList == null) {
      refresh();
      return;
    }
    pagingController.value = PagingState(
      nextPageKey: pagingController.nextPageKey,
      itemList: [comment, ...pagingController.itemList ?? []],
    );
  }

  void removeCommentById(int? commentId) {
    if (pagingController.itemList != null && commentId != null) {
      final updatedList = List<Post>.from(pagingController.itemList ?? []);
      updatedList.removeWhere((element) => element.id == commentId);
      pagingController.value = PagingState(
        nextPageKey: pagingController.nextPageKey,
        itemList: updatedList,
      );
    }
  }
}
