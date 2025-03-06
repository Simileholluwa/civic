// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';

class PostState {
  PostState({
    required this.controller,
    required this.imageUrls,
    required this.locations,
    required this.mentions,
    required this.taggedUsers,
    required this.tags,
    required this.text,
    required this.videoUrl,
    required this.isRepost,
    required this.isProjectRepost,
  });

  factory PostState.empty() {
    return PostState(
      text: '',
      imageUrls: [],
      videoUrl: '',
      taggedUsers: [],
      locations: [],
      mentions: [],
      tags: [],
      isRepost: false,
      isProjectRepost: false,
      controller: MentionHashtagLinkTextEditingController(),
    );
  }

  factory PostState.populate(Post post) {
    return PostState(
      text: post.text ?? '',
      imageUrls: post.imageUrls ?? [],
      videoUrl: post.videoUrl ?? '',
      taggedUsers: post.taggedUsers ?? [],
      locations: post.locations ?? [],
      mentions: post.mentions ?? [],
      tags: post.tags ?? [],
      isRepost: post.project != null,
      isProjectRepost: post.isProjectRepost ?? false,
      controller: MentionHashtagLinkTextEditingController(text: post.text),
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
  final bool isRepost;
  final bool isProjectRepost;

  PostState copyWith({
    String? text,
    List<String>? imageUrls,
    String? videoUrl,
    List<UserRecord>? taggedUsers,
    List<AWSPlaces>? locations,
    List<UserRecord>? mentions,
    List<String>? tags,
    bool? isRepost,
    bool? isProjectRepost,
    MentionHashtagLinkTextEditingController? controller,
  }) {
    return PostState(
      text: text ?? this.text,
      imageUrls: imageUrls ?? this.imageUrls,
      videoUrl: videoUrl ?? this.videoUrl,
      taggedUsers: taggedUsers ?? this.taggedUsers,
      locations: locations ?? this.locations,
      mentions: mentions ?? this.mentions,
      tags: tags ?? this.tags,
      controller: controller ?? this.controller,
      isRepost: isRepost ?? this.isRepost,
      isProjectRepost: isProjectRepost ?? this.isProjectRepost,
    );
  }
}
