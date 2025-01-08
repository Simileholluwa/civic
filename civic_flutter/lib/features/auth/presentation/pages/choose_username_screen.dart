import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';

class UsernameScreen extends StatelessWidget {
  const UsernameScreen({
    super.key,
    required this.email,
    required this.politicalStatus,
  });
  final String email;
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
                authTitle: 'Choose a username',
                authSubTitle:
                    'Enter a username that uniquely identifies you.',
              ),
              UsernameForm(
                email: email,
                politicalStatus: politicalStatus,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
