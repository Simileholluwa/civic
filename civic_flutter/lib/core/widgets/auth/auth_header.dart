
import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    required this.authTitle,
    required this.authSubTitle,
    super.key,
  });
  final String authTitle;
  final String authSubTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              authTitle,
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 30,),
              textAlign: TextAlign.start,
            ),
            const SizedBox(width: 3),
            const Padding(
              padding: EdgeInsets.only(
                top: TSizes.md + 10,
              ),
              child: AppDecorationDot(),
            ),
          ],
        ),
        const SizedBox(
          height: TSizes.sm,
        ),
        Text(
          authSubTitle,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).hintColor,
              ),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
