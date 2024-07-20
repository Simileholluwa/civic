
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/features/onboarding/presentation/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPageIndicator extends GetView<OnBoardingController> {
  const OnBoardingPageIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return SmoothPageIndicator(
      controller: controller.state.pageController,
      count: 4,
      effect: ExpandingDotsEffect(
        activeDotColor: TColors.primary,
        dotColor: isDark ? TColors.dark : TColors.light,
        dotHeight: 8,
        dotWidth: 12,
        spacing: 6,
      ),
    );
  }
}
