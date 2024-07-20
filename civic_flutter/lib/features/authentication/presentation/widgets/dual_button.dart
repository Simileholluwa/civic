
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/widgets/app_button.dart';
import 'package:civic_flutter/features/authentication/presentation/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class DualButton extends GetView<AuthController> {
  const DualButton({
    required this.onTapSkipButton,
    required this.activeButtonText,
    required this.onTapActiveButton,
    required this.activeButtonLoading,
    required this.skipButtonLoading,
    super.key,
  });

  final VoidCallback onTapSkipButton;
  final String activeButtonText;
  final VoidCallback onTapActiveButton;
  final RxBool activeButtonLoading;
  final RxBool skipButtonLoading;

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
            child: Obx(
              () => GestureDetector(
                onTap: skipButtonLoading.isTrue ? null : onTapSkipButton,
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: TSizes.md,
                      ),
                      child: skipButtonLoading.isTrue
                          ? LoadingAnimationWidget.prograssiveDots(
                              color: TColors.primary,
                              size: 50,
                            )
                          : Text(
                              'Skip',
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
          ),
          Expanded(
            flex: 2,
            child: Obx(
              () => FilledButton(
                onPressed: onTapActiveButton,
                child: Text(
                  activeButtonText,
                ),
              ).withLoading(
                loading: activeButtonLoading.value,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
