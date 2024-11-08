// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:civic_flutter/core/services/mention_hashtag_link_text_controller.dart';
import 'package:flutter/material.dart';

import 'package:civic_client/civic_client.dart';

class PollCreationState {
  final String question;
  final List<String> optionText;
  final List<TextEditingController> controllers;
  int duration;
  final List<UserRecord> taggedUsers;
  final List<AWSPlaces> locations;
  final List<UserRecord> mentions;
  final List<String> tags;
  final MentionHashtagLinkTextEditingController questionController;

  PollCreationState({
    required this.question,
    required this.optionText,
    required this.controllers,
    this.duration = 1,
    required this.taggedUsers,
    required this.locations,
    required this.mentions,
    required this.tags,
    required this.questionController,
  });

  PollCreationState copyWith({
    String? question,
    List<String>? optionText,
    List<TextEditingController>? controllers,
    int? duration,
    List<UserRecord>? taggedUsers,
    List<AWSPlaces>? locations,
    List<UserRecord>? mentions,
    List<String>? tags,
    MentionHashtagLinkTextEditingController? questionController,
  }) {
    return PollCreationState(
      question: question ?? this.question,
      duration: duration ?? this.duration,
      optionText: optionText ?? this.optionText,
      controllers: controllers ?? this.controllers,
      taggedUsers: taggedUsers ?? this.taggedUsers,
      locations: locations ?? this.locations,
      mentions: mentions ?? this.mentions,
      tags: tags ?? this.tags,
      questionController: questionController ?? this.questionController,
    );
  }
}
