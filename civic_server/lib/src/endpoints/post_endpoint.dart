import 'package:civic_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

class PostEndpoint extends Endpoint {
  Future<Post?> save(
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
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<UserRecord>> tagUsers(
    Session session,
  ) async {
    final authInfo = await session.authenticated;
    if (authInfo == null) {
      throw UserException(message: 'You must be logged in');
    }

    var currentUser = await UserRecord.db.findFirstRow(
      session,
      where: (row) => row.userInfoId.equals(authInfo.userId),
      include: UserRecord.include(
        userInfo: UserInfo.include(),
      ),
    );

    if (currentUser == null) {
      throw UserException(message: 'You must be logged in');
    }
    var users = await UserRecord.db.find(
      session,
      where: (u) => u.userInfo.id.inSet(
        currentUser.followers.toSet(),
      ),
      include: UserRecord.include(
        userInfo: UserInfo.include(),
      ),
    );

    if (users.length < 20) {
      var additionalUsers = await UserRecord.db.find(
        session,
        // limit: 20 - users.length,
        include: UserRecord.include(
          userInfo: UserInfo.include(),
        ),
      );
      users.addAll(additionalUsers);
    }

    print(users);

    return users;
  }

  Future<List<UserRecord>> searchUsers(Session session, String query) async {
    final authInfo = await session.authenticated;
    if (authInfo == null) {
      throw UserException(message: 'You must be logged in');
    }
    return await UserRecord.db.find(
      session,
      where: (u) => u.userInfo.userName.ilike('%$query%'),
      limit: 20,
      include: UserRecord.include(
        userInfo: UserInfo.include(),
      ),
    );
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
