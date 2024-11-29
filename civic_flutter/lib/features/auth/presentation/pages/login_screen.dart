// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
    required this.email,
    required this.username,
  });
  final String email;
  final String username;

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
              AuthHeader(
                authTitle: username == '' ? 'Hi there' : 'Hi $username',
                authSubTitle: 'Provide the password to your account.',
              ),
              LoginForm(
                email: email,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
