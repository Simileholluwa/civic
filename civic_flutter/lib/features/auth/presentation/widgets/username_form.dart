import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';

class UsernameForm extends ConsumerWidget {
  const UsernameForm({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var usernames = <String>[];
    Future.delayed(
      Duration.zero,
      () async {
        usernames = await ref.read(authProvider.notifier).fetchAllUsernames();
      },
    );
    final authState = ref.watch(authProvider);
    final authNotifier = ref.watch(authProvider.notifier);
    return Form(
      key: authState.usernameFormKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: TSizes.spaceBtwSections,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextField(
              textController: authState.usernameController,
              prefixIcon: Iconsax.user,
              hintText: 'Enter a unique username',
              validator: (value) => TValidator.validateUsername(
                value!,
                usernames,
              ),
              onChanged: (value) {
                authNotifier.setUsername(
                  authState.usernameController.text,
                );
              },
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            SizedBox(
              height: 60,
              width: double.maxFinite,
              child: FilledButton(
                onPressed: () {
                  final isValid =
                      authState.usernameFormKey.currentState!.validate();
                  if (!isValid) return;
                  context.pushNamed(
                    AppRoutes.createAccountRequest,
                  );
                },
                child: const Text(
                  TTexts.tContinue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
