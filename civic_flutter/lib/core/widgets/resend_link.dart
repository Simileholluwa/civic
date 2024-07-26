
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/constants/text_strings.dart';
import 'package:flutter/material.dart';

class ResendLink extends StatelessWidget {
  const ResendLink({
    required this.onTap,
    super.key,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Text(
            TTexts.notReceived,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).hintColor,
                  fontSize: 17,
                ),
          ),
        ),
        const SizedBox(
          width: TSizes.xs,
        ),
        GestureDetector(
                      onTap: onTap,
                      child: Text(
                        TTexts.resendEmail,
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: TColors.primary,
                                  fontSize: 17,
                                ),
                      ),
                    ),
      ],
    );
  }
}
