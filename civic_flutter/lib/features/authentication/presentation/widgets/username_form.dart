import 'package:civic_flutter/core/widgets/app_text_field.dart';
import 'package:civic_flutter/features/authentication/presentation/controller/auth_controller.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/constants/text_strings.dart';
import 'package:civic_flutter/core/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UsernameForm extends GetView<AuthController> {
  const UsernameForm({
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
            textController: controller.state.usernameController,
            prefixIcon: Iconsax.user,

            hintText: 'Enter a unique username',
            validator: (value) => TValidator.validateUsername(
              value!.toLowerCase(),
              controller.state.usernames,
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          SizedBox(
            height: 60,
            width: double.maxFinite,
            child: FilledButton(
              onPressed: controller.navigateToSignUp,
              child: const Text(
                TTexts.tContinue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
