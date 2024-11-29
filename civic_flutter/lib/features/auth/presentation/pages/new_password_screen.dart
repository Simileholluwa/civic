import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({
    super.key,
    required this.code,
    required this.email,
  });

  final String code;
  final String email;

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
    );
  }
}
