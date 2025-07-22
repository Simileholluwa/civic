import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/router/route_names.dart';
import 'package:civic_flutter/features/onboarding/presentation/providers/onboarding_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: TSizes.md,
          vertical: TSizes.xs,
        ),
        child: SizedBox(
          width: double.maxFinite,
          height: 55,
          child: FilledButton(
            onPressed: () {
              ref.read(onboardingProvider.notifier).cacheFirstTimer();
              context.go(
                AppRoutes.auth,
              );
            },
            child: const Center(
              child: Text(
                'Get started',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
