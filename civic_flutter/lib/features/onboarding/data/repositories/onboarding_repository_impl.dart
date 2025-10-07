import 'package:civic_flutter/core/errors/failure.dart';
import 'package:civic_flutter/features/onboarding/data/datasources/local_database.dart';
import 'package:civic_flutter/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:fpdart/fpdart.dart';

class OnboardingRepositoryImpl extends OnboardingRepository {
  OnboardingRepositoryImpl({
    required OnboardingLocalDatabaseImpl localDatabase,
  }) : _localDatabase = localDatabase;
  final OnboardingLocalDatabaseImpl _localDatabase;
  @override
  Future<Either<Failure, void>> cacheFirstTimer() async {
    try {
      final result = await _localDatabase.cacheFirstTimer();
      return Right(result);
    } on Exception catch (e) {
      return Left(
        Failure(
          message: e.toString(),
        ),
      );
    }
  }
}
