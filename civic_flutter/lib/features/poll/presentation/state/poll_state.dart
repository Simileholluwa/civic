// ignore_for_file: public_member_api_docs, sort_constructors_first, unnecessary_null_comparison
import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:civic_client/civic_client.dart';

class PollState {
  PollState({
    required this.question,
    required this.optionText,
    required this.controllers,
    required this.expiresAt,
    required this.taggedUsers,
    required this.locations,
    required this.mentions,
    required this.tags,
    required this.questionController,
    required this.images,
  });

  factory PollState.empty() {
    return PollState(
      expiresAt: DateTime.now().add(
        const Duration(days: 1),
      ),
      optionText: ['', ''],
      controllers: List.generate(
        2,
        (_) => TextEditingController(),
      ),
      taggedUsers: [],
      locations: [],
      mentions: [],
      tags: [],
      question: '',
      images: [],
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
      optionText: poll.options == null
          ? ['', '']
          : poll.options!.map((e) => e.option!).toList(
                growable: false,
              ),
      controllers: poll.options == null
          ? List.generate(
              2,
              (_) => TextEditingController(),
            )
          : List.generate(
              poll.options!.length,
              (index) => TextEditingController(
                text: poll.options![index].option,
              ),
            ),
      images: poll.imagesUrl ?? [],
      expiresAt: poll.expiresAt ??
          DateTime.now().add(
            const Duration(days: 1),
          ),
      questionController: MentionHashtagLinkTextEditingController(
        text: poll.question,
      ),
    );
  }

  final List<TextEditingController> controllers;
  final DateTime expiresAt;
  final List<AWSPlaces> locations;
  final List<UserRecord> mentions;
  final List<String> optionText;
  final String question;
  final MentionHashtagLinkTextEditingController questionController;
  final List<UserRecord> taggedUsers;
  final List<String> tags;
  final List<String> images;

  PollState copyWith({
    String? question,
    List<String>? optionText,
    List<TextEditingController>? controllers,
    DateTime? expiresAt,
    List<UserRecord>? taggedUsers,
    List<AWSPlaces>? locations,
    List<UserRecord>? mentions,
    List<String>? tags,
    List<String>? images,
    MentionHashtagLinkTextEditingController? questionController,
  }) {
    return PollState(
      question: question ?? this.question,
      expiresAt: expiresAt ?? this.expiresAt,
      optionText: optionText ?? this.optionText,
      controllers: controllers ?? this.controllers,
      taggedUsers: taggedUsers ?? this.taggedUsers,
      locations: locations ?? this.locations,
      mentions: mentions ?? this.mentions,
      tags: tags ?? this.tags,
      images: images ?? this.images,
      questionController: questionController ?? this.questionController,
    );
  }
}
