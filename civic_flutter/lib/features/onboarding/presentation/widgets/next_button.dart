import 'package:civic_flutter/core/core.dart';
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
        child:
            FilledButton(
              onPressed: () async {
                await context.push(
                  '/onboarding/allowNotifications',
                );
              },
              child: const Center(
                child: Text(
                  TTexts.tContinue,
                ),
              ),
            ).withLoading(
              loading: false,
            ),
      ),
    );
  }
}
