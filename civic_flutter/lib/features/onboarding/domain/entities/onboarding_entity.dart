import 'package:civic_flutter/core/constants/image_strings.dart';
import 'package:civic_flutter/core/constants/text_strings.dart';

class OnboardingEntity {
  OnboardingEntity({
    required this.title,
    required this.subTitle,
    required this.image,
  });

  OnboardingEntity.firstCitizen() : this (
    image: TImageTexts.onBoardingImage4,
    title: TTexts.onBoardingTitle4,
    subTitle: TTexts.onBoardingSubTitle4,
  );

  OnboardingEntity.secondCitizen() : this (
    image: TImageTexts.onBoardingImage5,
    title: TTexts.onBoardingTitle5,
    subTitle: TTexts.onBoardingSubTitle5,
  );

  OnboardingEntity.thirdCitizen() : this (
    image: TImageTexts.onBoardingImage6,
    title: TTexts.onBoardingTitle6,
    subTitle: TTexts.onBoardingSubTitle6,
  );

  OnboardingEntity.fourthCitizen() : this (
    image: TImageTexts.onBoardingImage7,
    title: TTexts.onBoardingTitle7,
    subTitle: TTexts.onBoardingSubTitle7,
  );

  OnboardingEntity.firstPolitical() : this (
    image: TImageTexts.onBoardingImage8,
    title: TTexts.onBoardingTitle8,
    subTitle: TTexts.onBoardingSubTitle8,
  );

  OnboardingEntity.secondPolitical() : this (
    image: TImageTexts.onBoardingImage9,
    title: TTexts.onBoardingTitle9,
    subTitle: TTexts.onBoardingSubTitle9,
  );

  OnboardingEntity.thirdPolitical() : this (
    image: TImageTexts.onBoardingImage10,
    title: TTexts.onBoardingTitle10,
    subTitle: TTexts.onBoardingSubTitle10,
  );

  OnboardingEntity.fourthPolitical() : this (
    image: TImageTexts.onBoardingImage7,
    title: TTexts.onBoardingTitle7,
    subTitle: TTexts.onBoardingSubTitle11,
  );

  final String title;
  final String subTitle;
  final String image;
}

