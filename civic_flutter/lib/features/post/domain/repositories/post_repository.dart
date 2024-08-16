import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/errors/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class PostRepository {
  Future<Either<Failure, Post?>> save({required Post post});
}
