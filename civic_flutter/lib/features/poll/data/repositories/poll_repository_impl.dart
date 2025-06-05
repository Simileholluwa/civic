import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/poll/poll.dart';
import 'package:fpdart/fpdart.dart';

class PollRepositoryImpl implements PollRepository {
  PollRepositoryImpl({
    required PollRemoteDatasource pollRemoteDatasource,
    required PollLocalDatabase pollLocalDatasource,
  })  : _pollLocalDatasource = pollLocalDatasource,
        _pollRemoteDatasource = pollRemoteDatasource;
  final PollRemoteDatasource _pollRemoteDatasource;
  final PollLocalDatabase _pollLocalDatasource;
  @override
  Future<Either<Failure, void>> castVote({
    required int pollId,
    required int optionId,
  }) async {
    try {
      final result = await _pollRemoteDatasource.castVote(
        pollId: pollId,
        optionId: optionId,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, Poll?>> getPoll({
    required int id,
  }) async {
    try {
      final result = await _pollRemoteDatasource.retrieve(
        id: id,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, Poll?>> savePoll({
    required Poll poll,
  }) async {
    try {
      final result = await _pollRemoteDatasource.save(
        poll: poll,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> schedulePoll({
    required Poll poll,
    required DateTime scheduledDatetime,
  }) async {
    try {
      final result = await _pollRemoteDatasource.saveInFuture(
        poll: poll,
        scheduledDatetime: scheduledDatetime,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> deletePollDraft() async {
    try {
      final result = await _pollLocalDatasource.deletePollDraft();
      return Right(result);
    } on CacheException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, PollList>> getPolls({
    required int page,
    required int limit,
  }) async {
    try {
      final result = await _pollRemoteDatasource.getPolls(
        page: page,
        limit: limit,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, Poll>> getPollDraft() async {
    try {
      final result = await _pollLocalDatasource.getPollDraft();
      return Right(result);
    } on CacheException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> savePollDraft({required Poll poll}) async {
    try {
      final result = await _pollLocalDatasource.savePollDraft(
        poll: poll,
      );
      return Right(result);
    } on CacheException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }
}
