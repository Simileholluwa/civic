import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:flutter/cupertino.dart';

class DecoratingDot extends StatelessWidget {
  const DecoratingDot({
    super.key,
    this.height = 7,
    this.width = 7,
    this.color = TColors.secondary,
  });

  final double height;
  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: TSizes.sm,
      ),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }
}
