import 'package:civic_server/src/endpoints/notification_endpoint.dart';
import 'package:civic_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

class UserRecordEndpoint extends Endpoint {
  Future<UserRecord> saveUser(Session session, UserRecord userRecord) async {
    // Save the user record to the database
    final savedRecord = await UserRecord.db.insertRow(
      session,
      userRecord,
    );

    return savedRecord;
  }

  Future<UserRecord?> getUser(
    Session session,
    String? userId,
  ) async {
    // Fetch the authenticated user
    final intUserId = int.tryParse(userId ?? '');
    int? id;
    if (intUserId == null) {
      final authInfo = session.authenticated;
      if (authInfo == null) return null;
      id = authInfo.userId;
    } else {
      id = intUserId;
    }

    // Fetch the user record from the local database
    var cacheKey = 'UserData-$id';
    var userRecord = await session.caches.localPrio.get<UserRecord>(
      cacheKey,
    );

    // If the user record is not in the cache, fetch it from the database
    if (userRecord == null) {
      userRecord = await UserRecord.db.findFirstRow(
        session,
        where: (row) => row.userInfoId.equals(id),
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
    var userRecord = await UserRecord.db.findFirstRow(
      session,
      where: (user) => user.email.equals(email),
    );

    // If the user does not exist, return null
    if (userRecord == null) return null;

    // If the user already exists, return the username
    return userRecord.firstName;
  }

  Future<UsersList> getUsers(
    Session session, {
    required String query,
    int limit = 20,
    int page = 1,
  }) async {
    final authInfo = session.authenticated;
    if (authInfo == null) {
      throw ServerSideException(message: 'You must be logged in');
    }
    // Guard pagination params
    if (limit <= 0 || page <= 0) {
      throw ServerSideException(message: 'Invalid pagination parameters');
    }

    final trimmed = query.trim();

    final currentUser = await UserRecord.db.findFirstRow(
      session,
      where: (row) => row.userInfoId.equals(authInfo.userId),
      include: UserRecord.include(userInfo: UserInfo.include()),
    );
    if (currentUser == null) {
      throw ServerSideException(message: 'You must be logged in');
    }

    // Normalized followees via join table
    final followRows = await UserFollow.db.find(
      session,
      where: (t) => t.followerId.equals(currentUser.id!),
    );
    final followeeIds = followRows.map((f) => f.followeeId).toSet();

    // 1. Fetch followed user matches first (scoped by query when provided)
    List<UserRecord> followedMatches = <UserRecord>[];
    if (followeeIds.isNotEmpty) {
      followedMatches = await UserRecord.db.find(
        session,
        where: (u) {
          final base = u.id.inSet(followeeIds);
          if (trimmed.isNotEmpty) {
            return base & u.userInfo.userName.ilike('%$trimmed%');
          }
          return base;
        },
        include: UserRecord.include(userInfo: UserInfo.include()),
      );
    }

    // 2. If fewer than limit, fetch additional users matching query excluding current user & already included followees
    List<UserRecord> additional = <UserRecord>[];
    if (followedMatches.length < limit) {
      final remaining = limit - followedMatches.length;
      Expression whereAdditional(UserRecordTable u) {
        Expression base = u.id.notEquals(currentUser.id!);
        if (trimmed.isNotEmpty) {
          base = base & u.userInfo.userName.ilike('%$trimmed%');
        }
        if (followeeIds.isNotEmpty) {
          base = base & u.id.notInSet(followeeIds);
        }
        return base;
      }

      additional = await UserRecord.db.find(
        session,
        limit: remaining,
        offset: (page * limit) - limit,
        where: whereAdditional,
        include: UserRecord.include(userInfo: UserInfo.include()),
      );
    }

    // Compose results: followed first then additional, ensure uniqueness (defensive)
    final ordered = <UserRecord>[...followedMatches, ...additional];
    final seen = <int>{};
    final finalResults = <UserRecord>[];
    for (final u in ordered) {
      final id = u.id!;
      if (seen.add(id)) finalResults.add(u);
      if (finalResults.length >= limit) break;
    }

    final totalCount = await UserRecord.db.count(session);
    return UsersList(
      count: totalCount,
      limit: limit,
      page: page,
      results: finalResults,
      numPages: (totalCount / limit).ceil(),
      canLoadMore: page * limit < totalCount,
    );
  }

  Future<List<UserRecord>> mentionUsers(
    Session session, {
    required String query,
    int limit = 20,
  }) async {
    // 1. Auth check
    final authInfo = session.authenticated;
    if (authInfo == null) {
      throw ServerSideException(message: 'You must be logged in');
    }

    // 2. Normalize & guard query.
    final trimmed = query.trim();

    // 3. Load current user (with userInfo for username & avatar).
    final currentUser = await UserRecord.db.findFirstRow(
      session,
      where: (row) => row.userInfoId.equals(authInfo.userId),
      include: UserRecord.include(userInfo: UserInfo.include()),
    );
    if (currentUser == null) {
      throw ServerSideException(message: 'You must be logged in');
    }

    // 4. Fetch followees via normalized join table instead of legacy array.
    final followRows = await UserFollow.db.find(
      session,
      where: (t) => t.followerId.equals(currentUser.id!),
    );
    final followingSet = followRows.map((f) => f.followeeId).toSet();

    // 5. Fetch followed matches first (priority ranking).
    List<UserRecord> followedMatches = <UserRecord>[];
    if (followingSet.isNotEmpty) {
      followedMatches = await UserRecord.db.find(
        session,
        limit: limit,
        where: (u) =>
            u.id.inSet(followingSet) & u.userInfo.userName.ilike('%$trimmed%'),
        include: UserRecord.include(userInfo: UserInfo.include()),
      );
    }

    // 6. If we still need more, fetch other matches excluding current user & already included followed ids.
    List<UserRecord> otherMatches = <UserRecord>[];
    if (followedMatches.length < limit) {
      final remaining = limit - followedMatches.length;
      final followedIds = followedMatches.map((u) => u.id!).toSet();

      // One query for others; we'll filter duplicates post-query (simpler than notInSet support).
      final rawOthers = await UserRecord.db.find(
        session,
        limit: remaining * 2, // slight oversample to allow filtering
        where: (u) =>
            u.userInfo.userName.ilike('%$trimmed%') &
            u.id.notEquals(currentUser.id!),
        include: UserRecord.include(userInfo: UserInfo.include()),
      );
      for (final u in rawOthers) {
        final id = u.id!;
        if (!followedIds.contains(id) && !followingSet.contains(id)) {
          otherMatches.add(u);
          if (otherMatches.length >= remaining) break;
        }
      }
    }

    // 7. Compose ordered list (followed first), trim to limit, ensure uniqueness.
    final ordered = <UserRecord>[...followedMatches, ...otherMatches];
    final seen = <int>{};
    final deduped = <UserRecord>[];
    for (final u in ordered) {
      final id = u.id!;
      if (seen.add(id)) deduped.add(u);
      if (deduped.length >= limit) break;
    }

    return deduped;
  }

  Future<void> followUnfollowUser(
    Session session,
    int userId,
  ) async {
    final authInfo = session.authenticated;
    if (authInfo == null) {
      throw ServerSideException(message: 'You must be logged in');
    }
    if (authInfo.userId == userId) {
      // No-op: cannot follow self
      return;
    }

    await session.db.transaction((transaction) async {
      // Load current user & target user
      final currentUser = await UserRecord.db.findById(
        session,
        authInfo.userId,
        include: UserRecord.include(userInfo: UserInfo.include()),
        transaction: transaction,
      );
      final targetUser = await UserRecord.db.findById(
        session,
        userId,
        include: UserRecord.include(userInfo: UserInfo.include()),
        transaction: transaction,
      );
      if (currentUser == null || targetUser == null) {
        throw ServerSideException(message: 'User not found');
      }

      // Check existing follow relation in join table
      final existing = await UserFollow.db.findFirstRow(
        session,
        where: (t) =>
            t.followerId.equals(currentUser.id!) & t.followeeId.equals(userId),
        transaction: transaction,
      );

      if (existing != null) {
        // Unfollow: remove join, decrement counts safely
        await UserFollow.db
            .deleteRow(session, existing, transaction: transaction);
        currentUser.followingCount = (currentUser.followingCount ?? 0) > 0
            ? (currentUser.followingCount! - 1)
            : 0;
        targetUser.followersCount = (targetUser.followersCount ?? 0) > 0
            ? (targetUser.followersCount! - 1)
            : 0;
      } else {
        // Follow: insert join, increment counts
        await UserFollow.db.insertRow(
          session,
          UserFollow(
            followerId: currentUser.id!,
            followeeId: targetUser.id!,
            createdAt: DateTime.now(),
          ),
          transaction: transaction,
        );
        currentUser.followingCount = (currentUser.followingCount ?? 0) + 1;
        targetUser.followersCount = (targetUser.followersCount ?? 0) + 1;

        // Send notification only on follow
        await NotificationEndpoint().sendNotification(
          session,
          receiverId: targetUser.id!,
          senderId: currentUser.id!,
          actionType: NotificationActionType.follow,
          targetType: NotificationTargetType.user,
          senderAvatarUrl: currentUser.userInfo?.imageUrl ?? '',
          targetId: currentUser.id!,
          body:
              'Tap here to view your followers and follow people you may know.',
          senderName: getFullName(
            currentUser.firstName ?? 'User',
            currentUser.middleName,
            currentUser.lastName ?? '',
          ),
          actionRoute: '/profile/${currentUser.id}',
        );
      }

      // Persist updated counts
      await UserRecord.db
          .updateRow(session, currentUser, transaction: transaction);
      await UserRecord.db
          .updateRow(session, targetUser, transaction: transaction);

      // Broadcast lightweight user updates (counts changed)
      session.messages.postMessage('user_${currentUser.id}', currentUser);
      session.messages.postMessage('user_${targetUser.id}', targetUser);
    });
  }

  Future<UserRecord?> getNinDetails(Session session, String ninNumber) async {
    final userRecord = await UserRecord.db.findFirstRow(
      session,
      where: (t) => t.nin.equals(ninNumber),
    );
    if (userRecord == null) {
      return UserRecord(
        firstName: 'Oluwatosin',
        middleName: 'Ezekiel',
        lastName: 'Ajanaku',
        gender: 'Male',
        birthdate: '1990-01-01',
      );
    }
    return null;
  }

  Stream<UserRecord> userUpdates(Session session, int userId) async* {
    // Create a message stream for this user
    var updateStream =
        session.messages.createStream<UserRecord>('user_$userId');

    // Yield the latest user details when the client subscribes
    var user = await UserRecord.db.findById(
      session,
      userId,
      include: UserRecord.include(
        userInfo: UserInfo.include(),
      ),
    );

    if (user != null) {
      yield user;
    }

    // Send updates when changes occur
    await for (var userUpdate in updateStream) {
      yield userUpdate.copyWith(
        userInfo: user!.userInfo,
      );
    }
  }

  @doNotGenerate
  Future<void> updateUser(Session session, UserRecord userRecord) async {
    // Update the project in the database
    await UserRecord.db.updateRow(session, userRecord);

    // Send an update to all clients subscribed to this project
    session.messages.postMessage(
      'user_${userRecord.id}',
      userRecord,
    );
  }

  @doNotGenerate
  String getFullName(String firstName, String? middleName, String lastName) {
    if (middleName == null || middleName.trim().isEmpty) {
      return '$firstName $lastName';
    }
    return '$firstName $middleName $lastName';
  }

  Future<void> registerDeviceToken(Session session, String token) async {
    // 1. Get the ID of the user who is *currently* logged in
    final user = session.authenticated;
    final currentUserId = user!.userId;

    // 2. Look for the device token in the database
    final existing = await UserDevice.db.findFirstRow(
      session,
      where: (t) => t.token.equals(token),
    );

    if (existing != null) {
      if (existing.userInfoId == currentUserId) {
        return;
      } else {
        existing.userInfoId = currentUserId;
        await UserDevice.db.updateRow(session, existing);
        return;
      }
    } else {
      await UserDevice.db.insertRow(
        session,
        UserDevice(
          userInfoId: currentUserId,
          token: token,
        ),
      );
    }
  }
}
