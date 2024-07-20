
import 'package:civic_flutter/core/errors/failure.dart';
import 'package:civic_flutter/core/usecases/usecase.dart';
import 'package:civic_flutter/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:fpdart/fpdart.dart';

class CacheFirstTimerUseCase implements UseCase<void, NoParams> {
  const CacheFirstTimerUseCase(
      {required OnboardingRepository onboardingRepository,})
      : _onboardingRepository = onboardingRepository;
  final OnboardingRepository _onboardingRepository;

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    final result = await _onboardingRepository.cacheFirstTimer();
    return result;
  }
}
