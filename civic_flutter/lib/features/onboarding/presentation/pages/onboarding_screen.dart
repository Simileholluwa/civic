
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/widgets/android_bottom_nav.dart';
import 'package:civic_flutter/features/onboarding/domain/entities/onboarding_entity.dart';
import 'package:civic_flutter/features/onboarding/presentation/controller/onboarding_controller.dart';
import 'package:civic_flutter/features/onboarding/presentation/widgets/next_button.dart';
import 'package:civic_flutter/features/onboarding/presentation/widgets/onboarding_page_indicator.dart';
import 'package:civic_flutter/features/onboarding/presentation/widgets/onboarding_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class OnBoardingScreen extends GetView<OnBoardingController> {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isPolitical = Get.arguments as bool;
    return AndroidBottomNav(
      child: Scaffold(
        floatingActionButton: const OnBoardingNextButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          leading: IconButton(
            onPressed: controller.goBack,
            icon: const Icon(
              Iconsax.arrow_left_2,
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(
                right: TSizes.md + 4,
              ),
              child: OnBoardingPageIndicator(),
            ),
          ],
        ),
        body: PageView(
          controller: controller.state.pageController,
          onPageChanged: (int index) =>
              controller.state.currentPage.value = index,
          physics: const ClampingScrollPhysics(),
          children: [
            OnBoardingPageView(
              onboardingEntity: isPolitical
                  ? OnboardingEntity.firstCitizen()
                  : OnboardingEntity.firstPolitical(),
            ),
            OnBoardingPageView(
              onboardingEntity: isPolitical
                  ? OnboardingEntity.secondCitizen()
                  : OnboardingEntity.secondPolitical(),
            ),
            OnBoardingPageView(
              onboardingEntity: isPolitical
                  ? OnboardingEntity.thirdCitizen()
                  : OnboardingEntity.thirdPolitical(),
            ),
            OnBoardingPageView(
              onboardingEntity: isPolitical
                  ? OnboardingEntity.fourthCitizen()
                  : OnboardingEntity.fourthPolitical(),
            ),
          ],
        ),
      ),
    );
  }
}
