import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/widgets/pulsing_circle.dart';
import 'package:civic_flutter/core/widgets/dual_button.dart';
import 'package:flutter/material.dart';

Future<bool?> postDialog({
  required BuildContext context,
  required String title,
  required String description,
  required VoidCallback onTapSkipButton,
  required String activeButtonText,
  required bool activeButtonLoading,
  required bool skipButtonLoading,
  required VoidCallback onTapActiveButton,
  required String skipText,
}) {
  return showModalBottomSheet<bool>(
      barrierColor: Theme.of(context).scaffoldBackgroundColor.withAlpha(
            30,
          ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      context: context,
      builder: (context) {
        return SizedBox(
          height: 420,
          child: Center(
            child: Material(
              elevation: 4,
              type: MaterialType.transparency,
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.md,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.only(
                topRight: Radius.circular(TSizes.lg,),
                topLeft: Radius.circular(TSizes.lg,),
              ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: TSizes.sm + 2,
                      ),
                      const SizedBox(
                        height: 110,
                        child: Center(
                          child: PulsingCircle(),
                        ),
                      ),
                      const SizedBox(
                        height: TSizes.sm + 2,
                      ),
                      const Divider(
                        indent: TSizes.md,
                        endIndent: TSizes.md + 4,
                      ),
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
                        skipText: skipText,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      });
}
