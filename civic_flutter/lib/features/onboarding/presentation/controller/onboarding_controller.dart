
import 'package:civic_flutter/core/router/route_names.dart';
import 'package:civic_flutter/core/toasts_messages/toast_messages.dart';
import 'package:civic_flutter/core/usecases/usecase.dart';
import 'package:civic_flutter/features/onboarding/domain/usecases/cache_first_timer_usecase.dart';
import 'package:civic_flutter/features/onboarding/presentation/states/onboarding_state.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  OnBoardingController({
    required CacheFirstTimerUseCase cacheFirstTimerUseCase,
  }) : _cacheFirstTimerUseCase = cacheFirstTimerUseCase;
  final CacheFirstTimerUseCase _cacheFirstTimerUseCase;

  final state = OnBoardingState();

  @override
  void onReady() {
    super.onReady();
    FlutterNativeSplash.remove();
  }

  void toOnBoarding({required bool isPolitical}) {
    Get.toNamed<dynamic>(
      AppRoutes.onboarding,
      arguments: isPolitical,
    );
  }

  void navigateToAuthentication() {
    Get.offAllNamed<dynamic>(AppRoutes.authLandingScreen);
  }

  void goBack() {
    Get.back();
    state.currentPage.value = 0;
  }

  Future<void> cacheFirstTimer() async {
    final result = await _cacheFirstTimerUseCase(
      NoParams(),
    );
    result.fold(
      (l) => TToastMessages.errorToast(l.message),
      (r) => navigateToAuthentication(),
    );
  }
}
