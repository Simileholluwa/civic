import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/image_strings.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/constants/text_strings.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/router/route_names.dart';
import 'package:civic_flutter/core/widgets/android_bottom_nav.dart';
import 'package:civic_flutter/features/onboarding/presentation/states/onboarding_state_entity.dart';
import 'package:civic_flutter/features/onboarding/presentation/providers/onboarding_provider.dart';
import 'package:civic_flutter/features/onboarding/presentation/widgets/political_stats_card.dart';
import 'package:civic_flutter/features/onboarding/presentation/widgets/vector_image_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class InitialOnBoardingScreen extends ConsumerStatefulWidget {
  const InitialOnBoardingScreen({super.key});

  @override
  ConsumerState<InitialOnBoardingScreen> createState() =>
      _InitialOnBoardingScreenState();
}

class _InitialOnBoardingScreenState
    extends ConsumerState<InitialOnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = ref.read(onboardingProvider.notifier);
    ref.listen(onboardingProvider, (_, next) {
      switch (next) {
        case OnboardingStateUserType():
          context.goNamed(
            AppRoutes.onboarding,
            pathParameters: {
              'isPolitical': next.isPolitical.toString(),
            },
          );
        default:
          return;
      }
    });
    return AndroidBottomNav(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(
            bottom: TSizes.sm + 2,
          ),
          child: THelperFunctions.animatedText(
            'Select your political status to continue',
            Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: TColors.primary,
                ),
            TextAlign.center,
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(
            top: TSizes.defaultSpace + 4,
            bottom: TSizes.defaultSpace,
          ),
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const VectorImageContainer(
                imagePath: TImageTexts.initialOnBoardImage,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(
                TTexts.onBoardingTitle1,
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.defaultSpace + 4,
              ),
              PoliticalStatusCard(
                indicatorColor: TColors.primary,
                title: TTexts.onBoardingTitle2,
                subTitle: TTexts.onBoardingSubTitle2,
                onTap: () => controller.navigateToOnBoarding(
                  isPolitical: true,
                ),
              ),
              const SizedBox(
                height: TSizes.defaultSpace + 4,
              ),
              PoliticalStatusCard(
                indicatorColor: TColors.secondary,
                title: TTexts.onBoardingTitle3,
                subTitle: TTexts.onBoardingSubTitle3,
                onTap: () => controller.navigateToOnBoarding(
                  isPolitical: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
