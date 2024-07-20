
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/constants/text_strings.dart';
import 'package:civic_flutter/features/authentication/presentation/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ResendLink extends GetView<AuthController> {
  const ResendLink({
    required this.onTap,
    super.key,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Text(
            TTexts.notReceived,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).hintColor,
                  fontSize: 17,
                ),
          ),
        ),
        const SizedBox(
          width: TSizes.xs,
        ),
        Obx(
          () => controller.state.canRetry.isTrue
              ? controller.state.isLoadingVerifyEmail.isTrue
                  ? LoadingAnimationWidget.discreteCircle(
                      color: TColors.primary,
                      size: 15,
                    )
                  : GestureDetector(
                      onTap: onTap,
                      child: Text(
                        TTexts.resendEmail,
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: TColors.primary,
                                  fontSize: 17,
                                ),
                      ),
                    )
              : Text(
                  'Resend in ${controller.state.time.value}.',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).hintColor,
                        fontSize: 17,
                      ),
                ),
        ),
      ],
    );
  }
}
