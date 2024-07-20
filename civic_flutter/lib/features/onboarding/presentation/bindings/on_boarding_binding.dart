
import 'package:civic_flutter/features/onboarding/data/datasources/local_database.dart';
import 'package:civic_flutter/features/onboarding/data/repositories/onboarding_repository_impl.dart';
import 'package:civic_flutter/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:civic_flutter/features/onboarding/domain/usecases/cache_first_timer_usecase.dart';
import 'package:civic_flutter/features/onboarding/presentation/controller/onboarding_controller.dart';
import 'package:get/get.dart';

class OnBoardingBinding implements Bindings {
  @override
  void dependencies() {
    Get
      ..put(
        OnboardingLocalDatabaseImpl(),
      )
      ..put<OnboardingRepository>(
        OnboardingRepositoryImpl(
          onboardingLocalDatabase: Get.find(),
        ),
      )
      ..put(
        CacheFirstTimerUseCase(
          onboardingRepository: Get.find(),
        ),
      )
      ..put(
        OnBoardingController(
          cacheFirstTimerUseCase: Get.find(),
        ),
      );
  }
}
