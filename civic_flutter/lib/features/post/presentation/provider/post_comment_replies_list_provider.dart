//ignore_for_file:avoid_public_notifier_properties
import 'dart:developer';
import 'package:civic_flutter/features/post/post.dart';
import 'package:civic_client/civic_client.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_comment_replies_list_provider.g.dart';

@riverpod
class PaginatedPostCommentRepliesList extends _$PaginatedPostCommentRepliesList {
  final PagingController<int, Post> pagingController =
      PagingController(firstPageKey: 1);

  @override
  PagingStatus build(int commentId) {
    pagingController.addPageRequestListener((page) {
      fetchPage(commentId, page);
    });

    pagingController.addStatusListener((status) {
      state = status;
    });
    return PagingStatus.loadingFirstPage;
  }

  Future<void> fetchPage(int commentId, int page, {int limit = 50}) async {
    final commentReplies = ref.read(getPostCommentRepliesProvider);
    final result = await commentReplies(
      GetPostCommentRepliesParams(commentId, page, limit,),
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

  void addComment(Post comment) {
    if (pagingController.itemList == null) {
      refresh();
    }
    pagingController.value = PagingState(
      nextPageKey: pagingController.nextPageKey,
      itemList: [comment, ...pagingController.itemList ?? []],
    );
  }
}
