import 'dart:async';
import 'dart:io';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/errors/exceptions.dart';
import 'package:civic_flutter/core/errors/failure.dart';
import 'package:civic_flutter/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:civic_flutter/features/profile/domain/repository/profile_repository.dart';
import 'package:fpdart/fpdart.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl({required ProfileRemoteDatasource remoteDatasource})
      : _remoteDatasource = remoteDatasource;

  final ProfileRemoteDatasource _remoteDatasource;

  @override
  Future<Either<Failure, UserRecord>> me() async {
    try {
      final result = await _remoteDatasource.me();
      return Right(result);
    } on TimeoutException catch (e) {
      return Left(
        Failure(
          message: e.message ?? 'Request timed out',
        ),
      );
    } on SocketException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }
}
