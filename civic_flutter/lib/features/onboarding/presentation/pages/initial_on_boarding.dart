import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/image_strings.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/constants/text_strings.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/router/route_names.dart';
import 'package:civic_flutter/core/widgets/app/app_android_bottom_nav.dart';
import 'package:civic_flutter/features/onboarding/presentation/widgets/political_stats_card.dart';
import 'package:civic_flutter/features/onboarding/presentation/widgets/vector_image_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InitialOnBoardingScreen extends StatelessWidget {
  const InitialOnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppAndroidBottomNav(
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
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 30,),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.defaultSpace + 4,
              ),
              PoliticalStatusCard(
                indicatorColor: TColors.primary,
                title: TTexts.onBoardingTitle2,
                subTitle: TTexts.onBoardingSubTitle2,
                onTap: () {
                  context.pushNamed(
                    AppRoutes.onboarding,
                    extra: {
                      'isPolitical': true,
                    },
                  );
                },
              ),
              const SizedBox(
                height: TSizes.defaultSpace + 4,
              ),
              PoliticalStatusCard(
                indicatorColor: TColors.secondary,
                title: TTexts.onBoardingTitle3,
                subTitle: TTexts.onBoardingSubTitle3,
                onTap: () => context.pushNamed(
                  AppRoutes.onboarding,
                  extra: {
                    'isPolitical': false,
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
