// ignore_for_file: one_member_abstracts

import 'package:civic_flutter/core/errors/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class OnboardingRepository {
  Future<Either<Failure, void>> cacheFirstTimer();
}