import 'package:civic_server/src/endpoints/hashtag_endpoint.dart';
import 'package:civic_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class PostEndpoint extends Endpoint {
  Future<Post?> savePost(
    Session session,
    Post post,
  ) async {
    try {
      final authInfo = await session.authenticated;
      if (authInfo == null) {
        throw UserException(
          message: 'You must be logged in',
        );
      }
      final user = await UserRecord.db.findFirstRow(
        session,
        where: (row) => row.userInfoId.equals(authInfo.userId),
      );
      if (user == null) return null;
      if (post.id != null) {
        if (post.ownerId != user.userInfoId) {
          throw PostException(
            message: 'Unauthorised operation',
          );
        }
        final sentPost = await Post.db.updateRow(
          session,
          post,
        );
        await HashtagEndpoint().sendPostHashtags(
          session,
          post.tags ?? [],
          post.id!,
        );
        return sentPost;
      } else {
        final sentPost = await Post.db.insertRow(
          session,
          post.copyWith(
            ownerId: user.id,
            owner: user,
          ),
        );
        if (sentPost.id == null) {
          throw Exception('Post ID is null after insert');
        } else {
          await HashtagEndpoint().sendPostHashtags(
            session,
            post.tags ?? [],
            sentPost.id!,
          );
        }
        return sentPost;
      }
    } catch (e) {
      print(e);
      return null;
    }
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
    );
    return result;
  }

  Future<PostList> getPosts(
    Session session, {
    int limit = 10,
    int page = 1,
  }) async {
    final count = await Post.db.count(session);
    final results = await Post.db.find(
      session,
      limit: limit,
      offset: (page * limit) - limit,
      include: Post.include(
        owner: UserRecord.include(),
      ),
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
}
