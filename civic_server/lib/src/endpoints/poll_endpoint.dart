import 'package:civic_server/src/endpoints/hashtag_endpoint.dart';
import 'package:civic_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class PollEndpoint extends Endpoint {
  Future<Poll?> save(
    Session session,
    Poll poll,
  ) async {
    try {
      // Fetch the authenticated user
      final authInfo = await session.authenticated;

      // If the user is not authenticated, return null
      if (authInfo == null) {
        throw UserException(
          message: 'You must be logged in',
        );
      }

      // Fetch the user record from the local database
      final user = await UserRecord.db.findFirstRow(
        session,
        where: (row) => row.userInfoId.equals(authInfo.userId),
      );

      // If the user record is not found, throw an exception
      if (user == null) {
        throw UserException(
          message: 'User not found',
        );
      }

      // If the poll ID is not null, update the poll
      if (poll.id != null) {
        // If the poll owner ID does not match the user ID, throw an exception
        if (poll.ownerId != user.userInfoId) {
          throw PostException(
            message: 'Unauthorised operation',
          );
        }

        // Update the poll
        final sentPoll = await Poll.db.updateRow(
          session,
          poll,
        );

        // return the sent poll
        return sentPoll;
      } else {
        // Insert the poll
        final sentPoll = await Poll.db.insertRow(
          session,
          poll.copyWith(
            ownerId: user.id,
            owner: user,
          ),
        );

        // If the poll ID is null after insert, throw an exception
        if (sentPoll.id == null) {
          throw Exception('Poll ID is null after insert');
        } else {
          // Send the hashtags
          await HashtagEndpoint().sendPollHashtags(
            session,
            poll.tags,
            sentPoll.id!,
          );
        }

        // Return the sent poll
        return sentPoll;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> sendInFuture(
    Session session,
    Poll poll,
    DateTime dateTime,
  ) async {
    await session.serverpod.futureCallAtTime(
      'sendPollFutureCall',
      poll,
      dateTime,
    );
  }

  Future<Poll?> retrieve(
    Session session,
    int pollId,
  ) async {
    try {
      // Fetch the poll
      var poll = await Poll.db.findById(
        session,
        pollId,
      );

      // Return null is the poll is null
      if (poll == null) return null;

      return poll;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> castVote(
    Session session,
    int pollId,
    int optionId,
  ) async {
    // Fetch the authenticated user
    final authInfo = await session.authenticated;

    // If the user is not authenticated, return null
    if (authInfo == null) {
      throw UserException(
        message: 'You must be logged in',
      );
    }

    // Fetch the user record from the local database
    final user = await UserRecord.db.findFirstRow(
      session,
      where: (row) => row.userInfoId.equals(authInfo.userId),
    );

    // If the user record is not found, throw an exception
    if (user == null) {
      throw UserException(
        message: 'User not found',
      );
    }

    // Check if the user has already voted
    var existingVote = await PollVote.db.findFirstRow(
      session,
      where: (t) =>
          t.pollId.equals(
            pollId,
          ) &
          t.voterId.equals(
            user.id,
          ),
    );

    // If the user has already voted, throw an exception and return
    if (existingVote != null) {
      throw UserException(
        message: 'You have already voted in this poll',
      );
    }

    // Cast the vote and increase the vote count
    var vote = PollVote(
      pollId: pollId,
      voterId: user.id!,
    );

    // Insert the vote
    await PollVote.db.insertRow(session, vote);

    // Fetch the poll option
    final poll = await Poll.db.findById(
      session,
      pollId,
    );

    // Increase the vote count of the selected option if the poll is not null
    if (poll != null) {
      poll.options!.votes += 1;
      poll.options!.voters.add(
        user,
      );
      await Poll.db.updateRow(
        session,
        poll,
      );
    }
  }
}
