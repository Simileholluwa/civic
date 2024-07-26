// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:civic_flutter/core/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:civic_flutter/core//widgets/app_password_field.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/constants/text_strings.dart';
import 'package:civic_flutter/core/toasts_messages/toast_messages.dart';
import 'package:civic_flutter/core/validators/validation.dart';
import 'package:civic_flutter/core/widgets/app_button.dart';
import 'package:civic_flutter/features/authentication/presentation/state/auth_state_entity.dart';
import 'package:civic_flutter/features/authentication/presentation/provider/auth_provider.dart';
import 'package:civic_flutter/features/authentication/presentation/widgets/terms_of_use.dart';
import 'package:go_router/go_router.dart';

class SignUpForm extends ConsumerStatefulWidget {
  const SignUpForm({
    super.key,
    required this.email,
    required this.politicalStatus,
    required this.username,
  });

  final String email;
  final int politicalStatus;
  final String username;

  @override
  ConsumerState<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends ConsumerState<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  var _isLoading = false;
  var _acceptTerms = false;
  var _showPassword = false;

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(authProvider.notifier);
    ref.listen(authProvider, (_, next) {
      switch (next) {
        case AuthStateLoading():
          _isLoading = true;
        case AuthStateNotLoading():
          _isLoading = false;
        case AuthStateError():
          TToastMessages.errorToast(next.error);
        case AuthStateSuccessfulRequest():
          TToastMessages.successToast(next.successMessage);
        case AuthStateVerificationCode():
          context.goNamed(
            AppRoutes.verifyEmail,
            pathParameters: {
              'email': next.email,
              'politicalStatus': next.politicalStatus.toString(),
              'username': next.username,
              'password': next.password,
            },
          );
        default:
          return;
      }
    });

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
              showPassword: _showPassword,
              onSuffixPressed: () {
                setState(() {
                  _showPassword = !_showPassword;
                });
              },
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            TermsAndConditions(
              acceptTerms: _acceptTerms,
              onChanged: (value) {
                setState(() {
                  _acceptTerms = !value!;
                });
              },
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            FilledButton(
              onPressed: () => controller.createAccountRequest(
                formKey: _formKey,
                acceptTerms: _acceptTerms,
                password: _passwordController.text,
                email: widget.email,
                username: widget.username,
                politicalStatus: widget.politicalStatus,
              ),
              child: const Text(
                TTexts.tContinue,
              ),
            ).withLoading(
              loading: _isLoading,
            ),
          ],
        ),
      ),
    );
  }
}
