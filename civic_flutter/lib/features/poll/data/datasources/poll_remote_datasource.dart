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
    required String option,
  });
  Future<PollList> getPolls({
    required int page,
    required int limit,
  });
}

class PollRemoteDatasourceImpl implements PollRemoteDatasource {
  PollRemoteDatasourceImpl({
    required Client client,
  }) : _client = client;
  final Client _client;
  @override
  Future<void> castVote({
    required int pollId,
    required String option,
  }) async {
    try {
      final isConnected = await TDeviceUtils.hasInternetConnection();
      if (!isConnected) {
        throw const ServerException(
          message: 'You are not connected to the internet.',
        );
      }
      final result = await _client.poll.castVote(
        pollId, option,
      );
      return result;
    } on SocketException catch (_) {
      throw const ServerException(message: 'Failed to connect to server. Please try again.');
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
      final isConnected = await TDeviceUtils.hasInternetConnection();
      if (!isConnected) {
        throw const ServerException(
          message: 'You are not connected to the internet.',
        );
      }
      final result = await _client.poll.getPoll(
        id,
      );

      if (result == null) {
        throw const ServerException(
          message: 'Failed to retrieve poll',
        );
      }

      return result;
    } on SocketException catch (_) {
      throw const ServerException(message: 'Failed to connect to server. Please try again.');
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
      final isConnected = await TDeviceUtils.hasInternetConnection();
      if (!isConnected) {
        throw const ServerException(
          message: 'You are not connected to the internet.',
        );
      }
      final result = await _client.poll.savePoll(
        poll,
      );
      if (result == null) {
        throw const ServerException(
          message: 'Failed to save poll',
        );
      }
      return result;
    } on SocketException catch (_) {
      throw const ServerException(message: 'Failed to connect to server. Please try again.');
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }
  
  @override
  Future<void> saveInFuture({required Poll poll, required DateTime scheduledDatetime,}) async {
    try {
      final isConnected = await TDeviceUtils.hasInternetConnection();
      if (!isConnected) {
        throw const ServerException(
          message: 'You are not connected to the internet.',
        );
      }
      return await _client.poll.schedulePoll(
        poll,
        scheduledDatetime,
      );
      
    } on SocketException catch (_) {
      throw const ServerException(message: 'Failed to connect to server. Please try again.');
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
      final isConnected = await TDeviceUtils.hasInternetConnection();
      if (!isConnected) {
        throw const ServerException(
          message: 'You are not connected to the internet.',
        );
      }
      final result = _client.poll.getPolls(
        limit: limit,
        page: page,
      );
      return result;
    } on SocketException catch (_) {
      throw const ServerException(message: 'Failed to connect to server. Please try again.');
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }
}
