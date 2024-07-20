import 'package:civic_flutter/core/widgets/app_button.dart';
import 'package:civic_flutter/core//widgets/app_password_field.dart';
import 'package:civic_flutter/features/authentication/presentation/controller/auth_controller.dart';
import 'package:civic_flutter/features/authentication/presentation/widgets/terms_of_use.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/constants/text_strings.dart';
import 'package:civic_flutter/core/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpForm extends GetView<AuthController> {
  const SignUpForm({
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
          AppPasswordTextField(
            textController: controller.state.signupPasswordController,
            validator: TValidator.validatePassword,
            showPassword: true.obs,
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),
          const TermsAndConditions(),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          Obx(
            () => FilledButton(
              onPressed: controller.createAccountRequest,
              child: const Text(
                TTexts.tContinue,
              ),
            ).withLoading(
              loading: controller.state.isLoadingSignUp.value,
            ),
          ),
        ],
      ),
    );
  }
}
