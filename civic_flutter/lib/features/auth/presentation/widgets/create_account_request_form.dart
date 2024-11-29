import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';

class CreateAccountRequestForm extends ConsumerStatefulWidget {
  const CreateAccountRequestForm({
    super.key,
    required this.email,
    required this.politicalStatus,
    required this.username,
  });

  final String email;
  final int politicalStatus;
  final String username;

  @override
  ConsumerState<CreateAccountRequestForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends ConsumerState<CreateAccountRequestForm> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: TSizes.spaceBtwSections,
        ),
        child: Column(
          children: [
            AppPasswordField(
              textController: _passwordController,
              validator: TValidator.validatePassword,
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            const TermsAndConditions(),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            FilledButton(
              onPressed: () =>
                  ref.watch(authProvider.notifier).createAccountRequest(
                        formKey: _formKey,
                        password: _passwordController.text,
                        email: widget.email,
                        username: widget.username,
                        politicalStatus: widget.politicalStatus,
                        context: context,
                      ),
              child: const Text(
                TTexts.tContinue,
              ),
            ).withLoading(
              loading: ref.watch(createAccountLoadingProvider),
            ),
          ],
        ),
      ),
    );
  }
}
