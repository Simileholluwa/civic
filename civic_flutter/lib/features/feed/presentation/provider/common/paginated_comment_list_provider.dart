import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'paginated_comment_list_provider.g.dart';

@riverpod
class PaginatedCommentList extends _$PaginatedCommentList {
  @override
  Raw<PagingController<int, PostWithUserState>> build(int postId) {
    final controller = PagingController<int, PostWithUserState>(
      getNextPageKey: (state) {
        if (state.lastPageIsEmpty) return null;
        return state.nextIntPageKey;
      },
      fetchPage: (pageKey) => _fetchPage(postId, pageKey),
    );
    ref.onDispose(controller.dispose);
    return controller;
  }

  Future<List<PostWithUserState>> _fetchPage(
    int postId,
    int pageKey, {
    int limit = 50,
  }) async {
    final usecase = ref.read(getPostCommentsProvider);
    final result = await usecase(
      GetPostCommentsParams(
        postId,
        pageKey,
        limit,
      ),
    );
    return result.fold(
      (error) => throw error,
      (data) => data.results,
    );
  }

  void addComment(PostWithUserState? comment) {
    if (comment == null) return;
    final current = state.value;
    final pages = current.pages;
    if (pages == null || pages.isEmpty) {
      state.value = current.copyWith(
        pages: [
          [comment],
        ],
        keys: const [1],
        hasNextPage: current.hasNextPage,
      );
      return;
    }
    if (pages.first.any((c) => c.post.id == comment.post.id)) {
      state.value = state.value.mapItems((c) {
        if (c.post.id == comment.post.id) {
          return comment;
        }
        return c;
      });
    }
    final updatedFirst = [comment, ...pages.first];
    final updatedPages = [updatedFirst, ...pages.skip(1)];
    final updatedKeys = [...?current.keys];
    if (updatedKeys.length < updatedPages.length) {
      updatedKeys.insert(0, 0);
    }
    state.value = current.copyWith(
      pages: updatedPages,
      keys: updatedKeys,
      hasNextPage: current.hasNextPage,
    );
  }

  void removeCommentById(int? commentId) {
    if (commentId == null) return;
    final prev = state.value;
    final next = prev.filterItems((c) => c.post.id != commentId);
    state.value = next;
  }
}
