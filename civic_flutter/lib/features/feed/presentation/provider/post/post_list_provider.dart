import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_list_provider.g.dart';

@Riverpod(keepAlive: true)
class PaginatedPostList extends _$PaginatedPostList {
  @override
  PagingController<int, Post> build() {
    final controller = PagingController<int, Post>(
      getNextPageKey: (state) {
        if (state.lastPageIsEmpty) return null;
        return state.nextIntPageKey;
      },
      fetchPage: _fetchPage,
    );
    ref.onDispose(controller.dispose);
    return controller;
  }

  Future<List<Post>> _fetchPage(int pageKey, {int limit = 50}) async {
    final usecase = ref.read(getPostsProvider);
    final result = await usecase(
      GetPostsParams(
        pageKey,
        limit,
      ),
    );
    return result.fold(
      (error) => throw error,
      (data) => data.results.map((e) => e.post).toList(),
    );
  }

  void refresh() {
    state.refresh();
  }

  void addPost(Post? post) {
    if (post == null) return;
    final current = state.value;
    final pages = current.pages;
    if (pages == null || pages.isEmpty) {
      state.value = current.copyWith(
        pages: [
          [post],
        ],
        keys: const [1],
        hasNextPage: current.hasNextPage,
      );
      return;
    }
    // Prevent duplicate in first page.
    if (pages.first.any((p) => p.id == post.id)) return;
    final updatedFirst = [post, ...pages.first];
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

  void removeProjectRepostById(int? projectId) {
    if (projectId == null) return;
    final prev = state.value;
    state.value = prev.filterItems((p) => p.projectId != projectId);
  }

  void removePostById(int? postId) {
    if (postId == null) return;
    final prev = state.value;
    state.value = prev.filterItems((p) => p.id != postId);
  }
}
