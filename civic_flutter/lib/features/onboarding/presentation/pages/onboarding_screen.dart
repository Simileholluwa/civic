import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/widgets/android_bottom_nav.dart';
import 'package:civic_flutter/features/onboarding/domain/entities/onboarding_entity.dart';
import 'package:civic_flutter/features/onboarding/presentation/widgets/next_button.dart';
import 'package:civic_flutter/features/onboarding/presentation/widgets/onboarding_page_indicator.dart';
import 'package:civic_flutter/features/onboarding/presentation/widgets/onboarding_page_view.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({
    super.key,
    required this.isPolitical,
  });
  final bool isPolitical;

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();
    return AndroidBottomNav(
      child: Scaffold(
        floatingActionButton: const OnBoardingNextButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          leading: IconButton(
            onPressed: context.pop,
            icon: const Icon(
              Iconsax.arrow_left_2,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                right: TSizes.md + 4,
              ),
              child: OnBoardingPageIndicator(
                pageController: pageController,
              ),
            ),
          ],
        ),
        body: PageView(
          controller: pageController,
          physics: const ClampingScrollPhysics(),
          children: [
            OnBoardingPageView(
              onboardingEntity: isPolitical
                  ? OnboardingEntity.firstPolitical()
                  : OnboardingEntity.firstCitizen(),
            ),
            OnBoardingPageView(
              onboardingEntity: isPolitical
                  ? OnboardingEntity.secondPolitical()
                  : OnboardingEntity.secondCitizen(),
            ),
            OnBoardingPageView(
              onboardingEntity: isPolitical
                  ? OnboardingEntity.thirdPolitical()
                  : OnboardingEntity.thirdCitizen(),
            ),
            OnBoardingPageView(
              onboardingEntity: isPolitical
                  ? OnboardingEntity.fourthPolitical()
                  : OnboardingEntity.fourthCitizen(),
            ),
          ],
        ),
      ),
    );
  }
}
