import 'package:civic_flutter/core/widgets/app_text_field.dart';
import 'package:civic_flutter/features/authentication/presentation/controller/auth_controller.dart';
import 'package:civic_flutter/features/authentication/presentation/widgets/dual_button.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/constants/text_strings.dart';
import 'package:civic_flutter/core/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NinForm extends GetView<AuthController> {
  const NinForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: TSizes.spaceBtwSections,
      ),
      child: Column(
        children: [
          AppTextField(
            textController: controller.state.ninController,
            hintText: 'National Identification Number',
            validator: TValidator.validateNin,
            textInputType: TextInputType.number,
            iconSize: 22,
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          DualButton(
            onTapSkipButton: controller.navigateToMenu,
            activeButtonText: TTexts.tContinue,
            onTapActiveButton: controller.searchNinRecord,
            activeButtonLoading: controller.state.isLoadingSearchNin,
            skipButtonLoading: false.obs,
          ),
        ],
      ),
    );
  }
}
