import 'package:civic_flutter/features/authentication/presentation/controller/auth_controller.dart';
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsAndConditions extends GetView<AuthController> {
  const TermsAndConditions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(
            () => Checkbox(
              value: controller.state.acceptTerms.value,
              onChanged: (value) {
                controller.state.acceptTerms.value =
                    value!;
              },
            ),
          ),
        ),
        const SizedBox(
          width: TSizes.sm,
        ),
        Flexible(
          child: Text.rich(
            maxLines: 3,
            softWrap: true,
            TextSpan(
              children: [
                TextSpan(
                  text: '${TTexts.iAgreeTo} ',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                TextSpan(
                  text: TTexts.privacyPolicy,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: TColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                TextSpan(
                  text: ' ${TTexts.and} ',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                TextSpan(
                  text: TTexts.termsOfUse,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: TColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
