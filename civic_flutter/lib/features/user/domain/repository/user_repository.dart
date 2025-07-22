import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:fpdart/fpdart.dart';

abstract class UserRepository {
  Future<Either<Failure, void>> toggleFollow({required int userId,});
  Future<Either<Failure, UserRecord>> getUser({
    required int? userId,
  });
}