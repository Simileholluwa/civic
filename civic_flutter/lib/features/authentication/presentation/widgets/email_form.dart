
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/constants/text_strings.dart';
import 'package:civic_flutter/core/validators/validation.dart';
import 'package:civic_flutter/core/widgets/app_button.dart';
import 'package:civic_flutter/core/widgets/app_text_field.dart';
import 'package:civic_flutter/features/authentication/presentation/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class EmailForm extends GetView<AuthController> {
  const EmailForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: TSizes.spaceBtwSections,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextField(
            textController: controller.state.emailController,
            prefixIcon: Iconsax.message,

            hintText: 'your-email@domain.com',
            validator: TValidator.validateEmail,
            textInputType: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          Obx(
            () => FilledButton(
              onPressed: controller.checkIfNewUser,
              child: const Text(
                TTexts.tContinue,
              ),
            ).withLoading(
              loading: controller.state.isLoadingCheckUser.value,
            ),
          ),
        ],
      ),
    );
  }
}
