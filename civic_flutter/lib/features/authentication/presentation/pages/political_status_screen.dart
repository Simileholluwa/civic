import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/constants/text_strings.dart';
import 'package:civic_flutter/core/widgets/android_bottom_nav.dart';
import 'package:civic_flutter/core/widgets/app_button.dart';
import 'package:civic_flutter/core/widgets/auth_app_bar.dart';
import 'package:civic_flutter/core/widgets/auth_header.dart';
import 'package:civic_flutter/features/authentication/domain/entities/political_status_card_entity.dart';
import 'package:civic_flutter/features/authentication/presentation/controller/auth_controller.dart';
import 'package:civic_flutter/features/authentication/presentation/widgets/political_status_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:iconsax/iconsax.dart';

class PoliticalStatusScreen extends GetView<AuthController> {
  const PoliticalStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AndroidBottomNav(
      child: Scaffold(
        appBar: const AuthAppBar(
          icon: Iconsax.arrow_left_2,
        ),
        body: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(
            left: TSizes.defaultSpace,
            right: TSizes.defaultSpace,
            bottom:
                MediaQuery.of(context).viewInsets.bottom + TSizes.defaultSpace,
            top: TSizes.defaultSpace,
          ),
          children: [
            const AuthHeader(
              authTitle: 'Political status',
              authSubTitle:
                  'Civic will be configured based on your political status',
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            PoliticalStatusOptions(
              politicalStatusCardEntity: PoliticalStatusCardEntity.first(),
            ),
            const SizedBox(
              height: TSizes.md,
            ),
            PoliticalStatusOptions(
              politicalStatusCardEntity: PoliticalStatusCardEntity.second(),
            ),
            const SizedBox(
              height: TSizes.md,
            ),
            PoliticalStatusOptions(
              politicalStatusCardEntity: PoliticalStatusCardEntity.third(),
            ),
            const SizedBox(
              height: TSizes.md,
            ),
            PoliticalStatusOptions(
              politicalStatusCardEntity: PoliticalStatusCardEntity.fourth(),
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            FilledButton(
              onPressed: controller.navigateToChooseUsername,
              child: const Text(
                TTexts.tContinue,
              ),
            ).withLoading(
              loading: controller.state.isLoadingSignUp.value,
            ),
          ],
        ),
      ),
    );
  }
}
