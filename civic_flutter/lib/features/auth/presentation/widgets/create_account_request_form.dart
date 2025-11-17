import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CreateAccountRequestForm extends ConsumerWidget {
  const CreateAccountRequestForm({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.read(authProvider.notifier);
    final createAccountLoading = ref.watch(
      authProvider.select(
        (s) => s.createAccountLoading,
      ),
    );
    final formKey = ref.read(
      authProvider.select(
        (s) => s.newAccountPasswordFormKey,
      ),
    );
    final controller = ref.read(
      authProvider.select(
        (s) => s.newAccountPasswordController,
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
              onChanged: (value) {
                authNotifier.setNewAccountPassword(value!);
              },
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            const TermsAndConditions(),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            SizedBox(
              height: 55,
              child: FilledButton(
                onPressed: () async {
                  final isValid = formKey!.currentState!.validate();
                  if (!isValid) return;
                  final res = await authNotifier.createAccountRequest();
                  if (res && context.mounted) {
                    await context.push(
                      '/auth/signUp/validateCreateAccount',
                    );
                  }
                },
                child: const Text(
                  TTexts.tContinue,
                ),
              ).withLoading(
                loading: createAccountLoading,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
