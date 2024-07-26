
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';

class OnBoardingPageIndicator extends StatelessWidget {
  const OnBoardingPageIndicator({
    super.key,
    required this.pageController,
  });
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return SmoothPageIndicator(
      controller: pageController,
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
