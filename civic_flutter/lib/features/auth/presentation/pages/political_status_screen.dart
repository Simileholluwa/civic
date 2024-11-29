import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class PoliticalStatusScreen extends StatelessWidget {
  const PoliticalStatusScreen({super.key, required this.email});
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
          padding: const EdgeInsets.all(
            TSizes.defaultSpace,
          ),
          child: Column(
            children: [
              const AuthHeader(
                authTitle: 'Political status',
                authSubTitle:
                    'Civic will be configured based on your political status',
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              PoliticalStatusOptions(
                email: email,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
