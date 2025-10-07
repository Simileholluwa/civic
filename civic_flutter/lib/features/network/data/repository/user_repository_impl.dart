import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/network/network.dart';
import 'package:fpdart/fpdart.dart';

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl({
    required UserRemoteDatasource remoteDatasource,
  }) : _remoteDatasource = remoteDatasource;

  final UserRemoteDatasource _remoteDatasource;
  @override
  Future<Either<Failure, void>> toggleFollow({required int userId}) async {
    try {
      final result = await _remoteDatasource.toggleFollow(
        userId: userId,
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
  Future<Either<Failure, UserRecord>> getUser({
    required int? userId,
  }) async {
    try {
      final result = await _remoteDatasource.getUser(
        userId: userId,
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
