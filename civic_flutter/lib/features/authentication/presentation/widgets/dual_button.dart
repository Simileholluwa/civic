import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class DualButton extends StatelessWidget {
  const DualButton({
    required this.onTapSkipButton,
    required this.activeButtonText,
    required this.onTapActiveButton,
    required this.activeButtonLoading,
    required this.skipButtonLoading,
    this.skipText = 'Skip',
    super.key,
  });

  final VoidCallback onTapSkipButton;
  final String activeButtonText;
  final VoidCallback onTapActiveButton;
  final bool activeButtonLoading;
  final bool skipButtonLoading;
  final String skipText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color:
            THelperFunctions.isDarkMode(context) ? TColors.dark : TColors.light,
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: skipButtonLoading == true ? null : onTapSkipButton,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: TSizes.md,
                    ),
                    child: skipButtonLoading == true
                        ? LoadingAnimationWidget.prograssiveDots(
                            color: TColors.primary,
                            size: 50,
                          )
                        : Text(
                            skipText,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: THelperFunctions.isDarkMode(context)
                                  ? TColors.textWhite
                                  : TColors.dark,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: FilledButton(
              onPressed: onTapActiveButton,
              child: Text(
                activeButtonText,
              ),
            ).withLoading(
              loading: activeButtonLoading,
            ),
          ),
        ],
      ),
    );
  }
}
