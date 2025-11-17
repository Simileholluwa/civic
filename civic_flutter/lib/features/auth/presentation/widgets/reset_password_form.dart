import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class ResetPasswordForm extends ConsumerWidget {
  const ResetPasswordForm({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.read(authProvider.notifier);
    final initiatePasswordResetLoading = ref.watch(
      authProvider.select(
        (s) => s.initiatePasswordResetLoading,
      ),
    );
    final formKey = ref.read(
      authProvider.select(
        (s) => s.resetPasswordEmailFormKey,
      ),
    );
    final controller = ref.read(
      authProvider.select(
        (s) => s.resetPasswordEmailController,
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
            AppTextField(
              textController: controller!,
              prefixIcon: Iconsax.message,
              hintText: 'your-email@domain.com',
              validator: TValidator.validateEmail,
              textInputType: TextInputType.emailAddress,
              onChanged: (email) {
                authNotifier.setResetPasswordEmail(email!.toLowerCase());
              },
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            FilledButton(
              onPressed: () async {
                final isValid = formKey!.currentState!.validate();
                if (!isValid) return;
                final initiated = await authNotifier.initiatePasswordRequest();
                if (initiated && context.mounted) {
                  await context.push(
                    AppRoutes.verifyResetPasswordCode,
                  );
                }
              },
              child: const Text(
                TTexts.tContinue,
              ),
            ).withLoading(
              loading: initiatePasswordResetLoading,
            ),
          ],
        ),
      ),
    );
  }
}
