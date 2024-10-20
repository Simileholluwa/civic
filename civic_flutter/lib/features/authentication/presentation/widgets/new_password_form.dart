import 'package:civic_flutter/core/providers/boolean_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/constants/text_strings.dart';
import 'package:civic_flutter/core/validators/validation.dart';
import 'package:civic_flutter/core/widgets/app/app_button.dart';
import 'package:civic_flutter/core/widgets/app/app_password_field.dart';
import 'package:civic_flutter/features/authentication/presentation/provider/auth_provider.dart';

class NewPasswordForm extends ConsumerStatefulWidget {
  const NewPasswordForm({
    super.key,
    required this.code,
    required this.email,
  });

  final String code;
  final String email;

  @override
  ConsumerState<NewPasswordForm> createState() => _NewPasswordFormState();
}

class _NewPasswordFormState extends ConsumerState<NewPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final _newPasswordController = TextEditingController();

  @override
  void dispose() {
    _newPasswordController.dispose();
    super.dispose();
  }

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
            AppPasswordField(
              textController: _newPasswordController,
              validator: TValidator.validatePassword,
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            FilledButton(
              onPressed: () => ref.watch(authProvider.notifier).resetPassword(
                    formKey: _formKey,
                    email: widget.email,
                    newPassword: _newPasswordController.text,
                    code: widget.code,
                    context: context,
                  ),
              child: const Text(
                TTexts.tContinue,
              ),
            ).withLoading(
              loading: ref.watch(resetPasswordLoadingProvider),
            ),
          ],
        ),
      ),
    );
  }
}
