import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';

class AppLoadingWidget extends StatelessWidget {
  const AppLoadingWidget({
    this.size = 100,
    this.textWidget,
    super.key,
  });

  final double size;
  final Widget? textWidget;

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
                  backgroundColor:THelperFunctions.isDarkMode(context)
                ? TColors.dark
                : TColors.light,
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
          textWidget ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}
