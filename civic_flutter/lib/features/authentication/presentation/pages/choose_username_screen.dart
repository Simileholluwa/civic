import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/widgets/app/app_android_bottom_nav.dart';
import 'package:civic_flutter/core/widgets/auth/auth_app_bar.dart';
import 'package:civic_flutter/core/widgets/auth/auth_header.dart';
import 'package:civic_flutter/features/authentication/presentation/widgets/username_form.dart';

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
                    'Enter a username that uniquely identifies you on civic.',
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
