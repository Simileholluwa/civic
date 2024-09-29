import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/features/post/presentation/provider/post_text_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TextCounter extends ConsumerWidget {
  const TextCounter({
    required this.maxLength,
    super.key,
  });

  final int maxLength;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTextLength = ref.watch(postTextProvider).text.length;
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 25,
          width: 25,
          child: CircularProgressIndicator(
            value: currentTextLength / maxLength,
            backgroundColor: THelperFunctions.isDarkMode(context)
                ? TColors.dark
                : TColors.light,
            valueColor: AlwaysStoppedAnimation<Color>(
              currentTextLength / maxLength <= 0.8
                  ? TColors.primary
                  : TColors.secondary,
            ),
          ),
        ),
        maxLength - currentTextLength <= 90
            ? Text(
                '${maxLength - currentTextLength}',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: TColors.secondary,
                      fontSize: 12,
                    ),
              )
            : const SizedBox(),
      ],
    );
  }
}
