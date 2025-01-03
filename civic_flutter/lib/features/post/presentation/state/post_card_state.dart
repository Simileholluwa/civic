// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';

class PostCardState {
  PostCardState({
    required this.photoUrl,
    this.credibilityScore = '',
    this.fullName,
    required this.userName,
    required this.bio,
    required this.timeAgo,
    required this.numberOfViews,
    required this.numberOfLikes,
    required this.numberOfComments,
    required this.displayName,
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
    required this.hasCredibility,
  });

  factory PostCardState.populate(Post post) {
    return PostCardState(
      photoUrl: post.owner!.userInfo!.imageUrl!,
      userName: post.owner!.userInfo!.userName!,
      bio: post.owner!.bio,
      timeAgo: THelperFunctions.humanizeDateTime(
        post.dateCreated ?? DateTime.now(),
      ),
      numberOfViews: '204',
      numberOfLikes: '5',
      numberOfComments: '6',
      displayName:
          post.owner!.userInfo!.fullName ?? post.owner!.userInfo!.userName!,
      text: post.text!,
      hasText: post.text?.isNotEmpty ?? false,
      imageUrls: post.imageUrls!,
      hasImage: post.imageUrls?.isNotEmpty ?? false,
      videoUrl: post.videoUrl!,
      hasVideo: post.videoUrl?.isNotEmpty ?? false,
      locations: post.locations!,
      hasLocation: post.locations?.isNotEmpty ?? false,
      tags: post.tags!,
      hasTags: post.tags?.isNotEmpty ?? false,
      hasCredibility:
          post.owner!.politicalStatus != PoliticalStatus.none ? true : false,
      credibilityScore: post.owner!.credibilityScore.toString(),
    );
  }

  final String bio;
  final String credibilityScore;
  final String displayName;
  final String? fullName;
  final bool hasCredibility;
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
  final String photoUrl;
  final List<String> tags;
  final String text;
  final String timeAgo;
  final String userName;
  final String videoUrl;

  @override
  String toString() {
    return 'PostCardState(photoUrl: $photoUrl, credibilityScore: $credibilityScore, fullName: $fullName, userName: $userName, bio: $bio, timeAgo: $timeAgo, numberOfViews: $numberOfViews, numberOfLikes: $numberOfLikes, numberOfComments: $numberOfComments, displayName: $displayName, text: $text, hasText: $hasText, imageUrls: $imageUrls, hasImage: $hasImage, videoUrl: $videoUrl, hasVideo: $hasVideo, locations: $locations, hasLocation: $hasLocation, tags: $tags, hasTags: $hasTags)';
  }

  PostCardState copyWith({
    String? photoUrl,
    String? credibilityScore,
    String? fullName,
    String? userName,
    String? bio,
    String? timeAgo,
    String? numberOfViews,
    String? numberOfLikes,
    String? numberOfComments,
    String? displayName,
    String? text,
    bool? hasText,
    List<String>? imageUrls,
    bool? hasImage,
    String? videoUrl,
    bool? hasVideo,
    List<AWSPlaces>? locations,
    bool? hasLocation,
    List<String>? tags,
    bool? hasTags,
    bool? hasCredibility,
  }) {
    return PostCardState(
      photoUrl: photoUrl ?? this.photoUrl,
      credibilityScore: credibilityScore ?? this.credibilityScore,
      fullName: fullName ?? this.fullName,
      userName: userName ?? this.userName,
      bio: bio ?? this.bio,
      timeAgo: timeAgo ?? this.timeAgo,
      numberOfViews: numberOfViews ?? this.numberOfViews,
      numberOfLikes: numberOfLikes ?? this.numberOfLikes,
      numberOfComments: numberOfComments ?? this.numberOfComments,
      displayName: displayName ?? this.displayName,
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
      hasCredibility: hasCredibility ?? this.hasCredibility,
    );
  }
}
