import 'dart:async';
import 'dart:io';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';

abstract class PollRemoteDatasource {
  Future<Poll> save({
    required Poll poll,
  });
  Future<void> saveInFuture({
    required Poll poll,
    required DateTime scheduledDatetime,
  });
  Future<Poll> retrieve({
    required int id,
  });
  Future<void> castVote({
    required int pollId,
    required int optionId,
  });
  Future<PollList> getPolls({
    required int page,
    required int limit,
  });
  Future<void> toggleLike({
    required int id,
  });
  Future<void> toggleBookmark({
    required int id,
  });
  Future<void> markNotInterested({
    required int id,
    required String reason,
  });
  Future<void> deletePoll({required int id});
}

class PollRemoteDatasourceImpl implements PollRemoteDatasource {
  PollRemoteDatasourceImpl({
    required Client client,
  }) : _client = client;
  final Client _client;
  @override
  Future<void> castVote({
    required int pollId,
    required int optionId,
  }) async {
    try {
      final result = await _client.poll.castVote(
        pollId,
        optionId,
      );
      return result;
    } on PostException catch (e) {
      throw ServerException(message: e.message);
    } on SocketException catch (_) {
      throw const ServerException(
          message: 'Failed to connect to server. Please try again.');
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<Poll> retrieve({
    required int id,
  }) async {
    try {
      final result = await _client.poll.getPoll(
        id,
      );

      if (result == null) {
        throw const ServerException(
          message: 'Failed to retrieve poll',
        );
      }

      return result;
    } on PostException catch (e) {
      throw ServerException(message: e.message);
    } on SocketException catch (_) {
      throw const ServerException(
          message: 'Failed to connect to server. Please try again.');
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<Poll> save({
    required Poll poll,
  }) async {
    try {
      final result = await _client.poll.savePoll(
        poll,
      );
      if (result == null) {
        throw const ServerException(
          message: 'Failed to save poll',
        );
      }
      return result;
    } on PostException catch (e) {
      throw ServerException(message: e.message);
    }  on SocketException catch (_) {
      throw const ServerException(
          message: 'Failed to connect to server. Please try again.');
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<void> saveInFuture({
    required Poll poll,
    required DateTime scheduledDatetime,
  }) async {
    try {
      return await _client.poll.schedulePoll(
        poll,
        scheduledDatetime,
      );
    } on SocketException catch (_) {
      throw const ServerException(
          message: 'Failed to connect to server. Please try again.');
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<PollList> getPolls({
    required int page,
    required int limit,
  }) async {
    try {
      final result = _client.poll.getPolls(
        limit: limit,
        page: page,
      );
      return result;
    } on PostException catch (e) {
      throw ServerException(message: e.message);
    }  on SocketException catch (_) {
      throw const ServerException(
          message: 'Failed to connect to server. Please try again.');
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<void> toggleLike({
    required int id,
  }) async {
    try {
      return await _client.poll.toggleLike(
        id,
      );
    } on UserException catch (e) {
      throw ServerException(message: e.message);
    } on PostException catch (e) {
      throw ServerException(message: e.message);
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<void> toggleBookmark({
    required int id,
  }) async {
    try {
      return await _client.poll.toggleBookmark(
        id,
      );
    } on UserException catch (e) {
      throw ServerException(message: e.message);
    } on PostException catch (e) {
      throw ServerException(message: e.message);
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<void> markNotInterested({
    required int id,
    required String reason,
  }) async {
    try {
      return await _client.poll.markNotInterested(
        id,
        reason,
      );
    } on UserException catch (e) {
      throw ServerException(message: e.message);
    } on PostException catch (e) {
      throw ServerException(message: e.message);
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<void> deletePoll({required int id}) async {
    try {
      return await _client.poll.deletePoll(id);
    } on UserException catch (e) {
      throw ServerException(message: e.message);
    } on PostException catch (e) {
      throw ServerException(message: e.message);
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }
}
