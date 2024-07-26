// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

@immutable
sealed class OnboardingState {
  const OnboardingState();
}

class OnboardingStateAuth extends OnboardingState {}

class OnboardingStateError extends OnboardingState {
  final String error;
  const OnboardingStateError({
    required this.error,
  });
}

class OnboardingStateUserType extends OnboardingState {
  final bool isPolitical;
  const OnboardingStateUserType({
    required this.isPolitical,
  });
}

class OnboardingStateInitial extends OnboardingState {}
