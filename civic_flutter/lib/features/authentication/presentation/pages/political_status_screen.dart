import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/widgets/app/app_android_bottom_nav.dart';
import 'package:civic_flutter/core/widgets/auth/auth_app_bar.dart';
import 'package:civic_flutter/core/widgets/auth/auth_header.dart';
import 'package:civic_flutter/features/authentication/presentation/widgets/political_status_card.dart';
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
