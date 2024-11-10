import 'package:civic_server/src/endpoints/hashtag_endpoint.dart';
import 'package:civic_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class SchedulePollFutureCall extends FutureCall<Poll> {
  @override
  Future<void> invoke(Session session, Poll? object) async {
    if (object != null) {
      try {
        if (object.id != null) {
          // Update the poll
          await Poll.db.updateRow(
            session,
            object,
          );
        } else {
          // Send the poll
          final sentPoll = await Poll.db.insertRow(
            session,
            object,
          );

          // Send the hashtags
          await HashtagEndpoint().sendPollHashtags(
            session,
            sentPoll.tags,
            sentPoll.id!,
          );
        }
      } catch (e) {
        await session.serverpod.futureCallWithDelay(
          'schedulePollFutureCall',
          object,
          Duration(
            seconds: 60,
          ),
        );
      }
    }
  }
}
