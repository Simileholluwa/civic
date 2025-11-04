import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'paginated_comment_list_provider.g.dart';

@riverpod
class PaginatedCommentList extends _$PaginatedCommentList {
  final PagingController<int, Post> pagingController =
      PagingController(firstPageKey: 1);

  @override
  PagingStatus build(int postId) {
    pagingController
      ..addPageRequestListener((page) async {
        await fetchPage(postId, page);
      })
      ..addStatusListener((status) {
        state = status;
      });

    ref.onDispose(pagingController.dispose);
    return PagingStatus.loadingFirstPage;
  }

  Future<void> fetchPage(int postId, int page, {int limit = 50}) async {
    try {
      if (pagingController.itemList != null) {
        pagingController.value = const PagingState();
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
      pagingController.value = PagingState(
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
      final updatedList = List<Post>.from(pagingController.itemList ?? [])
        ..removeWhere((element) => element.id == commentId);
      pagingController.value = PagingState(
        nextPageKey: pagingController.nextPageKey,
        itemList: updatedList,
      );
    }
  }
}
