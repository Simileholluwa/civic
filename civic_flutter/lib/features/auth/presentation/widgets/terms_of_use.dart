import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Consumer(builder: (context, ref, _) {
            return Checkbox(
              value: ref.watch(acceptTermsProvider),
              onChanged: (value) {
                if (ref.watch(acceptTermsProvider)) {
                  ref.watch(acceptTermsProvider.notifier).setValue(false);
                } else {
                  ref.watch(acceptTermsProvider.notifier).setValue(true);
                }
              },
            );
          }),
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
