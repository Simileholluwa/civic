import 'dart:async';
import 'dart:io';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/errors/exceptions.dart';
import 'package:civic_flutter/core/errors/failure.dart';
import 'package:civic_flutter/features/post/data/datasources/post_remote_database.dart';
import 'package:civic_flutter/features/post/domain/repositories/post_repository.dart';
import 'package:fpdart/fpdart.dart';

class PostRepositoryImpl implements PostRepository {
  PostRepositoryImpl({required PostRemoteDatabaseImpl remoteDatabase})
      : _remoteDatabase = remoteDatabase;
  final PostRemoteDatabaseImpl _remoteDatabase;
  @override
  Future<Either<Failure, Post?>> save({required Post post}) async {
    try {
      final result = await _remoteDatabase.save(post: post);
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
