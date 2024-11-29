import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';

class UsernameForm extends ConsumerStatefulWidget {
  const UsernameForm({
    super.key,
    required this.email,
    required this.politicalStatus,
  });

  final String email;
  final int politicalStatus;

  @override
  ConsumerState<UsernameForm> createState() => _UsernameFormState();
}

class _UsernameFormState extends ConsumerState<UsernameForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  var _usernames = <String>[];

  Future<void> usernames() async {
    _usernames = await ref.read(authProvider.notifier).fetchAllUsernames();
  }

  @override
  void initState() {
    super.initState();
    usernames();
  }

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextField(
              textController: _usernameController,
              prefixIcon: Iconsax.user,
              hintText: 'Enter a unique username',
              validator: (value) => TValidator.validateUsername(
                value!,
                _usernames,
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            SizedBox(
              height: 60,
              width: double.maxFinite,
              child: FilledButton(
                onPressed: () =>
                    ref.read(authProvider.notifier).navigateToCreateAccount(
                          widget.email,
                          widget.politicalStatus,
                          THelperFunctions.capitalizeFirst(
                            _usernameController.text.trim(),
                          )!,
                          context,
                          formKey: _formKey,
                        ),
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
