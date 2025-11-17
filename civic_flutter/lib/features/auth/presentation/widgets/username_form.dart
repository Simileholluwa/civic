import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class UsernameForm extends ConsumerWidget {
  const UsernameForm({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.read(authProvider.notifier);
    final formKey = ref.read(
      authProvider.select(
        (s) => s.usernameFormKey,
      ),
    );
    final firstNameController = ref.read(
      authProvider.select(
        (s) => s.firstNameController,
      ),
    );
    final middleNameController = ref.read(
      authProvider.select(
        (s) => s.middleNameController,
      ),
    );
    final lastNameController = ref.read(
      authProvider.select(
        (s) => s.lastNameController,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 15,
              children: [
                AppTextField(
                  textController: firstNameController!,
                  prefixIcon: Iconsax.user,
                  hintText: 'First name',
                  validator: (value) =>
                      TValidator.validateEmptyText('First name', value),
                  onChanged: (value) {
                    authNotifier.setFirstName(value ?? '');
                  },
                ),
                AppTextField(
                  textController: middleNameController!,
                  prefixIcon: Iconsax.user,
                  hintText: 'Middle name',
                  validator: (value) => null,
                  onChanged: (value) {
                    authNotifier.setMiddleName(value ?? '');
                  },
                ),
                AppTextField(
                  textController: lastNameController!,
                  prefixIcon: Iconsax.user,
                  hintText: 'Last name',
                  validator: (value) =>
                      TValidator.validateEmptyText('Last name', value),
                  onChanged: (value) {
                    authNotifier.setLastName(value ?? '');
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
                onPressed: () async {
                  final isValid = formKey!.currentState!.validate();
                  if (!isValid) return;
                  await context.push(
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
