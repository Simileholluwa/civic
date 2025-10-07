import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPageIndicator extends StatelessWidget {
  const OnBoardingPageIndicator({
    required this.pageController,
    super.key,
  });
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: pageController,
      count: 4,
      effect: ExpandingDotsEffect(
        activeDotColor: TColors.primary,
        dotColor: Theme.of(context).cardColor,
        dotHeight: 8,
        dotWidth: 12,
        spacing: 6,
      ),
    );
  }
}
