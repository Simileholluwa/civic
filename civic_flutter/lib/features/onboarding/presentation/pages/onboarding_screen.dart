// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/widgets/android_bottom_nav.dart';
import 'package:civic_flutter/features/onboarding/domain/entities/onboarding_entity.dart';
import 'package:civic_flutter/features/onboarding/presentation/widgets/next_button.dart';
import 'package:civic_flutter/features/onboarding/presentation/widgets/onboarding_page_indicator.dart';
import 'package:civic_flutter/features/onboarding/presentation/widgets/onboarding_page_view.dart';

class OnBoardingScreen extends ConsumerStatefulWidget {
  const OnBoardingScreen({
    super.key,
    required this.isPolitical,
  });
  final String isPolitical;

  @override
  ConsumerState<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends ConsumerState<OnBoardingScreen> {
  var _currentPage = 0;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final isPolitical = widget.isPolitical == 'true' ? true : false;
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
                pageController: _pageController,
              ),
            ),
          ],
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (int index) {
            setState(() {
              _currentPage = index;
            });
          },
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
