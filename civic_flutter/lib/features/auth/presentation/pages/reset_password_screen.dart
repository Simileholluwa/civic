import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return AppAndroidBottomNav(
      child: Scaffold(
        appBar: const AuthAppBar(
          icon: Iconsax.arrow_left_2,
        ),
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          padding: EdgeInsets.only(
            left: TSizes.defaultSpace,
            right: TSizes.defaultSpace,
            bottom:
                MediaQuery.of(context).viewInsets.bottom + TSizes.defaultSpace,
            top: TSizes.defaultSpace,
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AuthHeader(
                authTitle: TTexts.forgetPassword,
                authSubTitle: TTexts.forgetPasswordSubTitle,
              ),
              ResetPasswordForm(),
            ],
          ),
        ),
      ),
    );
  }
}
