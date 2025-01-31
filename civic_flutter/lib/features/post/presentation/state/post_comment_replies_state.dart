import 'package:civic_client/civic_client.dart';

class PostCommentRepliesState {
  final Map<int, List<PostComment>> replies;
  final Map<int, bool> isLoading;
  final Map<int, bool> canLoadMore;
  final Map<int, int> pages;
  final Map<int, bool> hasReplies;

  PostCommentRepliesState({
    this.replies = const {},
    this.isLoading = const {},
    this.canLoadMore = const {},
    this.pages = const {},
    this.hasReplies = const {},
  });

  PostCommentRepliesState copyWith({
    Map<int, List<PostComment>>? replies,
    Map<int, bool>? isLoading,
    Map<int, bool>? canLoadMore,
    Map<int, int>? pages,
    Map<int, bool>? hasReplies,
  }) {
    return PostCommentRepliesState(
      replies: replies ?? this.replies,
      isLoading: isLoading ?? this.isLoading,
      canLoadMore: canLoadMore ?? this.canLoadMore,
      pages: pages ?? this.pages,
      hasReplies: hasReplies ?? this.hasReplies,
    );
  }
}
