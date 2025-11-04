import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AppDualButton extends StatelessWidget {
  const AppDualButton({
    required this.onTapSkipButton,
    required this.activeButtonText,
    required this.onTapActiveButton,
    required this.activeButtonLoading,
    required this.skipButtonLoading,
    this.activeButtonColor,
    this.skipButtonColor,
    this.skipText = 'Skip',
    super.key,
  });

  final VoidCallback onTapSkipButton;
  final String activeButtonText;
  final VoidCallback? onTapActiveButton;
  final bool activeButtonLoading;
  final bool skipButtonLoading;
  final String skipText;
  final Color? activeButtonColor;
  final Color? skipButtonColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FilledButton(
          onPressed: onTapActiveButton,
          child: Text(
            activeButtonText,
          ),
          style: FilledButton.styleFrom(
            backgroundColor: activeButtonColor ?? TColors.primary,
          ),
        ).withLoading(
          loading: activeButtonLoading,
        ),
        const SizedBox(
          height: TSizes.sm,
        ),
        TextButton(
          onPressed: skipButtonLoading ? null : onTapSkipButton,
          child: skipButtonLoading
              ? LoadingAnimationWidget.progressiveDots(
                  color: TColors.primary,
                  size: 50,
                )
              : Text(
                  skipText,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: skipButtonColor ?? TColors.secondary,
                  ),
                ),
        ),
      ],
    );
  }
}
