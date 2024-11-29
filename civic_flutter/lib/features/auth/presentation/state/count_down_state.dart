class CountdownTimerState {
  final int secondsRemaining;
  final bool isCountingDown;

  CountdownTimerState({
    required this.secondsRemaining,
    required this.isCountingDown,
  });

  CountdownTimerState copyWith({
    int? secondsRemaining,
    bool? isCountingDown,
  }) {
    return CountdownTimerState(
      secondsRemaining: secondsRemaining ?? this.secondsRemaining,
      isCountingDown: isCountingDown ?? this.isCountingDown,
    );
  }
}
