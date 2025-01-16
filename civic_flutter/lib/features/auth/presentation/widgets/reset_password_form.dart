// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';

class ResetPasswordForm extends ConsumerWidget {
  const ResetPasswordForm({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final authNotifier = ref.read(authProvider.notifier);
    return Form(
      key: authState.resetPasswordEmailFormKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: TSizes.spaceBtwSections,
        ),
        child: Column(
          children: [
            AppTextField(
              textController: authState.resetPasswordEmailController,
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
                final isValid = authState
                    .resetPasswordEmailFormKey.currentState!
                    .validate();
                if (!isValid) return;
                final initiated = await authNotifier.initiatePasswordRequest();
                if (initiated) {
                  context.pushNamed(
                    AppRoutes.verifyResetPasswordCode,
                  );
                }
              },
              child: const Text(
                TTexts.tContinue,
              ),
            ).withLoading(
              loading: ref.watch(initiatePasswordResetLoadingProvider),
            ),
          ],
        ),
      ),
    );
  }
}
