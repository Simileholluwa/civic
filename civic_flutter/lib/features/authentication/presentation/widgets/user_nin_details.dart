import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class UserNinDetails extends StatelessWidget {
  const UserNinDetails({
    required this.value,
    required this.detail,
    super.key,
  });

  final String value;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: TColors.primary,
              ),
        ),
        Text(
          detail,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}
