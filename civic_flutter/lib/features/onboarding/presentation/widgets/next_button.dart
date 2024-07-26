
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/features/onboarding/presentation/providers/onboarding_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: TSizes.md,
            vertical: TSizes.sm,
          ),
          child: SizedBox(
            width: double.maxFinite,
            height: 70,
            child: FilledButton(
              onPressed: () => ref.read(onboardingProvider.notifier).cacheFirstTimer(),
              child: const Center(
                child: Text(
                  'Get started',
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
