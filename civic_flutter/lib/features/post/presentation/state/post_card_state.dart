// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';

class PostCardState {
  PostCardState({
    required this.creator,
    required this.timeAgo,
    required this.numberOfViews,
    required this.numberOfLikes,
    required this.numberOfComments,
    required this.text,
    required this.hasText,
    required this.imageUrls,
    required this.hasImage,
    required this.videoUrl,
    required this.hasVideo,
    required this.locations,
    required this.hasLocation,
    required this.tags,
    required this.hasTags,
  });

  factory PostCardState.populate(Post post) {
    return PostCardState(
      timeAgo: THelperFunctions.humanizeDateTime(
        post.dateCreated ?? DateTime.now(),
      ),
      numberOfViews: '204',
      numberOfLikes: '5',
      numberOfComments: '6',
      text: post.text!,
      hasText: post.text?.isNotEmpty ?? false,
      imageUrls: post.imageUrls!,
      hasImage: post.imageUrls?.isNotEmpty ?? false,
      videoUrl: post.videoUrl!,
      hasVideo: post.videoUrl?.isNotEmpty ?? false,
      locations: post.locations!,
      hasLocation: post.locations?.isNotEmpty ?? false,
      tags: post.taggedUsers!,
      hasTags: post.taggedUsers?.isNotEmpty ?? false,
      creator: post.owner!,
    );
  }

  final bool hasImage;
  final bool hasLocation;
  final bool hasTags;
  final bool hasText;
  final bool hasVideo;
  final List<String> imageUrls;
  final List<AWSPlaces> locations;
  final String numberOfComments;
  final String numberOfLikes;
  final String numberOfViews;
  final List<UserRecord> tags;
  final String text;
  final String timeAgo;
  final String videoUrl;
  final UserRecord creator;
  final List<UserRecord> mentions = [];

  @override
  String toString() {
    return 'PostCardState( timeAgo: $timeAgo, numberOfViews: $numberOfViews, numberOfLikes: $numberOfLikes, numberOfComments: $numberOfComments, text: $text, hasText: $hasText, imageUrls: $imageUrls, hasImage: $hasImage, videoUrl: $videoUrl, hasVideo: $hasVideo, locations: $locations, hasLocation: $hasLocation, tags: $tags, hasTags: $hasTags)';
  }

  PostCardState copyWith({
    String? timeAgo,
    String? numberOfViews,
    String? numberOfLikes,
    String? numberOfComments,
    String? text,
    bool? hasText,
    List<String>? imageUrls,
    bool? hasImage,
    String? videoUrl,
    bool? hasVideo,
    List<AWSPlaces>? locations,
    bool? hasLocation,
    List<UserRecord>? tags,
    bool? hasTags,
    UserRecord? creator,
  }) {
    return PostCardState(
      timeAgo: timeAgo ?? this.timeAgo,
      numberOfViews: numberOfViews ?? this.numberOfViews,
      numberOfLikes: numberOfLikes ?? this.numberOfLikes,
      numberOfComments: numberOfComments ?? this.numberOfComments,
      text: text ?? this.text,
      hasText: hasText ?? this.hasText,
      imageUrls: imageUrls ?? this.imageUrls,
      hasImage: hasImage ?? this.hasImage,
      videoUrl: videoUrl ?? this.videoUrl,
      hasVideo: hasVideo ?? this.hasVideo,
      locations: locations ?? this.locations,
      hasLocation: hasLocation ?? this.hasLocation,
      tags: tags ?? this.tags,
      hasTags: hasTags ?? this.hasTags,
      creator: creator ?? this.creator,
    );
  }
}
