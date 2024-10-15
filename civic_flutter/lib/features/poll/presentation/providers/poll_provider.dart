import 'package:civic_flutter/features/poll/presentation/state/poll_creation_state.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'poll_provider.g.dart';

@riverpod
class PollsOptions extends _$PollsOptions {
  @override
  PollCreationState build() {
    return PollCreationState();
  }

  void setQuestion(String question) {
    state = state.copyWith(question: question);
  }

  void addOption() {
    final updatedControllers = [...state.controllers, TextEditingController()];
    state = state.copyWith(optionText: [
      ...state.optionText,
      '',
    ], controllers: updatedControllers,);
  }

  void updateOption(int index, String option) {
    final updatedOptions = [...state.optionText];
    updatedOptions[index] = option;
    state = state.copyWith(optionText: updatedOptions);
  }

  void removeOption(int index) {
    final updatedOptions = [...state.optionText]..removeAt(index);
    final updatedControllers = [...state.controllers]..removeAt(index);
    state = state.copyWith(optionText: updatedOptions, controllers: updatedControllers);
  }

  void setDuration(Duration duration) {
    state = state.copyWith(duration: duration);
  }

  void clearOptions() {
    state.empty();
  }
}
