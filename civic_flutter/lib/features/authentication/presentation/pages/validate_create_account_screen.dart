// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/constants/text_strings.dart';
import 'package:civic_flutter/core/widgets/app/app_android_bottom_nav.dart';
import 'package:civic_flutter/core/widgets/auth/auth_app_bar.dart';
import 'package:civic_flutter/core/widgets/auth/auth_header.dart';
import 'package:civic_flutter/core/widgets/app/app_resend_link.dart';
import 'package:civic_flutter/features/authentication/presentation/widgets/validate_create_account_form.dart';

class ValidateCreateAccountScreen extends StatelessWidget {
  const ValidateCreateAccountScreen({
    super.key,
    required this.email,
    required this.password,
    required this.politicalStatus,
    required this.username,
  });

  final String email;
  final String password;
  final int politicalStatus;
  final String username;

  @override
  Widget build(BuildContext context) {
    return AppAndroidBottomNav(
      child: Scaffold(
        appBar: const AuthAppBar(
          icon: Iconsax.arrow_left_2,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: TSizes.defaultSpace,
            right: TSizes.defaultSpace,
            bottom:
                MediaQuery.of(context).viewInsets.bottom + TSizes.defaultSpace,
            top: TSizes.defaultSpace,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AuthHeader(
                authTitle: TTexts.confirmEmail,
                authSubTitle: TTexts.confirmEmailSubTitle,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              ValidateCreateAccountForm(
                email: email,
                password: password,
                politicalStatus: politicalStatus,
                username: username,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              AppResendLink(
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
