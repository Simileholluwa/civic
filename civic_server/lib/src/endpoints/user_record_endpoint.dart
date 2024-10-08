import 'package:civic_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

class UserRecordEndpoint extends Endpoint {
  Future<void> saveUserRecord(Session session, UserRecord userRecord) async {
    await UserRecord.db.insertRow(
      session,
      userRecord,
    );
  }

  Future<UserRecord?> me(
    Session session,
  ) async {
    final authInfo = await session.authenticated;
    if (authInfo == null) return null;

    var cacheKey = 'UserData-${authInfo.userId}';

    var userRecord = await session.caches.localPrio.get<UserRecord>(cacheKey);

    if (userRecord == null) {
      userRecord = await UserRecord.db.findFirstRow(
        session,
        where: (row) => row.userInfoId.equals(authInfo.userId),
        include: UserRecord.include(
          userInfo: UserInfo.include(),
        ),
      );
      if (userRecord != null) {
        await session.caches.localPrio.put(
          cacheKey,
          userRecord,
          lifetime: Duration(
            days: 1,
          ),
        );
      }
    }

    return userRecord;
  }

  Future<String?> checkIfNewUser(Session session, String email) async {
    var userInfo = await UserInfo.db.findFirstRow(
      session,
      where: (user) => user.email.equals(email),
    );

    if (userInfo == null) return null;

    return userInfo.userName;
  }

  Future<List<String>> fetchAllUsernames(Session session) async {
    var userInfos = await UserInfo.db.find(
      session,
    );
    var usernames = userInfos.map((user) => user.userName!).toList();
    return usernames;
  }

  Future<UsersList> listUsers(
    Session session, {
    required String query,
    int limit = 20,
    int page = 1,
  }) async {
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
      where: (u) =>
          u.userInfo.id.inSet(
            currentUser.followers.toSet(),
          ) &
          u.userInfo.userName.ilike('%${query.trim()}%'),
      include: UserRecord.include(
        userInfo: UserInfo.include(),
      ),
    );

    if (users.length < limit) {
      var additionalUsers = await UserRecord.db.find(
        session,
        limit: limit,
        offset: (page * limit) - limit,
        where: (u) =>
            u.userInfo.userName.ilike('%${query.trim()}%') &
            u.userInfo.id.notEquals(currentUser.userInfo!.id),
        include: UserRecord.include(
          userInfo: UserInfo.include(),
        ),
      );
      users.addAll(additionalUsers);
    }

    final count = await UserRecord.db.count(session);

    return UsersList(
      count: count,
      limit: limit,
      page: page,
      results: users,
      numPages: (count / limit).ceil(),
      canLoadMore: page * limit < count,
    );
  }

  Future<List<UserRecord>> mentionUsers(
    Session session, {
    required String query,
    int limit = 20,
  }) async {
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
      where: (u) =>
          u.userInfo.id.inSet(
            currentUser.followers.toSet(),
          ) &
          u.userInfo.userName.ilike('%${query.trim()}%'),
      include: UserRecord.include(
        userInfo: UserInfo.include(),
      ),
    );

    if (users.length < limit) {
      var additionalUsers = await UserRecord.db.find(
        session,
        limit: limit - users.length,
        where: (u) =>
            u.userInfo.userName.ilike('%${query.trim()}%') &
            u.userInfo.id.notEquals(currentUser.userInfo!.id),
        include: UserRecord.include(
          userInfo: UserInfo.include(),
        ),
      );
      users.addAll(additionalUsers);
    }

    return users;
  }

  Future<List<String>> fetchHashtags(
    Session session, {
    required String query,
    int limit = 20,
  }) async {
    final authInfo = await session.authenticated;
    if (authInfo == null) {
      throw UserException(message: 'You must be logged in');
    }
    final hashtags = await Hashtag.db.find(
      session,
      limit: limit,
      where: (hashtag) => hashtag.tag.ilike('%${query.trim()}%'),
    );
    return hashtags.map((hashtag) => '#${hashtag.tag}').toList();
  }
}
