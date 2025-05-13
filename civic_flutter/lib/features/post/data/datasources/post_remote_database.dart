import 'dart:async';
import 'dart:io';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';

abstract class PostRemoteDatabase {
  Future<Post?> savePost({
    required Post post,
    bool isProjectRepost = false,
    int? projectId,
  });
  Future<PostList> getPosts({
    required int page,
    required int limit,
  });
  Future<Post?> getPost({
    required int id,
  });
  Future<void> schedulePost({
    required Post post,
    required DateTime dateTime,
  });
  Future<int> toggleLike({
    required int id,
  });
  Future<List<int>> getUserLikedProjects();
  Future<void> deletePost({required int id});
  Future<void> deletePostComment({required int id});
  Future<int> toggleCommentLike({required int id});
  Future<PostComment> savePostComment({
    required int postId,
    required PostComment comment,
  });
  Future<PostCommentList> getPostComments({
    required int postId,
    required int page,
    required int limit,
  });
  Future<PostCommentList> getPostCommentReplies({
    required int commentId,
    required int postId,
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
    bool isProjectRepost = false,
    int? projectId,
  }) async {
    try {
      final isConnected = await TDeviceUtils.hasInternetConnection();
      if (!isConnected) {
        throw const ServerException(
          message: 'You are not connected to the internet.',
        );
      }

      final result = await _client.post
          .savePost(
            post,
            isProjectRepost: isProjectRepost,
            projectId: projectId,
          )
          .timeout(
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
      throw const ServerException(message: 'Failed to connect to server. Please try again.');
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
      final isConnected = await TDeviceUtils.hasInternetConnection();
      if (!isConnected) {
        throw const ServerException(
          message: 'You are not connected to the internet.',
        );
      }
      final result = _client.post.getPosts(
        limit: limit,
        page: page,
      );
      return result;
    } on SocketException catch (_) {
      throw const ServerException(message: 'Failed to connect to server. Please try again.');
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<Post?> getPost({required int id}) async {
    try {
      final isConnected = await TDeviceUtils.hasInternetConnection();
      if (!isConnected) {
        throw const ServerException(
          message: 'You are not connected to the internet.',
        );
      }
      final result = await _client.post.getPost(
        id,
      );
      return result;
    } on SocketException catch (_) {
      throw const ServerException(message: 'Failed to connect to server. Please try again.');
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<void> schedulePost({
    required Post post,
    required DateTime dateTime,
  }) async {
    try {
      final isConnected = await TDeviceUtils.hasInternetConnection();
      if (!isConnected) {
        throw const ServerException(
          message: 'You are not connected to the internet.',
        );
      }
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
  Future<int> toggleLike({
    required int id,
  }) async {
    try {
      return await _client.post.toggleLike(
        id,
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
  Future<List<int>> getUserLikedProjects() async {
    try {
      return await _client.post.getUserLikedPosts();
    } on UserException catch (e) {
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
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<void> deletePostComment({required int id}) async {
    try {
      return await _client.postComment.deletePostComment(id);
    } on UserException catch (e) {
      throw ServerException(message: e.message);
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<PostCommentList> getPostComments({
    required int postId,
    required int page,
    required int limit,
  }) async {
    try {
      return await _client.postComment.getPostComments(
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
  Future<PostComment> savePostComment({
    required int postId,
    required PostComment comment,
  }) async {
    try {
      final result = await _client.postComment.savePostComment(
        postId,
        comment,
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
      return await _client.postComment.toggleCommentLike(id);
    } on UserException catch (e) {
      throw ServerException(message: e.message);
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<PostCommentList> getPostCommentReplies({
    required int commentId,
    required int postId,
    required int page,
    required int limit,
  }) async {
    try {
      return await _client.postComment.getPostCommentReplies(
        commentId,
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
}
