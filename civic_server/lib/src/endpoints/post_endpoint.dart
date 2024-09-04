import 'package:civic_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class PostEndpoint extends Endpoint {
  Future<Post?> save(
    Session session,
    Post post,
  ) async {
    final authInfo = await session.authenticated;
    if (authInfo == null) return null;
    final user = await UserRecord.db.findFirstRow(
      session,
      where: (row) => row.userInfoId.equals(authInfo.userId),
    );
    if (user == null) return null;
    if (post.id != null) {
      if (post.ownerId != user.userInfoId) return null;

      return await Post.db.updateRow(session, post);
    } else {
      return Post.db.insertRow(
        session,
        post.copyWith(
          ownerId: user.id,
          owner: user,
        ),
      );
    }
  }

  Future<void> sendInFuture(
    Session session,
    Post post,
    DateTime dateTime,
  ) async {
    await session.serverpod.futureCallAtTime(
      'sendPostFutureCall',
      post,
      dateTime,
    );
  }

  Future<Post?> retrieve(
    Session session,
    int id,
  ) async {
    final result = await Post.db.findById(
      session,
      id,
    );
    return result;
  }

  Future<PostList> listPost(
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
