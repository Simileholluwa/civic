import 'dart:async';
import 'dart:io';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';

abstract class FeedRemoteDatabase {
  Future<Post?> savePost({
    required Post post,
  });
  Future<Post> repostPost({
    required int postId,
  });
  Future<void> clearVote({
    required int pollId,
  });
  Future<Post> quotePost({
    required int postId,
    required Post quoteContent,
  });
  Future<PostList> getPosts({
    required int page,
    required int limit,
  });
  Future<PostList> getUserPostBookmarks({
    required int page,
    required int limit,
  });
  Future<PostWithUserState> getPost({
    required int postId,
  });
  Future<void> subscribeToNotifications({
    required int postId,
  });
  Future<Post> quoteProject({
    required int projectId,
    required Post quoteContent,
  });
  Future<void> schedulePost({
    required Post post,
    required DateTime dateTime,
  });
  Future<void> toggleLike({
    required int id,
  });
  Future<void> toggleBookmark({
    required int id,
  });
  Future<void> markNotInterested({
    required int id,
    required String reason,
  });
  Future<void> deletePost({
    required int postId,
    required bool fullDelete,
  });
  Future<Post> savePostComment({
    required Post comment,
    required bool isReply,
  });
  Future<PostWithUserState> getComment({
    required int commentId,
    required bool isComment,
  });
  Future<PostList> getPostComments({
    required int postId,
    required int page,
    required int limit,
  });
  Future<PostList> getPostCommentReplies({
    required int commentId,
    required int page,
    required int limit,
  });
  Future<Post> savePoll({
    required Post post,
  });
  Future<void> clearPostBookmarks();
  Future<Post> saveArticle({
    required Post post,
  });
  Future<void> castVote({
    required int postId,
    required int optionId,
  });
  Future<void> logPostImpressions({
    required List<int> postIds,
    String? source,
  });
}

class FeedRemoteDatabaseImpl implements FeedRemoteDatabase {
  FeedRemoteDatabaseImpl({
    required Client client,
  }) : _client = client;

