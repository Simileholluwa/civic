import 'dart:async';
import 'dart:io';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';

abstract class FeedRemoteDatabase {
  Future<Post?> savePost({
    required Post post,
  });
  Future<PostList> getPosts({
    required int page,
    required int limit,
  });
  Future<Post> getPost({
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
  });
  Future<Post> savePostComment({
    required Post comment,
    required bool isReply,
  });
  Future<Post> getComment({
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
  Future<Post> saveArticle({
    required Post post,
  });
  Future<void> castVote({
    required int postId,
    required int optionId,
  });
  Future<PostList> getPolls({
    required int page,
    required int limit,
  });
  Future<PostList> getArticles({
    required int page,
    required int limit,
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
      final result = await _client.post.savePost(post).timeout(
            const Duration(
              seconds: 60,
            ),
          );

      if (result == null) {
        return null;
      }
      return result;
    } on UserException catch (e) {
      throw ServerException(message: e.message);
    } on PostException catch (e) {
      throw ServerException(message: e.message);
    } on SocketException catch (_) {
      throw const ServerException(
          message: 'Failed to connect to server. Please try again.');
    } on ServerException {
      rethrow;
    } catch (e) {
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
      final result = _client.post.getPosts(
        limit: limit,
        page: page,
      );
      return result;
    } on SocketException catch (_) {
      throw const ServerException(
          message: 'Failed to connect to server. Please try again.');
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<Post> getPost({
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
    } on PostException catch (e) {
      throw ServerException(
        message: e.message,
        action: null,
      );
    } catch (e) {
      throw ServerException(
        message: e.toString(),
        action: 'retry',
      );
    }
  }

  @override
  Future<Post> getComment(
      {required int commentId, required bool isComment}) async {
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
    } on PostException catch (e) {
      throw ServerException(
        message: e.message,
      );
    } catch (e) {
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
    } catch (e) {
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
    } on UserException catch (e) {
      throw ServerException(message: e.message);
    } on PostException catch (e) {
      throw ServerException(message: e.message);
    } catch (e) {
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
    } on UserException catch (e) {
      throw ServerException(message: e.message);
    } on ServerException {
      rethrow;
    } on PostException catch (e) {
      throw ServerException(
        message: e.message,
        action: e.action,
      );
    } catch (e) {
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
    } on UserException catch (e) {
      throw ServerException(message: e.message);
    } on PostException catch (e) {
      throw ServerException(message: e.message);
    } catch (e) {
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
    } on UserException catch (e) {
      throw ServerException(message: e.message);
    } on PostException catch (e) {
      throw ServerException(message: e.message);
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<void> deletePost({
    required int postId,
  }) async {
    try {
      return await _client.post.deletePost(postId);
    } on UserException catch (e) {
      throw ServerException(message: e.message);
    } on PostException catch (e) {
      throw ServerException(message: e.message);
    } catch (e) {
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
    } on UserException catch (e) {
      throw ServerException(message: e.message);
    } catch (e) {
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
        throw ServerException(message: 'Failed to save comment');
      }
      return result;
    } on UserException catch (e) {
      throw ServerException(message: e.message);
    } on ServerException catch (_) {
      rethrow;
    } catch (e) {
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
    } on UserException catch (e) {
      throw ServerException(message: e.message);
    } catch (e) {
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
    } on PostException catch (e) {
      throw ServerException(message: e.message);
    } on SocketException catch (_) {
      throw const ServerException(
          message: 'Failed to connect to server. Please try again.');
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<PostList> getPolls({
    required int page,
    required int limit,
  }) async {
    try {
      final result = _client.post.getPolls(
        limit: limit,
        page: page,
      );
      return result;
    } on PostException catch (e) {
      throw ServerException(message: e.message);
    } on SocketException catch (_) {
      throw const ServerException(
          message: 'Failed to connect to server. Please try again.');
    } on ServerException {
      rethrow;
    } catch (e) {
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
          message: 'Failed to save poll',
        );
      }
      return result;
    } on PostException catch (e) {
      throw ServerException(message: e.message);
    } on SocketException catch (_) {
      throw const ServerException(
          message: 'Failed to connect to server. Please try again.');
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<PostList> getArticles({
    required int page,
    required int limit,
  }) async {
    try {
      final result = await _client.post.getArticles(
        page: page,
        limit: limit,
      );
      return result;
    } on PostException catch (e) {
      throw ServerException(message: e.message);
    } on SocketException catch (_) {
      throw const ServerException(
          message: 'Failed to connect to server. Please try again.');
    } on ServerException {
      rethrow;
    } catch (e) {
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
      if (result == null) {
        throw const ServerException(
          message: 'Failed to save article',
        );
      }
      return result;
    } on PostException catch (e) {
      throw ServerException(message: e.message);
    } on SocketException catch (_) {
      throw const ServerException(
          message: 'Failed to connect to server. Please try again.');
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }
}
