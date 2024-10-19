import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class PollDraftSelectOption extends StatelessWidget {
  const PollDraftSelectOption({
    super.key,
    required this.text,
    required this.index,
    required this.optionLength,
  });

  final String text;
  final int index;
  final int optionLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: TSizes.md,
            vertical: TSizes.sm,
          ),
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              TSizes.sm,
            ),
            border: Border.all(
              color: Theme.of(context).dividerColor,
            ),
          ),
          child: Text(
            text,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  fontSize: 17,
                ),
          ),
        ),
        if (index != optionLength - 1)
          const SizedBox(
            height: TSizes.sm,
          ),
      ],
    );
  }
}
