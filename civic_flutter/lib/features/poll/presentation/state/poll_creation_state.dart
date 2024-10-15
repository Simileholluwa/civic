import 'package:civic_client/civic_client.dart';
import 'package:flutter/material.dart';

class PollCreationState {
  String question;
  List<String> optionText;
  List<TextEditingController> controllers;
  Duration duration;

  PollCreationState({
    this.question = '',
    List<PollOption>? options,
    List<String>? optionText,
    List<TextEditingController>? controllers,
    this.duration = const Duration(days: 1),
  }) : optionText = optionText ?? ['', ''],controllers = controllers ??
            List.generate(
              2,
              (_) => TextEditingController(),
              
            );

  PollCreationState copyWith({
    String? question,
    List<String>? optionText,
    List<TextEditingController>? controllers,
    Duration? duration,
  }) {
    return PollCreationState(
      question: question ?? this.question,
      duration: duration ?? this.duration,
      optionText: optionText ?? this.optionText,
      controllers: controllers ?? this.controllers,
    );
  }

  PollCreationState empty({
    String? question,
    List<String>? optionText,
    List<TextEditingController>? controllers,
    Duration? duration,
    }) {
      return PollCreationState(
      question: this.question,
      duration: this.duration,
      optionText: this.optionText,
      controllers: this.controllers,
    );
    }
}
