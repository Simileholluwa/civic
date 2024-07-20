import 'package:civic_flutter/core/widgets/app_button.dart';
import 'package:civic_flutter/features/authentication/presentation/controller/auth_controller.dart';
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class VerifyNinEmailOTP extends GetView<AuthController> {
  const VerifyNinEmailOTP({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Pinput(
          length: 6,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          controller: controller.state.ninEmailPinController,
          validator: TValidator.validateOTP,
          obscureText: true,
          obscuringWidget: const Icon(
            Icons.circle,
            size: 15,
          ),
          errorTextStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
          defaultPinTheme: PinTheme(
            width: 60,
            height: 60,
            textStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.w900,
                ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isDark ? TColors.dark : TColors.light,
            ),
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        Obx(
          () => FilledButton(
            onPressed: (){},
            child: const Text(
              'Confirm OTP',
            ),
          ).withLoading(
            loading: controller.state.isLoadingVerifyEmailCode.value,
          ),
        ),
      ],
    );
  }
}
