// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';

class CreateAccountRequestScreen extends StatelessWidget {
  const CreateAccountRequestScreen({
    super.key,
    required this.email,
    required this.username,
    required this.politicalStatus,
  });

  final String email;
  final String username;
  final int politicalStatus;

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
                authTitle: 'Create password',
                authSubTitle: 'Use a combination of alphabets, '
                    'numbers, and symbols.',
              ),
              CreateAccountRequestForm(
                email: email,
                politicalStatus: politicalStatus,
                username: username,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
