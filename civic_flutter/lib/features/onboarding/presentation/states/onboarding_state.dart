import 'package:flutter/foundation.dart';

@immutable
sealed class OnboardingState {
  const OnboardingState();
}

class OnboardingStateInitial extends OnboardingState {}
