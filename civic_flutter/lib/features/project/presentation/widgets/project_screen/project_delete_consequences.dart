import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';

class ProjectDeleteConsequences extends StatelessWidget {
  const ProjectDeleteConsequences({
    super.key,
    required this.consequence,
    required this.number,
  });

  final String number;
  final String consequence;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 15,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          number,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                
                color: TColors.secondary,
              ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 3,
            ),
            child: Text(
              consequence,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
