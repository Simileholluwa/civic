
import 'package:civic_flutter/core/errors/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class OnboardingRepository {
  Future<Either<Failure, void>> cacheFirstTimer();
}