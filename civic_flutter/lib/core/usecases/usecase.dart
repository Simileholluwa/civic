// ignore_for_file: one_member_abstracts

import 'package:civic_flutter/core/errors/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class UseCase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}

abstract interface class NotFutureUseCase<SuccessType, Params> {
  Either<Failure, SuccessType> call(Params params);
}

abstract interface class ServerUseCase<SuccessType, Params> {
  Future<Either<Error, SuccessType>> call(Params params);
}

abstract interface class StringUseCase<SuccessType, Params> {
  Future<Either<String, SuccessType>> call(Params params);
}

class Params {
  Params(this.data);
  final dynamic data;
}

class NoParams {}
