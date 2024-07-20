import 'package:civic_flutter/core/widgets/app_button.dart';
import 'package:civic_flutter/core/widgets/app_password_field.dart';
import 'package:civic_flutter/features/authentication/presentation/controller/auth_controller.dart';
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/constants/text_strings.dart';
import 'package:civic_flutter/core/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForm extends GetView<AuthController> {
  const LoginForm({
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
            textController: controller.state.loginPasswordController,
            validator: (value) =>
                TValidator.validateEmptyText('Password', value),
            showPassword: true.obs,
            hintText: 'Enter your password',
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: controller.navigateToResetPassword,
                child: Text(
                  'Forgot password?',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: TColors.primary,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          Obx(
            () => FilledButton(
              onPressed: () => controller.signInWithEmailAndPassword(),
              child: const Text(
                TTexts.signIn,
              ),
            ).withLoading(
              loading: controller.state.isLoadingSignIn.value,
            ),
          ),
        ],
      ),
    );
  }
}
