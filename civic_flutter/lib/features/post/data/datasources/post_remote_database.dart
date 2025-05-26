import 'dart:async';
import 'dart:io';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';

abstract class PostRemoteDatabase {
  Future<Post?> savePost({
    required Post post,
  });
  Future<PostList> getPosts({
    required int page,
    required int limit,
  });
  Future<Post> getPost({
    required int id,
  });
  Future<Post> repostOrQuote({
    required int? projectId,
    required Post? quoteContent,
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
  });
  Future<void> deletePost({required int id});
  Future<void> deletePostComment({required int id});
  Future<int> toggleCommentLike({required int id});
  Future<Post> savePostComment({
    required Post comment,
    required bool isReply,
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
}

class PostRemoteDatabaseImpl implements PostRemoteDatabase {
  PostRemoteDatabaseImpl({
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
  Future<Post> getPost({required int id}) async {
    try {
      final result = await _client.post.getPost(
        id,
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
  Future<Post> repostOrQuote({
    required int? projectId,
    required Post? quoteContent,
  }) async {
    try {
      return await _client.post.repostOrQuote(
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
  }) async {
    try {
      return await _client.post.markNotInterested(
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
  Future<void> deletePost({required int id}) async {
    try {
      return await _client.post.deletePost(id);
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
  Future<void> deletePostComment({required int id}) async {
    try {
      //return await _client.post.deletePostComment(id);
    } on UserException catch (e) {
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
  Future<int> toggleCommentLike({required int id}) async {
    try {
      return 1;
      // return await _client.post.toggleCommentLike(id);
    } on UserException catch (e) {
      throw ServerException(message: e.message);
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
}
