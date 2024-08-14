// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/widgets/android_bottom_nav.dart';
import 'package:civic_flutter/core/widgets/auth_app_bar.dart';
import 'package:civic_flutter/core/widgets/auth_header.dart';
import 'package:civic_flutter/features/authentication/presentation/widgets/create_account_request_form.dart';

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
    return AndroidBottomNav(
      child: Scaffold(
        appBar: const AuthAppBar(
          icon: Iconsax.arrow_left_2,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(
            TSizes.defaultSpace,
          ),
          child: Column(
            children: [
              const AuthHeader(
                authTitle: 'Create password',
                authSubTitle: 'Use a combination of alphabets, '
                    'numbers, and symbols',
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
