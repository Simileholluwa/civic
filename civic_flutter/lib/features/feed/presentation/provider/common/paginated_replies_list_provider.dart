import 'dart:developer';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'paginated_replies_list_provider.g.dart';

@riverpod
class PaginatedRepliesList extends _$PaginatedRepliesList {
  final PagingController<int, Post> pagingController =
      PagingController(firstPageKey: 1);

  @override
  PagingStatus build(int commentId) {
    pagingController
      ..addPageRequestListener((page) async {
        await fetchPage(commentId, page);
      })
      ..addStatusListener((status) {
        state = status;
      });

    ref.onDispose(pagingController.dispose);
    return PagingStatus.loadingFirstPage;
  }

  Future<void> fetchPage(int commentId, int page, {int limit = 50}) async {
    try {
      final commentReplies = ref.read(getPostCommentRepliesProvider);
      final result = await commentReplies(
        GetPostCommentRepliesParams(
          commentId,
          page,
          limit,
        ),
      );
      result.fold((error) {
        log(error.message, name: 'PaginatedPostCommentRepliesList');
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
      log(e.toString(), name: 'PaginatedPostCommentRepliesList');
      pagingController.value = PagingState(
        error: e.toString(),
      );
    }
  }

  void refresh() {
    pagingController.refresh();
  }

  void addReply(Post reply) {
    if (pagingController.itemList == null) {
      refresh();
      return;
    }
    pagingController.value = PagingState(
      nextPageKey: pagingController.nextPageKey,
      itemList: [reply, ...pagingController.itemList ?? []],
    );
  }

  void removeReplyById(int? replyId) {
    if (pagingController.itemList != null && replyId != null) {
      final updatedList = List<Post>.from(pagingController.itemList ?? [])
        ..removeWhere((element) => element.id == replyId);
      pagingController.value = PagingState(
        nextPageKey: pagingController.nextPageKey,
        itemList: updatedList,
      );
    }
  }
}
