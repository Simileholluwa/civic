import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class NinForm extends ConsumerWidget {
  const NinForm({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.read(authProvider.notifier);
    return Form(
      key: authNotifier.ninFormKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: TSizes.spaceBtwSections,
        ),
        child: Column(
          children: [
            AppTextField(
              textController: authNotifier.ninController,
              hintText: 'National Identification Number',
              validator: TValidator.validateNin,
              textInputType: TextInputType.number,
              prefixIcon: FontAwesomeIcons.idCardClip,
              iconSize: 22,
              onChanged: (value) {
                authNotifier.setNin(value ?? '');
              },
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            SizedBox(
              height: 55,
              width: double.maxFinite,
              child: FilledButton(
                onPressed: () async {
                  final isValid =
                      authNotifier.ninFormKey.currentState!.validate();
                  if (!isValid) return;
                  final result = await authNotifier.searchNinRecord(
                    ninNumber: authNotifier.ninController.text,
                  );
                  if (result) {
                    if (context.mounted) {
                      await context.push(
                        '/auth/signUp/confirmDetails',
                      );
                    }
                  }
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
