import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class PoliticalStatusScreen extends StatelessWidget {
  const PoliticalStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppAndroidBottomNav(
      child: Scaffold(
        appBar: AuthAppBar(
          icon: Iconsax.arrow_left_2,
        ),
        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.all(
            TSizes.defaultSpace,
          ),
          child: Column(
            children: [
              AuthHeader(
                authTitle: 'Political status',
                authSubTitle:
                    'Civic will be configured based on your political status.',
              ),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              PoliticalStatusOptions(),
            ],
          ),
        ),
      ),
    );
  }
}
