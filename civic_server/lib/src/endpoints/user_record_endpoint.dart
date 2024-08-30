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
      await session.caches.local.put(
        cacheKey,
        userRecord!,
        lifetime: Duration(
          days: 1,
        ),
      );
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
}
