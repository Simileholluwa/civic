import 'package:civic_server/src/endpoints/hashtag_endpoint.dart';
import 'package:civic_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

class PollEndpoint extends Endpoint {
  Future<Poll?> savePoll(Session session, Poll poll) async {
    return await session.db.transaction((transaction) async {
      try {
        final user = await authUser(session);

        if (poll.id != null) {
          await validatePollOwnership(
            session,
            poll.id!,
            user,
          );

          // Update the poll
          final sentPoll = await Poll.db.updateRow(
            session,
            poll.copyWith(
              updatedAt: DateTime.now(),
            ),
          );

          for (final option in poll.options!) {
            await PollOption.db.updateRow(
              session,
              option,
              transaction: transaction,
            );
          }

          await HashtagEndpoint().sendPollHashtags(
            session,
            poll.tags ?? [],
            sentPoll.id!,
          );

          // return the sent poll
          return sentPoll;
        } else {
          // Create the poll with its related options
          final savedPoll = await Poll.db.insertRow(
            session,
            poll.copyWith(
              votedBy: [],
            ),
            transaction: transaction,
          );

          final savedOptions = <PollOption>[];

          for (final option in poll.options!) {
            final insertedOption = await PollOption.db.insertRow(
              session,
              option.copyWith(
                pollId: savedPoll.id,
                votedBy: [],
              ),
              transaction: transaction,
            );
            savedOptions.add(insertedOption);
          }

          await HashtagEndpoint().sendPollHashtags(
            session,
            poll.tags ?? [],
            savedPoll.id!,
          );

          final updatedPoll = await Poll.db.updateRow(
            session,
            savedPoll.copyWith(
              options: savedOptions,
            ),
            transaction: transaction,
          );

          return updatedPoll.copyWith(
            owner: user,
          );
        }
      } catch (e, stackTrace) {
        session.log(
          'Error in createPoll: $e',
          level: LogLevel.error,
          exception: e,
          stackTrace: stackTrace,
        );
        return null;
      }
    });
  }

  Future<void> schedulePoll(
    Session session,
    Poll poll,
    DateTime dateTime,
  ) async {
    await session.serverpod.futureCallAtTime(
      'schedulePollFutureCall',
      poll,
      dateTime,
    );
  }

  Future<void> castVote(
    Session session,
    int pollId,
    int optionId,
  ) async {
    return await session.db.transaction((transaction) async {
      final user = await authUser(session);

      // Fetch the poll
      final poll =
          await Poll.db.findById(session, pollId, transaction: transaction);
      if (poll == null) {
        throw PostException(message: 'Poll not found.');
      }

      // Check poll expiration
      if (poll.expiresAt != null && DateTime.now().isAfter(poll.expiresAt!)) {
        throw PostException(message: 'Poll has ended.');
      }

      // Check if user has already voted
      if (poll.votedBy!.contains(user.id)) {
        throw PostException(message: 'You have already voted.');
      }

      // Ensure selected option belongs to the poll
      final option = await PollOption.db.findById(
        session,
        optionId,
        transaction: transaction,
      );
      if (option == null || option.pollId != pollId) {
        throw PostException(message: 'Invalid poll option selected.');
      }

      // Update PollOption's votedBy
      final updatedOption = option.copyWith(
        votedBy: [
          ...option.votedBy!,
          user.id!,
        ],
      );
      await PollOption.db.updateRow(
        session,
        updatedOption,
        transaction: transaction,
      );

      // Update Poll's votedBy
      final updatedPoll = poll.copyWith(
        votedBy: [
          ...poll.votedBy!,
          user.id!,
        ],
      );
      await Poll.db.updateRow(
        session,
        updatedPoll,
        transaction: transaction,
      );

      return;
    });
  }

