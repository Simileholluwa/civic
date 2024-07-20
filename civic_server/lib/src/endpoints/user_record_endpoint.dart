import 'package:civic_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

class UserRecordEndpoint extends Endpoint {
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

  Future<void> setVerifiedEmail(Session session, int id) async {
    var userRecord = await UserRecord.db.findById(
      session,
      id,
    );
    if (userRecord != null) {
      userRecord.verifiedEmail = true;
      await UserRecord.db.updateRow(
        session,
        userRecord,
      );
    }
  }

  Future<bool> checkVerifiedEmail(Session session, int id) async {
    var userRecord = await UserRecord.db.findById(
      session,
      id,
    );
    if (userRecord != null) {
      if (userRecord.verifiedEmail!) {
        return true;
      }
    }
    return false;
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
