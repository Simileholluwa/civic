import 'package:civic_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class SendPostFutureCall extends FutureCall<Post> {
  @override
  Future<void> invoke(Session session, Post? object) async {
    final authInfo = await session.authenticated;
    if (authInfo == null) return;
    final user = await UserRecord.db.findFirstRow(
      session,
      where: (row) => row.userInfoId.equals(authInfo.userId),
    );
    if (user == null) return;
    if (object!.id != null) {
      if (object.ownerId != user.userInfoId) return;

      await Post.db.updateRow(session, object);
      return;
    } else {
      Post.db.insertRow(
        session,
        object.copyWith(
          ownerId: user.id,
          owner: user,
        ),
      );
      print('done executing...');
      return;
    }
  }
}