  final Client _client;
  @override
  Future<Post?> savePost({
    required Post post,
  }) async {
    try {
      final result = await _client.post.savePost(post);
      if (result == null) {
        throw const ServerException(
          message: TTexts.failedToSavePost,
        );
      }
      return result;
    } on ServerSideException catch (e) {
      throw ServerException(message: e.message);
    } on SocketException catch (_) {
      throw const ServerException(
        message: TTexts.failedToConnectToServer,
      );
    } on ServerException {
      rethrow;
    } on Exception catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<void> clearVote({
    required int pollId,
  }) async {
    try {
      return await _client.post.clearVote(
        pollId,
      );
    } on ServerSideException catch (e) {
      throw ServerException(message: e.message);
    } on Exception catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<Post> repostPost({
    required int postId,
  }) async {
    try {
      final result = await _client.post.repostPost(postId);
      if (result == null) {
        throw const ServerException(
          message: TTexts.somethingWentWrong,
        );
      }
      return result;
    } on ServerSideException catch (e) {
      throw ServerException(message: e.message);
    } on SocketException catch (_) {
      throw const ServerException(
        message: TTexts.failedToConnectToServer,
      );
    } on ServerException {
      rethrow;
    } on Exception catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<Post> quotePost({
    required int postId,
    required Post quoteContent,
  }) async {
    try {
      final result = await _client.post.quotePost(
        postId,
        quoteContent,
      );
      if (result == null) {
        throw const ServerException(
          message: TTexts.failedToSavePost,
        );
      }
      return result;
    } on ServerSideException catch (e) {
      throw ServerException(message: e.message);
    } on SocketException catch (_) {
      throw const ServerException(
        message: TTexts.failedToConnectToServer,
      );
    } on ServerException {
      rethrow;
    } on Exception catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<PostList> getPosts({
    required int page,
    required int limit,
  }) async {
    try {
      final result = await _client.post.getPosts(
        limit: limit,
        page: page,
      );
      return result;
    } on ServerSideException catch (e) {
      throw ServerException(message: e.message);
    } on SocketException catch (_) {
      throw const ServerException(
        message: 'Failed to connect to server. Please try again.',
      );
    } on Exception catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<PostList> getUserPostBookmarks({
    required int page,
    required int limit,
  }) async {
    try {
      final result = await _client.post.getUserPostBookmarks(
        limit: limit,
        page: page,
      );
      return result;
    } on ServerSideException catch (e) {
      throw ServerException(message: e.message);
    } on SocketException catch (_) {
      throw const ServerException(
        message: 'Failed to connect to server. Please try again.',
      );
    } on Exception catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<PostWithUserState> getPost({
    required int postId,
  }) async {
    try {
      final result = await _client.post.getPost(
        postId,
      );
      return result;
    } on SocketException catch (_) {
      throw const ServerException(
        message: 'Failed to connect to server. Please try again.',
        action: 'retry',
      );
    } on ServerSideException catch (e) {
      throw ServerException(
        message: e.message,
      );
    } on Exception catch (e) {
      throw ServerException(
        message: e.toString(),
        action: 'retry',
      );
    }
  }

  @override
  Future<void> clearPostBookmarks() async {
    try {
      final result = await _client.post.clearBookmarks();
      return result;
    } on SocketException catch (_) {
      throw const ServerException(
        message: 'Failed to connect to server. Please try again.',
        action: 'retry',
      );
    } on ServerSideException catch (e) {
      throw ServerException(
        message: e.message,
      );
    } on Exception catch (e) {
      throw ServerException(
        message: e.toString(),
        action: 'retry',
      );
    }
  }

  @override
  Future<void> subscribeToNotifications({
    required int postId,
  }) async {
    try {
      await _client.post.subscribeToPost(
        postId,
      );
    } on SocketException catch (_) {
      throw const ServerException(
        message: 'Failed to connect to server. Please try again.',
        action: 'retry',
      );
    } on ServerSideException catch (e) {
      throw ServerException(
        message: e.message,
      );
    } on Exception catch (e) {
      throw ServerException(
        message: e.toString(),
        action: 'retry',
      );
    }
  }

  @override
  Future<PostWithUserState> getComment({
    required int commentId,
    required bool isComment,
  }) async {
    try {
      final result = await _client.post.getComment(
        commentId,
        isComment,
      );
      return result;
    } on SocketException catch (_) {
      throw const ServerException(
        message: 'Failed to connect to server. Please try again.',
        action: 'retry',
      );
    } on ServerSideException catch (e) {
      throw ServerException(
        message: e.message,
      );
    } on Exception catch (e) {
      throw ServerException(
        message: e.toString(),
        action: 'retry',
      );
    }
  }

  @override
  Future<void> schedulePost({
    required Post post,
    required DateTime dateTime,
  }) async {
    try {
      await _client.post.schedulePost(
        post,
        dateTime,
      );
    } on Exception catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<void> toggleLike({
    required int id,
  }) async {
    try {
      return await _client.post.toggleLike(
        id,
      );
    } on ServerSideException catch (e) {
      throw ServerException(message: e.message);
    } on Exception catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<Post> quoteProject({
    required int projectId,
    required Post quoteContent,
  }) async {
    try {
      return await _client.post.quoteProject(
        projectId,
        quoteContent,
      );
    } on ServerException {
      rethrow;
    } on ServerSideException catch (e) {
      throw ServerException(
        message: e.message,
        action: e.action,
      );
    } on Exception catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<void> toggleBookmark({
    required int id,
  }) async {
    try {
      return await _client.post.toggleBookmark(
        id,
      );
    } on ServerSideException catch (e) {
      throw ServerException(message: e.message);
    } on Exception catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<void> markNotInterested({
    required int id,
    required String reason,
  }) async {
    try {
      return await _client.post.markNotInterested(
        id,
        reason,
      );
    } on ServerSideException catch (e) {
      throw ServerException(message: e.message);
    } on Exception catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<void> deletePost({
    required int postId,
    required bool fullDelete,
  }) async {
    try {
      return await _client.post.deletePost(
        postId,
        fullDelete: fullDelete,
      );
    } on ServerSideException catch (e) {
      throw ServerException(message: e.message);
    } on Exception catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<PostList> getPostComments({
    required int postId,
    required int page,
    required int limit,
  }) async {
    try {
      return await _client.post.getPostComments(
        postId,
        page: page,
        limit: limit,
      );
    } on ServerSideException catch (e) {
      throw ServerException(message: e.message);
    } on Exception catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<Post> savePostComment({
    required Post comment,
    required bool isReply,
  }) async {
    try {
      final result = await _client.post.savePostComment(
        comment,
        isReply,
      );
      if (result == null) {
        throw const ServerException(message: TTexts.failedToSaveComment);
      }
      return result;
    } on ServerSideException catch (e) {
      throw ServerException(message: e.message);
    } on ServerException catch (_) {
      rethrow;
    } on Exception catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<PostList> getPostCommentReplies({
    required int commentId,
    required int page,
    required int limit,
  }) async {
    try {
      return await _client.post.getPostCommentReplies(
        commentId,
        page: page,
        limit: limit,
      );
    } on ServerSideException catch (e) {
      throw ServerException(message: e.message);
    } on Exception catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<void> castVote({
    required int postId,
    required int optionId,
  }) async {
    try {
      final result = await _client.post.castVote(
        postId,
        optionId,
      );
      return result;
    } on ServerSideException catch (e) {
      throw ServerException(message: e.message);
    } on SocketException catch (_) {
      throw const ServerException(
        message: 'Failed to connect to server. Please try again.',
      );
    } on ServerException {
      rethrow;
    } on Exception catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<Post> savePoll({
    required Post post,
  }) async {
    try {
      final result = await _client.post.savePoll(
        post,
      );
      if (result == null) {
        throw const ServerException(
          message: TTexts.failedToSavePoll,
        );
      }
      return result;
    } on ServerSideException catch (e) {
      throw ServerException(message: e.message);
    } on SocketException catch (_) {
      throw const ServerException(
        message: 'Failed to connect to server. Please try again.',
      );
    } on ServerException {
      rethrow;
    } on Exception catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<Post> saveArticle({
    required Post post,
  }) async {
    try {
      final result = await _client.post.saveArticle(
        post,
      );
      return result;
    } on ServerSideException catch (e) {
      throw ServerException(message: e.message);
    } on SocketException catch (_) {
      throw const ServerException(
        message: 'Failed to connect to server. Please try again.',
      );
    } on Exception catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<void> logPostImpressions({
    required List<int> postIds,
    String? source,
  }) async {
    try {
      await _client.post.logPostImpressions(
        postIds,
        null,
        source,
      );
    } on ServerSideException catch (e) {
      throw ServerException(message: e.message);
    } on Exception catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
