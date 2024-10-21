import 'package:civic_flutter/core/providers/boolean_providers.dart';
import 'package:civic_flutter/features/authentication/presentation/provider/count_down_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AppResendLink extends ConsumerWidget {
  const AppResendLink({
    required this.onTap,
    super.key,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countdownState = ref.watch(countdownTimerProvider);

    String formatTime(int seconds) {
      final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
      final remainingSeconds = (seconds % 60).toString().padLeft(2, '0');
      return '$minutes:$remainingSeconds';
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Text(
            TTexts.notReceived,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).hintColor,
                  fontSize: 17,
                ),
          ),
        ),
        const SizedBox(
          width: TSizes.xs,
        ),
        ref.watch(initiateResendPasswordResetLoadingProvider)
            ? LoadingAnimationWidget.discreteCircle(
                color: TColors.primary,
                size: 12,
              )
            : GestureDetector(
                onTap: countdownState.isCountingDown ? null : onTap,
                child: Text(
                  countdownState.isCountingDown
                      ? 'Retry in ${formatTime(countdownState.secondsRemaining)}'
                      : TTexts.resendEmail,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: countdownState.isCountingDown
                            ? Theme.of(context).disabledColor
                            : TColors.primary,
                        fontSize: 17,
                      ),
                ),
              ),
      ],
    );
  }
}
