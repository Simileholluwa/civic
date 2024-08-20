import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class StepTitle extends StatelessWidget {
  const StepTitle({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.only(
        top: 2,
        left: 6,
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              fontWeight: FontWeight.bold,
              color: isDark ? TColors.textWhite : TColors.dark,
            ),
        maxLines: 1,
      ),
    );
  }
}
