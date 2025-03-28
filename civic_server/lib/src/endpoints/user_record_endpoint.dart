import 'package:civic_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

class UserRecordEndpoint extends Endpoint {
  Future<void> saveUser(Session session, UserRecord userRecord) async {
    // Save the user record to the database
    await UserRecord.db.insertRow(
      session,
      userRecord.copyWith(
        followers: [],
        following: [],
        verifiedAccount: false,
      ),
    );
  }

  Future<UserRecord?> getUser(
    Session session,
  ) async {
    // Fetch the authenticated user
    final authInfo = await session.authenticated;

    // If the user is not authenticated, return null
    if (authInfo == null) return null;

    // Fetch the user record from the local database
    var cacheKey = 'UserData-${authInfo.userId}';
    var userRecord = await session.caches.localPrio.get<UserRecord>(cacheKey);

    // If the user record is not in the cache, fetch it from the database
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

    // Return the user record
    return userRecord;
  }

  Future<String?> checkIfNewUser(Session session, String email) async {
    // Check if the user already exists in the database
    var userInfo = await UserInfo.db.findFirstRow(
      session,
      where: (user) => user.email.equals(email),
    );

    // If the user does not exist, return null
    if (userInfo == null) return null;

    // If the user already exists, return the username
    print(userInfo.userName);
    return userInfo.userName;
  }

  Future<List<String>> fetchUsernames(Session session) async {
    // Fetch all user records from the database
    var userInfos = await UserInfo.db.find(
      session,
    );

    // Return a list of all usernames
    return userInfos.map((user) => user.userName!).toList();
  }

  Future<UsersList> getUsers(
    Session session, {
    required String query,
    int limit = 20,
    int page = 1,
  }) async {
    // Fetch the authenticated user
    final authInfo = await session.authenticated;

    // If the user is not authenticated, throw an exception
    if (authInfo == null) {
      throw UserException(message: 'You must be logged in');
    }

    // Fetch the current user record
    var currentUser = await UserRecord.db.findFirstRow(
      session,
      where: (row) => row.userInfoId.equals(authInfo.userId),
      include: UserRecord.include(
        userInfo: UserInfo.include(),
      ),
    );

    // If the current user does not exist, throw an exception
    if (currentUser == null) {
      throw UserException(message: 'You must be logged in');
    }

    // Fetch users that the current user follows and whose usernames match the query
    var users = await UserRecord.db.find(
      session,
      where: (u) =>
          u.userInfo.id.inSet(
            currentUser.followers!.toSet(),
          ) &
          u.userInfo.userName.ilike('%${query.trim()}%'),
      include: UserRecord.include(
        userInfo: UserInfo.include(),
      ),
    );

    // If the number of users fetched is less than the limit, fetch additional users
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

    // Fetch the total number of users
    final count = await UserRecord.db.count(session);

    // Return a list of users
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
    // Fetch the authenticated user
    final authInfo = await session.authenticated;

    // If the user is not authenticated, throw an exception
    if (authInfo == null) {
      throw UserException(message: 'You must be logged in');
    }

    // Fetch the current user record
    var currentUser = await UserRecord.db.findFirstRow(
      session,
      where: (row) => row.userInfoId.equals(authInfo.userId),
      include: UserRecord.include(
        userInfo: UserInfo.include(),
      ),
    );

    // If the current user does not exist, throw an exception
    if (currentUser == null) {
      throw UserException(message: 'You must be logged in');
    }

    // Fetch users that the current user follows and whose usernames match the query
    var users = await UserRecord.db.find(
      session,
      where: (u) =>
          u.userInfo.id.inSet(
            currentUser.followers!.toSet(),
          ) &
          u.userInfo.userName.ilike('%${query.trim()}%'),
      include: UserRecord.include(
        userInfo: UserInfo.include(),
      ),
    );

    // If the number of users fetched is less than the limit, fetch additional users
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

    // Return a list of users
    return users;
  }

  Future<void> followUnfollowUser(
    Session session,
    int userId,
  ) async {
    // Fetch the authenticated user
    final authInfo = await session.authenticated;

    // If the user is not authenticated, throw an exception
    if (authInfo == null) {
      throw UserException(message: 'You must be logged in');
    }

    // Fetch current user and the user to be followed
    final currentUser = await UserRecord.db.findById(
      session,
      authInfo.userId,
    );
    final followedUser = await UserRecord.db.findById(
      session,
      userId,
    );

    // If either user does not exist, throw an exception
    if (currentUser == null || followedUser == null) {
      throw UserException(message: 'User not found');
    }

    // Check if the current user is already following the target user
    if (currentUser.following!.contains(userId)) {
      // Unfollow the user
      currentUser.following!.remove(userId);
      followedUser.followers!.remove(authInfo.userId);
      print('User ${authInfo.userId} has unfollowed $userId');
    } else {
      // Follow the user
      currentUser.following!.add(userId);
      followedUser.followers!.add(authInfo.userId);
      print('User ${authInfo.userId} has followed $userId');
    }

    // Save changes to both users
    await UserRecord.db.updateRow(session, currentUser);
    await UserRecord.db.updateRow(session, followedUser);
  }
}
