import 'package:civic_server/src/endpoints/hashtag_endpoint.dart';
import 'package:civic_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

class PostEndpoint extends Endpoint {
  Future<Post?> savePost(
    Session session,
    Post post,
  ) async {
    return await session.db.transaction((transaction) async {
      try {
        final user = await authUser(
          session,
        );
        if (post.id != null) {
          await validatePostOwnership(
            session,
            post.id!,
            user,
          );
          final sentPost = await Post.db.updateRow(
            session,
            post.copyWith(
              updatedAt: DateTime.now(),
            ),
            transaction: transaction,
          );
          await HashtagEndpoint().sendPostHashtags(
            session,
            post.tags ?? [],
            post.id!,
          );
          return sentPost;
        } else {
          if (post.project != null) {
            final project = await Project.db.findById(
              session,
              post.project!.id!,
            );
            if (project == null) {
              throw PostException(
                message: 'Project not found',
              );
            }
          }
          final sentPost = await Post.db.insertRow(
            session,
            post.copyWith(
              ownerId: user.id,
              owner: user,
              dateCreated: DateTime.now(),
              repostBy: [],
              likedBy: [],
              commentBy: [],
            ),
            transaction: transaction,
          );
          if (sentPost.id == null) {
            throw Exception('Post ID is null after insert');
          } else {
            await HashtagEndpoint().sendPostHashtags(
              session,
              post.tags ?? [],
              sentPost.id!,
            );
            await Project.db.updateRow(
              session,
              post.project!.copyWith(
                numberOfReposts: post.project!.numberOfReposts! + 1,
                repostedBy: <int>{
                  ...post.project!.repostedBy ?? [],
                  user.userInfoId
                }.toList(),
              ),
              transaction: transaction,
            );
          }
          return sentPost;
        }
      } catch (e, stackTrace) {
        session.log(
          'Error in savePost: $e',
          level: LogLevel.error,
          exception: e,
          stackTrace: stackTrace,
        );
        return null;
      }
    });
  }

  Future<void> schedulePost(
    Session session,
    Post post,
    DateTime dateTime,
  ) async {
    await session.serverpod.futureCallAtTime(
      'schedulePostFutureCall',
      post,
      dateTime,
    );
  }

  Future<Post?> getPost(
    Session session,
    int id,
  ) async {
    final result = await Post.db.findById(
      session,
      id,
      include: Post.include(
        owner: UserRecord.include(
          userInfo: UserInfo.include(),
        ),
        project: Project.include(
          owner: UserRecord.include(
            userInfo: UserInfo.include(),
          ),
        ),
      ),
    );
    return result;
  }

  Future<PostList> getPosts(
    Session session, {
    int limit = 10,
    int page = 1,
  }) async {
    if (limit <= 0 || page <= 0) {
      throw UserException(
        message: 'Invalid pagination parameters',
      );
    }
    final count = await Post.db.count(session);
    final results = await Post.db.find(
      session,
      limit: limit,
      offset: (page * limit) - limit,
      include: Post.include(
          owner: UserRecord.include(
            userInfo: UserInfo.include(),
          ),
          project: Project.include(
            owner: UserRecord.include(
              userInfo: UserInfo.include(),
            ),
          )),
      orderBy: (t) => t.dateCreated,
      orderDescending: true,
    );

    return PostList(
      count: count,
      limit: limit,
      page: page,
      results: results,
      numPages: (count / limit).ceil(),
      canLoadMore: page * limit < count,
    );
  }

  Future<void> deletePost(
    Session session,
    int id,
  ) async {
    final user = await authUser(
      session,
    );
    await validatePostOwnership(
      session,
      id,
      user,
    );

    await Post.db.deleteRow(
      session,
      Post(
        id: id,
        ownerId: user.userInfoId,
      ),
    );
  }

  Future<List<int>> getUserLikedPosts(
    Session session,
  ) async {
    final user = await authUser(
      session,
    );
    final likedPosts = await PostLikes.db.find(
      session,
      where: (t) => t.ownerId.equals(
        user.userInfoId,
      ),
    );
    return likedPosts
        .map(
          (like) => like.postId,
        )
        .toList();
  }

  Future<int> toggleLike(
    Session session,
    int postId,
  ) async {
    int likesCount = 0;
    await session.db.transaction((transaction) async {
      final user = await authUser(
        session,
      );

      final post = await Post.db.findById(
        session,
        postId,
        transaction: transaction,
      );
      if (post == null) {
        throw PostException(
          message: "Post not found",
        );
      }

      final isLiked = post.likedBy?.contains(
            user.userInfoId,
          ) ??
          false;

      if (isLiked) {
        post.likedBy?.remove(user.userInfoId);
        await PostLikes.db.deleteWhere(
          session,
          where: (t) =>
              t.postId.equals(postId) & t.ownerId.equals(user.userInfoId),
          transaction: transaction,
        );
      } else {
        post.likedBy?.add(user.userInfoId);
        await PostLikes.db.insertRow(
          session,
          PostLikes(
            postId: postId,
            ownerId: user.userInfoId,
            dateCreated: DateTime.now(),
          ),
          transaction: transaction,
        );
      }
      await Post.db.updateRow(
        session,
        post,
        transaction: transaction,
      );
      likesCount = post.likedBy?.length ?? 0;
    });
    return likesCount;
  }

  Future<UserRecord> authUser(
    Session session,
  ) async {
    final authInfo = await session.authenticated;
    if (authInfo == null) {
      throw UserException(
        message: 'You must be logged in',
      );
    }

    final user = await UserRecord.db.findFirstRow(
      session,
      where: (row) => row.userInfoId.equals(
        authInfo.userId,
      ),
      include: UserRecord.include(
        userInfo: UserInfo.include(),
      ),
    );

    if (user == null) {
      throw UserException(
        message: 'User not found',
      );
    }

    return user;
  }

  Future<void> validatePostOwnership(
    Session session,
    int postId,
    UserRecord user,
  ) async {
    final post = await Post.db.findById(
      session,
      postId,
    );
    if (post == null) {
      throw PostException(
        message: 'Post not found',
      );
    }
    if (post.ownerId != user.userInfoId) {
      throw PostException(
        message: 'Unauthorised operation',
      );
    }
  }
}
