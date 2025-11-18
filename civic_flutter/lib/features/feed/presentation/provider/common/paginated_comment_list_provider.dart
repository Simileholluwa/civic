import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'paginated_comment_list_provider.g.dart';

@riverpod
class PaginatedCommentList extends _$PaginatedCommentList {
  @override
  PagingController<int, Post> build(int postId) {
    final controller = PagingController<int, Post>(
      getNextPageKey: (state) {
        if (state.lastPageIsEmpty) return null; // Stop if last page empty.
        return state.nextIntPageKey;
      },
      fetchPage: (pageKey) => _fetchPage(postId, pageKey),
    );
    ref.onDispose(controller.dispose);
    return controller;
  }

  Future<List<Post>> _fetchPage(
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
      (data) => data.results.map((e) => e.post).toList(),
    );
  }

  void addComment(Post? comment) {
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
    // Prevent duplicates in first page.
    if (pages.first.any((c) => c.id == comment.id)) return;
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
    state.value = prev.filterItems((c) => c.id != commentId);
  }
}
