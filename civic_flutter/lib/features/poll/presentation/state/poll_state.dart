// ignore_for_file: public_member_api_docs, sort_constructors_first, unnecessary_null_comparison
import 'package:civic_flutter/core/services/mention_hashtag_link_text_controller.dart';
import 'package:flutter/material.dart';

import 'package:civic_client/civic_client.dart';

class PollState {
  PollState({
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

  factory PollState.empty() {
    return PollState(
      optionText: ['',''],
      controllers: List.generate(
        2,
        (_) => TextEditingController(),
      ),
      taggedUsers: [],
      locations: [],
      mentions: [],
      tags: [],
      question: '',
      questionController: MentionHashtagLinkTextEditingController(),
    );
  }

  factory PollState.populate(Poll poll) {
    return PollState(
      taggedUsers: poll.taggedUsers ?? [],
      locations: poll.locations ?? [],
      mentions: poll.mentions ?? [],
      tags: poll.tags ?? [],
      question: poll.question ?? '',
      optionText: poll.options == null ? ['',''] : poll.options!.option,
      controllers: poll.options == null
          ? List.generate(
              2,
              (_) => TextEditingController(),
            )
          : List.generate(
              poll.options!.option.length,
              (index) => TextEditingController(
                text: poll.options!.option[index],
              ),
            ),
      duration: poll.pollDuration ?? 1,
      questionController: MentionHashtagLinkTextEditingController(
        text: poll.question,
      ),
    );
  }

  final List<TextEditingController> controllers;
  int duration;
  final List<AWSPlaces> locations;
  final List<UserRecord> mentions;
  final List<String> optionText;
  final String question;
  final MentionHashtagLinkTextEditingController questionController;
  final List<UserRecord> taggedUsers;
  final List<String> tags;

  PollState copyWith({
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
    return PollState(
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
