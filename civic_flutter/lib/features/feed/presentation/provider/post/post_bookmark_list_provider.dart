import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_bookmark_list_provider.g.dart';

@Riverpod(keepAlive: true)
class PaginatedPostBookmarkList extends _$PaginatedPostBookmarkList {
  @override
  Raw<PagingController<int, PostWithUserState>> build() {
    final controller = PagingController<int, PostWithUserState>(
      getNextPageKey: (state) {
        if (state.lastPageIsEmpty) return null;
        return state.nextIntPageKey;
      },
      fetchPage: _fetchPage,
    );
    ref.onDispose(controller.dispose);
    return controller;
  }

  Future<List<PostWithUserState>> _fetchPage(
    int pageKey, {
    int limit = 50,
  }) async {
    final usecase = ref.read(getUserPostBookmarksProvider);
    final result = await usecase(
      GetUserPostBookmarksParams(
        pageKey,
        limit,
      ),
    );
    return result.fold(
      (error) => throw error,
      (data) => data.results,
    );
  }

  void addPost(PostWithUserState? post) {
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
    if (pages.first.any((p) => p.post.id == post.post.id)) {
      state.value = state.value.mapItems((p) {
        if (p.post.id == post.post.id) {
          return post;
        }
        return p;
      });
      return;
    }
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

  void removeAllPosts() {
    final current = state.value;
    state.value = current.copyWith(
      pages: const [<PostWithUserState>[]],
      keys: const [1],
      hasNextPage: current.hasNextPage,
    );
  }

  void removePostById(int? postId) {
    if (postId == null) return;
    final prev = state.value;
    state.value = prev.filterItems((p) => p.post.id != postId);
  }

  Future<void> clearBookmarksList() async {
    removeAllPosts();
    final clearBookmarks = ref.read(clearPostBookmarksProvider);
    final result = await clearBookmarks(NoParams());
    result.fold(
      (error) => TToastMessages.errorToast(error.message),
      (_) {},
    );
  }
}
