import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/services/mention_hashtag_link_text_controller.dart';

class PostState {
  final String text;
  final List<String> imageUrls;
  final String videoUrl;
  final List<UserRecord> taggedUsers;
  final List<AWSPlaces> locations;
  final List<UserRecord> mentions;
  final List<String> tags;
  final MentionHashtagLinkTextEditingController controller;
  PostState({
    required this.text,
    required this.imageUrls,
    required this.videoUrl,
    required this.taggedUsers,
    required this.locations,
    required this.mentions,
    required this.tags,
    required this.controller,
  });

  PostState copyWith({
    String? text,
    List<String>? imageUrls,
    String? videoUrl,
    List<UserRecord>? taggedUsers,
    List<AWSPlaces>? locations,
    List<UserRecord>? mentions,
    List<String>? tags,
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
    );
  }
}
