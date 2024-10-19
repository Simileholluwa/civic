import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/image_strings.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class AppLoadingWidget extends StatelessWidget {
  const AppLoadingWidget({
    required this.backgroundColor,
    this.size = 100,
    super.key,
  });

  final Color backgroundColor;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: size,
                width: size,
                child: CircularProgressIndicator(
                  color: TColors.primary,
                  backgroundColor: backgroundColor,
                  strokeWidth: 6,
                ),
              ),
              Align(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: TSizes.xs,
                  ),
                  child: Image.asset(
                    TImageTexts.appLogo2,
                    width: size - 30,
                    height: size - 30,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
