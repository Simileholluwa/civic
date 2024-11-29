import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class EmailForm extends ConsumerStatefulWidget {
  const EmailForm({
    super.key,
  });

  @override
  ConsumerState<EmailForm> createState() => _EmailFormState();
}

class _EmailFormState extends ConsumerState<EmailForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(authProvider.notifier);

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: TSizes.spaceBtwSections,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextField(
              textController: _emailController,
              prefixIcon: Iconsax.message,
              hintText: 'your-email@domain.com',
              validator: TValidator.validateEmail,
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            FilledButton(
              onPressed: () => controller.checkIfNewUser(
                email: _emailController.text.trim().toLowerCase(),
                formKey: _formKey,
                context: context,
              ),
              child: const Text(
                'Get started',
              ),
            ).withLoading(
              loading: ref.watch(checkEmailLoadingProvider),
            ),
          ],
        ),
      ),
    );
  }
}
