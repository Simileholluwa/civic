
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class PoliticalStatusCard extends StatelessWidget {
  const PoliticalStatusCard({
    required this.onTap,
    required this.indicatorColor,
    required this.title,
    required this.subTitle,
    super.key,
  });
  final Color indicatorColor;
  final String title;
  final VoidCallback onTap;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      borderRadius: const BorderRadius.all(
        Radius.circular(
          TSizes.borderRadiusMd,
        ),
      ),
      child: Ink(
        padding: const EdgeInsets.only(
          bottom: TSizes.sm - 2,
        ),
        width: THelperFunctions.screenWidth() * 0.9,
        decoration: BoxDecoration(
          color: THelperFunctions.isDarkMode(context)
              ? TColors.darkContainer
              : TColors.lightContainer,
          borderRadius: const BorderRadius.all(
            Radius.circular(
              TSizes.borderRadiusMd,
            ),
          ),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: const BorderRadius.all(
            Radius.circular(
              TSizes.borderRadiusMd,
            ),
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: TSizes.sm - 2,
                  width: THelperFunctions.screenWidth() * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(
                        TSizes.borderRadiusMd,
                      ),
                      topRight: Radius.circular(
                        TSizes.borderRadiusMd,
                      ),
                    ),
                    color: indicatorColor,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(TSizes.md),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: TSizes.md,
                  right: TSizes.md,
                  bottom: TSizes.md,
                ),
                child: Text(
                  subTitle,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).hintColor,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
