import 'package:civic_flutter/core/providers/boolean_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:civic_flutter/core//widgets/app_password_field.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/constants/text_strings.dart';
import 'package:civic_flutter/core/validators/validation.dart';
import 'package:civic_flutter/core/widgets/app_button.dart';
import 'package:civic_flutter/features/authentication/presentation/provider/auth_provider.dart';
import 'package:civic_flutter/features/authentication/presentation/widgets/terms_of_use.dart';

class CreateAccountRequestForm extends ConsumerStatefulWidget {
  const CreateAccountRequestForm({
    super.key,
    required this.email,
    required this.politicalStatus,
    required this.username,
  });

  final String email;
  final int politicalStatus;
  final String username;

  @override
  ConsumerState<CreateAccountRequestForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends ConsumerState<CreateAccountRequestForm> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  var _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: TSizes.spaceBtwSections,
        ),
        child: Column(
          children: [
            AppPasswordTextField(
              textController: _passwordController,
              validator: TValidator.validatePassword,
              obscurePassword: _showPassword,
              onSuffixPressed: () {
                setState(() {
                  _showPassword = !_showPassword;
                });
              },
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            const TermsAndConditions(),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            FilledButton(
              onPressed: () =>
                  ref.watch(authProvider.notifier).createAccountRequest(
                        formKey: _formKey,
                        password: _passwordController.text,
                        email: widget.email,
                        username: widget.username,
                        politicalStatus: widget.politicalStatus,
                        context: context,
                      ),
              child: const Text(
                TTexts.tContinue,
              ),
            ).withLoading(
              loading: ref.watch(createAccountLoadingProvider),
            ),
          ],
        ),
      ),
    );
  }
}
