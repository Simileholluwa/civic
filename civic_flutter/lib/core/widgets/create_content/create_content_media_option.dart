import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';

class CreateContentMediaOption extends StatelessWidget {
  const CreateContentMediaOption({
    super.key,
    required this.mediaOptionsList,
    required this.mediaTile,
  });

  final Widget mediaOptionsList;
  final String mediaTile;

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          mediaTile,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
        ),
        const SizedBox(
          height: TSizes.sm,
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: TSizes.md,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(
              TSizes.sm,
            ),
          ),
          child: mediaOptionsList,
        ),
      ],
    );
  }
}
