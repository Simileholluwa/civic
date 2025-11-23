import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'paginated_replies_list_provider.g.dart';

@riverpod
class PaginatedRepliesList extends _$PaginatedRepliesList {
  @override
  PagingController<int, PostWithUserState> build(int commentId) {
    final controller = PagingController<int, PostWithUserState>(
      getNextPageKey: (state) {
        if (state.lastPageIsEmpty) return null;
        return state.nextIntPageKey;
      },
      fetchPage: (pageKey) => _fetchPage(commentId, pageKey),
    );
    ref.onDispose(controller.dispose);
    return controller;
  }

  Future<List<PostWithUserState>> _fetchPage(
    int commentId,
    int pageKey, {
    int limit = 50,
  }) async {
    final usecase = ref.read(getPostCommentRepliesProvider);
    final result = await usecase(
      GetPostCommentRepliesParams(
        commentId,
        pageKey,
        limit,
      ),
    );
    return result.fold(
      (error) => throw error,
      (data) => data.results,
    );
  }

  void addReply(PostWithUserState? reply) {
    if (reply == null) return;
    final current = state.value;
    final pages = current.pages;
    if (pages == null || pages.isEmpty) {
      state.value = current.copyWith(
        pages: [
          [reply],
        ],
        keys: const [1],
        hasNextPage: current.hasNextPage,
      );
      return;
    }
    if (pages.first.any((r) => r.post.id == reply.post.id)) {
      state.value = state.value.mapItems((r) {
        if (r.post.id == reply.post.id) {
          return reply;
        }
        return r;
      });
    }
    final updatedFirst = [reply, ...pages.first];
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

  void removeReplyById(int? replyId) {
    if (replyId == null) return;
    final prev = state.value;
    state.value = prev.filterItems((r) => r.post.id != replyId);
  }
}
