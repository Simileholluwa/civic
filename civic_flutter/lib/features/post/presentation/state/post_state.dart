// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';

class PostState {
  PostState({
    required this.controller,
    this.imageUrls = const <String>[],
    this.locations = const <AWSPlaces>[],
    this.mentions = const <UserRecord>[],
    this.taggedUsers = const <UserRecord>[],
    this.tags = const <String>[],
    this.text = '',
    this.videoUrl = '',
    this.optionText = const <String>['', ''],
    this.controllers = const <TextEditingController>[],
    this.expiresAt,
  });

  factory PostState.empty() {
    return PostState(
      controller: MentionHashtagLinkTextEditingController(),
      controllers: List.generate(
        2,
        (_) => TextEditingController(),
      ),
      expiresAt: DateTime.now().add(
        const Duration(days: 1),
      ),
    );
  }

  factory PostState.populate(Post post) {
    final poll = post.poll;
    return PostState(
      text: post.text ?? '',
      imageUrls: post.imageUrls ?? [],
      videoUrl: post.videoUrl ?? '',
      taggedUsers: post.taggedUsers ?? [],
      locations: post.locations ?? [],
      mentions: post.mentions ?? [],
      tags: post.tags ?? [],
      controller: MentionHashtagLinkTextEditingController(text: post.text),
      optionText: poll?.options!.map((e) => e.option!).toList(
                growable: false,
              ) ??
          ['', ''],
      controllers: List.generate(
        poll?.options!.length ?? 0,
        (index) => TextEditingController(
          text: poll?.options![index].option,
        ),
      ),
      expiresAt: poll?.expiresAt,
    );
  }

  final MentionHashtagLinkTextEditingController controller;
  final List<String> imageUrls;
  final List<AWSPlaces> locations;
  final List<UserRecord> mentions;
  final List<UserRecord> taggedUsers;
  final List<String> tags;
  final String text;
  final String videoUrl;
  final List<TextEditingController> controllers;
  final DateTime? expiresAt;
  final List<String> optionText;

  PostState copyWith({
    MentionHashtagLinkTextEditingController? controller,
    List<String>? imageUrls,
    List<AWSPlaces>? locations,
    List<UserRecord>? mentions,
    List<UserRecord>? taggedUsers,
    List<String>? tags,
    String? text,
    String? videoUrl,
    List<TextEditingController>? controllers,
    DateTime? expiresAt,
    List<String>? optionText,
  }) {
    return PostState(
      controller: controller ?? this.controller,
      imageUrls: imageUrls ?? this.imageUrls,
      locations: locations ?? this.locations,
      mentions: mentions ?? this.mentions,
      taggedUsers: taggedUsers ?? this.taggedUsers,
      tags: tags ?? this.tags,
      text: text ?? this.text,
      videoUrl: videoUrl ?? this.videoUrl,
      controllers: controllers ?? this.controllers,
      expiresAt: expiresAt ?? this.expiresAt,
      optionText: optionText ?? this.optionText,
    );
  }
}
