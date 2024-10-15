import 'package:civic_server/src/endpoints/hashtag_endpoint.dart';
import 'package:civic_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class SendPollFutureCall extends FutureCall<Poll> {
  @override
  Future<void> invoke(Session session, Poll? object) async {
    if (object != null) {
      try {

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
      } catch (e) {
        await session.serverpod.futureCallWithDelay(
          'sendPollFutureCall',
          object,
          Duration(
            seconds: 60,
          ),
        );
      }
    }
  }
}
