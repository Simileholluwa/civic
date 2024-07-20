import 'package:civic_flutter/core/widgets/android_bottom_nav.dart';
import 'package:civic_flutter/core/widgets/auth_app_bar.dart';
import 'package:civic_flutter/core/widgets/auth_header.dart';
import 'package:civic_flutter/features/authentication/presentation/controller/auth_controller.dart';
import 'package:civic_flutter/features/authentication/presentation/widgets/reset_password_form.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ResetPasswordScreen extends GetView<AuthController> {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: AndroidBottomNav(
        child: Scaffold(
          appBar: AuthAppBar(
            icon: Iconsax.arrow_left_2,
            canGoBack: false,
            goBack: () => Get.back(
              id: 1,
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(
              TSizes.defaultSpace,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AuthHeader(
                  authTitle: TTexts.forgetPassword,
                  authSubTitle: TTexts.forgetPasswordSubTitle,
                ),
                Form(
                  key: controller.state.formKeyResetPassword,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: const ResetPasswordForm(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
