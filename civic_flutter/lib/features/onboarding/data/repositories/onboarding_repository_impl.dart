import 'package:civic_flutter/core/errors/failure.dart';
import 'package:civic_flutter/features/onboarding/data/datasources/local_database.dart';
import 'package:civic_flutter/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:fpdart/fpdart.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  const OnboardingRepositoryImpl({
    required OnboardingLocalDatabaseImpl onboardingLocalDatabase,
  }) : _localDatabase = onboardingLocalDatabase;
  final OnboardingLocalDatabaseImpl _localDatabase;
  @override
  Future<Either<Failure, void>> cacheFirstTimer() async {
    try {
      final result = await _localDatabase.cacheFirstTimer();
      return Right(result);
    } catch (e) {
      return Left(
        Failure(
          message: e.toString(),
        ),
      );
    }
  }
}
