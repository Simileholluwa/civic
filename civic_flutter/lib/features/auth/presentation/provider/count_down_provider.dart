import 'dart:async';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'count_down_provider.g.dart';

@riverpod
class CountdownTimer extends _$CountdownTimer {
  Timer? _timer;

  @override
  CountdownTimerState build() {
    return CountdownTimerState(
      secondsRemaining: 0,
      isCountingDown: false,
    );
  }

  void startCountdown() {
    if (_timer != null && _timer!.isActive) return; 
    state = state.copyWith(isCountingDown: true, secondsRemaining: 120);

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.secondsRemaining == 0) {
        timer.cancel();
        state = state.copyWith(isCountingDown: false);
      } else {
        state = state.copyWith(secondsRemaining: state.secondsRemaining - 1);
      }
    });
  }

  void resetTimer() {
    _timer?.cancel();
    state = state.copyWith(secondsRemaining: 0, isCountingDown: false);
  }
}
