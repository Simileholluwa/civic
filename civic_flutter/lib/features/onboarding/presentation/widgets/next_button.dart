
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/features/onboarding/presentation/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class OnBoardingNextButton extends GetView<OnBoardingController> {
  const OnBoardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: TSizes.md,
        vertical: TSizes.sm,
      ),
      child: SizedBox(
        width: double.maxFinite,
        height: 70,
        child: FilledButton(
          onPressed: controller.cacheFirstTimer,
          child: const Center(
            child: Text(
              'Get started',
            ),
          ),
        ),
      ),
    );
  }
}
