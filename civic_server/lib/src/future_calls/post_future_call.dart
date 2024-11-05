import 'package:civic_server/src/endpoints/hashtag_endpoint.dart';
import 'package:civic_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class SendPostFutureCall extends FutureCall<Post> {
  @override
  Future<void> invoke(Session session, Post? object) async {
    if (object != null) {
      try {
        if (object.id != null) {
          await Post.db.updateRow(
            session,
            object,
          );
        } else {
          final sentPost = await Post.db.insertRow(
            session,
            object,
          );

          await HashtagEndpoint().sendHashTags(
            session,
            sentPost.tags,
            sentPost.id!,
          );
        }
        print('Sent post!');
      } catch (e) {
        await session.serverpod.futureCallWithDelay(
          'sendPostFutureCall',
          object,
          Duration(
            seconds: 60,
          ),
        );
        print(e.toString());
        print('Resending post...!');
      }
    }
  }
}
