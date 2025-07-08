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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 15,
              children: [
                AppTextField(
                  textController: authState.firstNameController,
                  prefixIcon: Iconsax.user,
                  hintText: 'First name',
                  validator: (value) =>
                      TValidator.validateEmptyText('First name', value),
                  onChanged: (value) {
                    authNotifier.setFirstName(
                      authState.firstNameController.text,
                    );
                  },
                ),
                AppTextField(
                  textController: authState.middleNameController,
                  prefixIcon: Iconsax.user,
                  hintText: 'Middle name',
                  validator: (value) => null,
                  onChanged: (value) {
                    authNotifier.setMiddleName(
                      authState.middleNameController.text,
                    );
                  },
                ),
                AppTextField(
                  textController: authState.lastNameController,
                  prefixIcon: Iconsax.user,
                  hintText: 'Last name',
                  validator: (value) =>
                      TValidator.validateEmptyText('Last name', value),
                  onChanged: (value) {
                    authNotifier.setLastName(
                      authState.lastNameController.text,
                    );
                  },
                ),
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            SizedBox(
              height: 55,
              width: double.maxFinite,
              child: FilledButton(
                onPressed: () {
                  final isValid =
                      authState.usernameFormKey.currentState!.validate();
                  if (!isValid) return;
                  context.push(
                    '/auth/signUp/selectStatus',
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
