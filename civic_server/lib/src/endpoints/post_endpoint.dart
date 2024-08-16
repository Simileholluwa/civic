import 'package:civic_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class PostEndpoint extends Endpoint {
  Future<Post?> save(Session session, Post post) async {
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
}
