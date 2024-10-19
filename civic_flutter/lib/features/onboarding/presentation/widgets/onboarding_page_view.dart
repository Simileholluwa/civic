
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/widgets/app/app_decoration_dot.dart';
import 'package:civic_flutter/features/onboarding/domain/entities/onboarding_entity.dart';
import 'package:civic_flutter/features/onboarding/presentation/widgets/vector_image_container.dart';
import 'package:flutter/material.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({
    required this.onboardingEntity,
    super.key,
  });
  final OnboardingEntity onboardingEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: TSizes.defaultSpace,
        right: TSizes.defaultSpace,
        top: TSizes.defaultSpace + 30,
      ),
      child: Column(
        children: [
          VectorImageContainer(imagePath: onboardingEntity.image),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                onboardingEntity.title,
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                width: 3,
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: TSizes.md + 10,
                ),
                child: AppDecorationDot(),
              ),
            ],
          ),
          const SizedBox(
            height: TSizes.sm,
          ),
          Text(
            onboardingEntity.subTitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
            maxLines: 4,
          ),
        ],
      ),
    );
  }
}
