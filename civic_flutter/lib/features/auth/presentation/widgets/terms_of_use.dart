import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TermsAndConditions extends ConsumerWidget {
  const TermsAndConditions({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final acceptTerms = ref.watch(
      authProvider.select(
        (s) => s.acceptTerms,
      ),
    );
    final authNotifier = ref.read(authProvider.notifier);
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            value: acceptTerms,
            onChanged: (value) {
              authNotifier.toggleAcceptTerms(value!);
            },
          ),
        ),
        const SizedBox(
          width: TSizes.sm,
        ),
        Flexible(
          child: Text.rich(
            maxLines: 3,
            softWrap: true,
            TextSpan(
              children: [
                TextSpan(
                  text: '${TTexts.iAgreeTo} ',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                TextSpan(
                  text: TTexts.privacyPolicy,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: TColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                TextSpan(
                  text: ' ${TTexts.and} ',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                TextSpan(
                  text: TTexts.termsOfUse,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: TColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
