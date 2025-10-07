import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';

class AppUserPLStatusIcon extends StatelessWidget {
  const AppUserPLStatusIcon({
    required this.plStatusIndex, super.key,
  });
  final int plStatusIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: TSizes.xs,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Icon(
            Icons.shield,
            color: TColors.primary,
          ),
          Text(
            plStatusIndex == 0
                ? 'CL'
                : plStatusIndex == 1
                    ? 'FL'
                    : plStatusIndex == 2
                        ? 'AL'
                        : 'CC',
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: TColors.textWhite,
                  fontSize: 9,
                  fontWeight: FontWeight.w800,
                ),
          ),
        ],
      ),
    );
  }
}
