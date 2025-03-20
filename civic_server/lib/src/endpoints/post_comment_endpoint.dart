import 'package:serverpod/serverpod.dart';
import 'package:civic_server/src/generated/protocol.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

class PostCommentEndpoint extends Endpoint {
  // Add a new comment
  Future<PostComment?> savePostComment(
    Session session,
    int postId,
    PostComment postComment,
  ) async {
    try {
      final user = await _authUser(session);

      if (postComment.id != null) {
        await validatePostCommentOwnership(
          session,
          postComment.id!,
          user,
        );
        return await PostComment.db.updateRow(
          session,
          postComment.copyWith(
            dateUpdated: DateTime.now(),
          ),
        );
      } else {
        PostComment? parentComment;
        if (postComment.parentId != null) {
          parentComment = await PostComment.db.findById(
            session,
            postComment.parentId!,
          );
          await PostComment.db.updateRow(
              session,
              parentComment!.copyWith(
                replyBy: {
                  ...parentComment.replyBy!,
                  user.userInfoId,
                }.toList(),
              ));
        }

        return await PostComment.db.insertRow(
          session,
          postComment.copyWith(
            postId: postId,
            owner: user,
            dateCreated: DateTime.now(),
            likedBy: [],
            replyBy: [],
            parentId: postComment.parentId,
          ),
        );
      }
    } catch (e, stackTrace) {
      session.log(
        'Failed to add comment: $e',
        stackTrace: stackTrace,
        level: LogLevel.error,
      );
      return null;
    }
  }

  Future<PostCommentList> getPostComments(
    Session session,
    int postId, {
    int limit = 50,
    int page = 1,
  }) async {
    if (limit <= 0 || page <= 0) {
      throw UserException(
        message: 'Invalid pagination parameters',
      );
    }
    final count = await PostComment.db.count(
      session,
      where: (t) => t.postId.equals(postId) & t.parentId.equals(null),
    );

    final results = await PostComment.db.find(
      session,
      where: (t) => t.postId.equals(postId) & t.parentId.equals(null),
      limit: limit,
      offset: (page * limit) - limit,
      orderBy: (t) => t.dateCreated,
      orderDescending: true,
      include: PostComment.include(
        owner: UserRecord.include(
          userInfo: UserInfo.include(),
        ),
      ),
    );

    return PostCommentList(
      count: count,
      results: results,
      limit: limit,
      page: page,
      numPages: (count / limit).ceil(),
      canLoadMore: page * limit < count,
    );
  }

  Future<PostCommentList> getPostCommentReplies(
    Session session,
    int commentId,
    int postId, {
    int limit = 50,
    int page = 1,
  }) async {
    if (limit <= 0 || page <= 0) {
      throw UserException(
        message: 'Invalid pagination parameters',
      );
    }
    final count = await PostComment.db.count(
      session,
      where: (t) =>
          t.postId.equals(postId) &
          t.parentId.notEquals(null) &
          t.parentId.equals(commentId),
    );

    print(count);

    final results = await PostComment.db.find(
      session,
      where: (t) =>
          t.postId.equals(postId) &
          t.parentId.notEquals(null) &
          t.parentId.equals(commentId),
      limit: limit,
      offset: (page * limit) - limit,
      orderBy: (t) => t.dateCreated,
      orderDescending: true,
      include: PostComment.include(
        owner: UserRecord.include(
          userInfo: UserInfo.include(),
        ),
      ),
    );

    return PostCommentList(
      count: count,
      results: results,
      limit: limit,
      page: page,
      numPages: (count / limit).ceil(),
      canLoadMore: page * limit < count,
    );
  }

  // Delete a comment
  Future<void> deletePostComment(
    Session session,
    int commentId,
  ) async {
    final user = await _authUser(session);

    final comment = await PostComment.db.findById(session, commentId);
    if (comment == null) {
      throw Exception('PostComment not found');
    }

    if (comment.ownerId != user.userInfoId) {
      throw Exception('Unauthorized operation');
    }

    await PostComment.db.deleteRow(session, comment);
  }

  Future<List<int>> getUserLikedComments(
    Session session,
  ) async {
    final user = await _authUser(
      session,
    );
    final likedComments = await PostCommentLikes.db.find(
      session,
      where: (t) => t.ownerId.equals(
        user.userInfoId,
      ),
    );
    return likedComments
        .map(
          (like) => like.postCommentId,
        )
        .toList();
  }

  // Toggle like for a comment
  Future<int> toggleCommentLike(
    Session session,
    int commentId,
  ) async {
    return await session.db.transaction((transaction) async {
      final user = await _authUser(session);

      final comment = await PostComment.db.findById(
        session,
        commentId,
        transaction: transaction,
      );
      if (comment == null) {
        throw UserException(message: 'Comment not found');
      }

      final isLiked = comment.likedBy?.contains(
            user.userInfoId,
          ) ??
          false;

      if (isLiked) {
        comment.likedBy?.remove(user.userInfoId);
        await PostCommentLikes.db.deleteWhere(
          session,
          where: (t) =>
              t.postCommentId.equals(commentId) &
              t.ownerId.equals(user.userInfoId),
          transaction: transaction,
        );
      } else {
        comment.likedBy?.add(user.userInfoId);
        await PostCommentLikes.db.insertRow(
          session,
          PostCommentLikes(
            postCommentId: commentId,
            ownerId: user.userInfoId,
            dateCreated: DateTime.now(),
          ),
          transaction: transaction,
        );
      }

      await PostComment.db.updateRow(
        session,
        comment,
        transaction: transaction,
      );

      return comment.likedBy?.length ?? 0;
    });
  }

  // Authenticate user
  Future<UserRecord> _authUser(Session session,
      [Transaction? transaction]) async {
    final authInfo = await session.authenticated;
    if (authInfo == null) {
      throw Exception('You must be logged in');
    }

    final user = await UserRecord.db.findFirstRow(
      session,
      where: (row) => row.userInfoId.equals(authInfo.userId),
      include: UserRecord.include(
        userInfo: UserInfo.include(),
      ),
      transaction: transaction,
    );

    if (user == null) {
      throw Exception('User not found');
    }

    return user;
  }

  Future<void> validatePostCommentOwnership(
    Session session,
    int commentId,
    UserRecord user,
  ) async {
    final comment = await PostComment.db.findById(
      session,
      commentId,
    );
    if (comment == null) {
      throw PostException(
        message: 'Comment not found',
      );
    }
    if (comment.ownerId != user.userInfoId) {
      throw PostException(
        message: 'Unauthorised operation',
      );
    }
  }
}
