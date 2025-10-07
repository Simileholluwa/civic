import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreatContentTextCounter extends ConsumerWidget {
  const CreatContentTextCounter({
    required this.maxLength,
    required this.currentTextLength,
    super.key,
  });

  final int maxLength;
  final int currentTextLength;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 25,
          width: 25,
          child: CircularProgressIndicator(
            value: currentTextLength / maxLength,
            backgroundColor: Theme.of(context).cardColor,
            valueColor: AlwaysStoppedAnimation<Color>(
              currentTextLength / maxLength <= 0.8
                  ? TColors.primary
                  : TColors.secondary,
            ),
          ),
        ),
        if (maxLength - currentTextLength <= 50) Text(
                '${maxLength - currentTextLength}',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: TColors.secondary,
                      fontSize: 12,
                    ),
              ) else const SizedBox(),
      ],
    );
  }
}
