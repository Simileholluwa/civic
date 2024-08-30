import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/widgets/pulsing_circle.dart';
import 'package:civic_flutter/features/authentication/presentation/widgets/dual_button.dart';
import 'package:flutter/material.dart';

Future<Widget?> postDialog({
  required BuildContext context,
  required String title,
  required String description,
  required VoidCallback onTapSkipButton,
  required String activeButtonText,
  required bool activeButtonLoading,
  required bool skipButtonLoading,
  required VoidCallback onTapActiveButton,
}) {
  return showDialog<Widget>(
      barrierColor: Theme.of(context).scaffoldBackgroundColor.withAlpha(
            10,
          ),
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Align(
          child: Material(
            elevation: 4,
            type: MaterialType.transparency,
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(
                  TSizes.lg,
                ),
                border: Border.all(
                  color: Theme.of(context).dividerColor,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 110,
                    child: Center(
                      child: PulsingCircle(),
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.sm + 2,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: TSizes.sm,
                  ),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                  ),
                  const SizedBox(
                    height: TSizes.sm,
                  ),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  DualButton(
                    onTapActiveButton: onTapActiveButton,
                    activeButtonText: activeButtonText,
                    activeButtonLoading: activeButtonLoading,
                    onTapSkipButton: onTapSkipButton,
                    skipButtonLoading: skipButtonLoading,
                    skipText: 'Cancel',
                  ),
                  const SizedBox(
                    height: TSizes.sm + 2,
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
