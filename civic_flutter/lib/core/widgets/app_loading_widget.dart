import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/image_strings.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class AppLoadingWidget extends StatelessWidget {
  const AppLoadingWidget({
    required this.backgroundColor,
    super.key,
  });

  final Color backgroundColor;

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
                height: 120,
                width: 120,
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
                    width: 80,
                    height: 80,
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
