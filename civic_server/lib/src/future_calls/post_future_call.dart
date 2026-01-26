import 'package:civic_server/src/endpoints/hashtag_endpoint.dart';
import 'package:civic_server/src/generated/endpoints.dart';
import 'package:civic_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class SchedulePostFutureCall extends FutureCall<Post> {
  Future<void> sendPostInFuture(Session session, Post? object) async {
    if (object != null) {
      try {
        if (object.id != null) {
          await Post.db.updateRow(session, object);
        } else {
          final sentPost = await Post.db.insertRow(session, object);

          await HashtagEndpoint().sendPostHashtags(
            session,
            sentPost.tags ?? [],
            sentPost.id!,
          );
        }
        print('Sent post!');
      } catch (e) {
        await session.serverpod.futureCalls
            .callWithDelay(const Duration(seconds: 60))
            .schedulePost
            .sendPostInFuture(object);
        print(e.toString());
        print('Resending post...!');
      }
    }
  }
}
