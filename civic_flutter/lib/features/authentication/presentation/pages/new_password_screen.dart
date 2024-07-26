// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/widgets/android_bottom_nav.dart';
import 'package:civic_flutter/core/widgets/auth_app_bar.dart';
import 'package:civic_flutter/core/widgets/auth_header.dart';
import 'package:civic_flutter/features/authentication/presentation/widgets/new_password_form.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key, 
    required this.code,
    required this.email,
  });

  final String code;
  final String email;

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
              children: [
                const AuthHeader(
                  authTitle: 'Create new password',
                  authSubTitle: 'Use a combination of alphabets, '
                      'numbers, and symbols',
                ),
                NewPasswordForm(
                  code: code,
                  email: email,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
