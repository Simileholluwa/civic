// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:civic_flutter/core/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/constants/text_strings.dart';
import 'package:civic_flutter/core/validators/validation.dart';
import 'package:civic_flutter/core/widgets/app_text_field.dart';
import 'package:civic_flutter/features/authentication/presentation/state/auth_state_entity.dart';
import 'package:civic_flutter/features/authentication/presentation/provider/auth_provider.dart';

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
    final controller = ref.watch(authProvider.notifier);
    ref.listen(authProvider, (_, next) {
      switch (next) {
        case AuthStateCreateAccount():
          context.goNamed(
            AppRoutes.signUp,
            pathParameters: {
              'email': next.email,
              'politicalStatus': next.politicalStatus.toString(),
              'username': next.username,
            },
          );
        default:
          return;
      }
    });
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
                value!.toLowerCase(),
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
                onPressed: () => controller.navigateToCreateAccount(
                  widget.email,
                  widget.politicalStatus,
                  _usernameController.text.trim(),
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
