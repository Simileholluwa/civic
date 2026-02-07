import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EmailScreen extends StatelessWidget {
  const EmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppAndroidBottomNav(
      child: Scaffold(
        appBar: AuthAppBar(
          icon: Iconsax.arrow_left_2,
          showLeading: false,
        ),
        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.only(
            left: TSizes.defaultSpace,
            right: TSizes.defaultSpace,
            top: TSizes.defaultSpace,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AuthHeader(
                authTitle: 'E-mail address',
                authSubTitle: 'Enter your e-mail address below to get started.',
              ),
              EmailForm(),
            ],
          ),
        ),
      ),
    );
  }
}
