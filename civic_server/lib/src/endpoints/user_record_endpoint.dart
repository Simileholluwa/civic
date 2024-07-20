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

    final userRecord = UserRecord.db.findFirstRow(
      session,
      where: (row) => row.userInfoId.equals(authInfo.userId),
      include: UserRecord.include(
        userInfo: UserInfo.include(),
      ),
    );

    return userRecord;
  }

  Future<String?> checkIfNewUser(Session session, String email) async {
    var userRecord = await UserRecord.db.findFirstRow(
      session,
      where: (user) => user.userInfo.email.equals(email),
      include: UserRecord.include(
        userInfo: UserInfo.include(),
      ),
    );
    return userRecord?.userInfo?.userName;
  }

  Future<List<String>> fetchAllUsernames(Session session) async {
    var userRecords = await UserRecord.db.find(
      session,
      include: UserRecord.include(
        userInfo: UserInfo.include(),
      ),
    );
    var usernames =
        userRecords.map((user) => user.userInfo!.userName!).toList();
    return usernames;
  }
}
