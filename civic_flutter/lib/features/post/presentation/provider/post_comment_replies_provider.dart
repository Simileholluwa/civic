import 'dart:developer';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'post_comment_replies_provider.g.dart';

@riverpod
class PostCommentReplies extends _$PostCommentReplies {
  @override
  PostCommentRepliesState build() {
    return PostCommentRepliesState();
  }

  Future<void> loadReplies(int postId, int commentId) async {
    final currentPage = state.pages[commentId] ?? 1;
    final canLoadMore = state.canLoadMore[commentId] ?? true;

    if (state.isLoading[commentId] == true || !canLoadMore) return;

    state = state.copyWith(
      isLoading: {...state.isLoading, commentId: true},
    );

    final commentReplies = ref.read(getPostCommentRepliesProvider);
    final response = await commentReplies(
      GetPostCommentRepliesParams(postId, currentPage, 10, commentId),
    );

    response.fold(
      (l) {
        log(l.message);
        state = state.copyWith(
          isLoading: {...state.isLoading, commentId: false},
        );
      },
      (r) {
        state = state.copyWith(
          replies: {
            ...state.replies,
            commentId: [...(state.replies[commentId] ?? []), ...r.results],
          },
          isLoading: {...state.isLoading, commentId: false},
          canLoadMore: {...state.canLoadMore, commentId: r.canLoadMore},
          pages: {...state.pages, commentId: currentPage + 1},
        );
      },
    );
  }

  void resetReplies(int commentId) {
    state = state.copyWith(
      replies: {...state.replies}..remove(commentId),
      isLoading: {...state.isLoading}..remove(commentId),
      canLoadMore: {...state.canLoadMore}..remove(commentId),
      pages: {...state.pages}..remove(commentId),
    );
  }

  void addReply(int commentId, PostComment reply) {
    state = state.copyWith(
      replies: {
        ...state.replies,
        commentId: [...(state.replies[commentId] ?? []), reply],
      },
    );
  }

  void hasReplies(int commentId, bool hasReplies) {
    state = state.copyWith(
      hasReplies: {...state.hasReplies, commentId: hasReplies},
    );
  }

}
