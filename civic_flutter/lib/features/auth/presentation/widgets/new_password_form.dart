// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:go_router/go_router.dart';

class NewPasswordForm extends ConsumerWidget {
  const NewPasswordForm({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final authNotifier = ref.read(authProvider.notifier);
    return Form(
      key: authState.newPasswordFormKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: TSizes.spaceBtwSections,
        ),
        child: Column(
          children: [
            AppPasswordField(
              textController: authState.newPasswordController,
              validator: TValidator.validatePassword,
              onChanged: (password) {
                authNotifier.setNewPassword(password!);
              },
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            FilledButton(
              onPressed: () async {
                final isValid =
                    authState.newPasswordFormKey.currentState!.validate();
                if (!isValid) return;
                final success = await authNotifier.resetPassword();
                if (success) {
                  context.goNamed(AppRoutes.auth);
                }
              },
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
