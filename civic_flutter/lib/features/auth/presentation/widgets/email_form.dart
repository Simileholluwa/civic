import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class EmailForm extends ConsumerWidget {
  const EmailForm({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.watch(authProvider.notifier);
    final authState = ref.watch(authProvider);

    return Form(
      key: authState.emailFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: TSizes.spaceBtwSections,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextField(
              textController: authState.emailController,
              prefixIcon: Iconsax.message,
              hintText: 'your-email@domain.com',
              validator: TValidator.validateEmail,
              textInputType: TextInputType.emailAddress,
              maxLines: 1,
              onChanged: (value) {
                authNotifier.setEmail(
                  authState.emailController.text.toLowerCase(),
                );
              },
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            SizedBox(
              height: 55,
              child: FilledButton(
                onPressed: () async {
                  final isValid =
                      authState.emailFormKey.currentState!.validate();
                  if (!isValid) return;
                  final newUser = await authNotifier.checkIfNewUser();

                  if (!newUser && context.mounted) {
                    await context.push(
                      '/auth/login',
                    );
                  } else {
                    if (context.mounted) {
                      await context.push(
                        '/auth/signUp',
                      );
                    }
                  }
                },
                child: const Text(
                  TTexts.tContinue,
                ),
              ).withLoading(
                loading: ref.watch(checkEmailLoadingProvider),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
