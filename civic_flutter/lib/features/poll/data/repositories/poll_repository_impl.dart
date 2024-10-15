import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/errors/exceptions.dart';
import 'package:civic_flutter/core/errors/failure.dart';
import 'package:civic_flutter/features/poll/data/datasources/poll_remote_datasource.dart';
import 'package:civic_flutter/features/poll/domain/repositories/poll_repository.dart';
import 'package:fpdart/fpdart.dart';

class PollRepositoryImpl implements PollRepository {
  PollRepositoryImpl({
    required PollRemoteDatasource pollRemoteDatasource,
  }) : _pollRemoteDatasource = pollRemoteDatasource;
  final PollRemoteDatasource _pollRemoteDatasource;
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
  Future<Either<Failure, Poll?>> retrieve({
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
  Future<Either<Failure, Poll?>> save({
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
  Future<Either<Failure, void>> saveInFuture({required Poll poll, required DateTime scheduledDatetime,}) async {
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

}