  Future<bool> clearVote(
    Session session, {
    required int pollId,
  }) async {
    return await session.db.transaction((transaction) async {
      final user = await authUser(session);
      final userId = user.id!;

      // Fetch the poll
      final poll = await Poll.db.findById(
        session,
        pollId,
        transaction: transaction,
      );
      if (poll == null) {
        throw PostException(message: 'Poll not found.');
      }

      // Check if user has voted
      if (!poll.votedBy!.contains(userId)) {
        throw PostException(
          message: 'You have not voted on this poll.',
        );
      }

      // Check poll expiration
      if (poll.expiresAt != null && DateTime.now().isAfter(poll.expiresAt!)) {
        throw PostException(message: 'Poll has ended.');
      }

      // Fetch all options for the poll
      final options = await PollOption.db.find(
        session,
        where: (o) => o.pollId.equals(pollId),
        transaction: transaction,
      );

      // Find the one the user voted on
      PollOption? votedOption = options.firstWhere(
        (option) => option.votedBy!.contains(userId),
        orElse: () => throw PostException(
          message: 'You have not voted for this option.',
        ),
      );

      // Remove user from PollOption.votedBy
      final updatedOption = votedOption.copyWith(
        votedBy: votedOption.votedBy!
            .where(
              (id) => id != userId,
            )
            .toList(),
      );
      await PollOption.db.updateRow(
        session,
        updatedOption,
        transaction: transaction,
      );

      // Remove user from Poll.votedBy
      final updatedPoll = poll.copyWith(
        votedBy: poll.votedBy!
            .where(
              (id) => id != userId,
            )
            .toList(),
      );
      await Poll.db.updateRow(
        session,
        updatedPoll,
        transaction: transaction,
      );

      return true;
    });
  }

  Future<PollResult> getPollResults(
    Session session,
    int pollId,
  ) async {
    final poll = await Poll.db.findById(session, pollId);
    if (poll == null) {
      throw PostException(message: 'Poll not found.');
    }

    final options = await PollOption.db.find(
      session,
      where: (o) => o.pollId.equals(pollId),
    );

    final totalVotes = poll.votedBy!.length;

    final optionResults = options.map((option) {
      final count = option.votedBy!.length;
      final percentage = totalVotes > 0 ? (count / totalVotes) * 100 : 0.0;

      return PollOptionResult(
        optionId: option.id!,
        option: option.option!,
        voteCount: count,
        percentage: double.parse(
          percentage.toStringAsFixed(2),
        ),
      );
    }).toList();

    return PollResult(
      pollId: poll.id!,
      totalVotes: totalVotes,
      options: optionResults,
    );
  }

  Future<PollList> getPolls(
    Session session, {
    int limit = 50,
    int page = 1,
  }) async {
    final count = await Poll.db.count(session);
    final results = await Poll.db.find(
      session,
      limit: limit,
      offset: (page * limit) - limit,
      include: Poll.include(
        owner: UserRecord.include(
          userInfo: UserInfo.include(),
        ),
      ),
      orderBy: (t) => t.createdAt,
      orderDescending: true,
    );

    return PollList(
      count: count,
      limit: limit,
      page: page,
      results: results,
      numPages: (count / limit).ceil(),
      canLoadMore: page * limit < count,
    );
  }

  Future<Poll?> getPoll(Session session, int pollId) async {
    try {
      final poll = await Poll.db.findById(
        session,
        pollId,
        include: Poll.include(
          owner: UserRecord.include(
            userInfo: UserInfo.include(),
          ),
        ),
      );
      if (poll == null) {
        throw PostException(message: 'Poll not found.');
      }

      final options = await PollOption.db.find(
        session,
        where: (t) => t.pollId.equals(pollId),
      );

      return poll.copyWith(
        options: options,
      );
    } catch (e, stackTrace) {
      session.log(
        'Error in fetchPoll: $e',
        level: LogLevel.error,
        exception: e,
        stackTrace: stackTrace,
      );
      return null;
    }
  }

  Future<bool> hasVoted(Session session, int pollId, int userId) async {
    // Check if the user has already voted
    var existingVote = await PollVote.db.findFirstRow(
      session,
      where: (t) =>
          t.pollId.equals(
            pollId,
          ) &
          t.voterId.equals(
            userId,
          ),
    );

    // If the user has already voted, return true
    if (existingVote != null) {
      return true;
    }

    // If the user has not voted, return false
    return false;
  }

  Future<UserRecord> authUser(
    Session session,
  ) async {
    final authInfo = await session.authenticated;
    if (authInfo == null) {
      throw UserException(
        message: 'You must be logged in',
      );
    }

    final user = await UserRecord.db.findFirstRow(
      session,
      where: (row) => row.userInfoId.equals(
        authInfo.userId,
      ),
      include: UserRecord.include(
        userInfo: UserInfo.include(),
      ),
    );

    if (user == null) {
      throw UserException(
        message: 'User not found',
      );
    }

    return user;
  }

  Future<void> validatePollOwnership(
    Session session,
    int pollId,
    UserRecord user,
  ) async {
    final poll = await Poll.db.findById(
      session,
      pollId,
    );
    if (poll == null) {
      throw PostException(
        message: 'Poll not found',
      );
    }
    if (poll.ownerId != user.userInfoId) {
      throw PostException(
        message: 'Unauthorised operation',
      );
    }
  }
}
