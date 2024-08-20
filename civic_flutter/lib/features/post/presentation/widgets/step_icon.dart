import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class StepIcon extends StatelessWidget {
  const StepIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Container(
        height: 15,
        width: 15,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: TColors.primary,
        ),
      ),
    );
  }
}
