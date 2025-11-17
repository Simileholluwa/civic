import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class NewPasswordForm extends ConsumerWidget {
  const NewPasswordForm({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.read(authProvider.notifier);
    final resetPasswordLoading = ref.watch(
      authProvider.select(
        (s) => s.resetPasswordLoading,
      ),
    );
    final formKey = ref.read(
      authProvider.select(
        (s) => s.newPasswordFormKey,
      ),
    );
    final controller = ref.read(
      authProvider.select(
        (s) => s.newPasswordController,
      ),
    );
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: TSizes.spaceBtwSections,
        ),
        child: Column(
          children: [
            AppPasswordField(
              textController: controller!,
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
                final isValid = formKey!.currentState!.validate();
                if (!isValid) return;
                final success = await authNotifier.resetPassword();
                if (success && context.mounted) {
                  context.go(AppRoutes.auth);
                }
              },
              child: const Text(
                TTexts.tContinue,
              ),
            ).withLoading(
              loading: resetPasswordLoading,
            ),
          ],
        ),
      ),
    );
  }
}
