// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostCardState {
  PostCardState({
    required this.creator,
    required this.timeAgo,
    required this.numberOfReposts,
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
    required this.hasLiked,
    required this.mentions,
    required this.hasReposts,
    required this.hasComments,
    required this.hasLikes,
    this.isProjectRepost = false,
    this.isProjectQuote = false,
  });

  factory PostCardState.populate(
    Post post,
    Ref ref,
  ) {
    final userId = ref.read(localStorageProvider).getInt('userId');
    return PostCardState(
      timeAgo: THelperFunctions.humanizeDateTime(
        post.dateCreated ?? DateTime.now(),
      ),
      numberOfLikes: THelperFunctions.humanizeNumber(
        post.likedBy?.length ?? 0,
      ),
      numberOfComments: THelperFunctions.humanizeNumber(
        post.commentBy?.length ?? 0,
      ),
      numberOfReposts: THelperFunctions.humanizeNumber(
        post.repostBy?.length ?? 0,
      ),
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
      hasLiked: post.likedBy?.contains(
            userId,
          ) ??
          false,
      mentions: [],
      hasReposts: post.repostBy?.isNotEmpty ?? false,
      hasComments: post.commentBy?.isNotEmpty ?? false,
      hasLikes: post.likedBy?.isNotEmpty ?? false,
      isProjectRepost: post.project != null,
      isProjectQuote: post.project != null &&
          ((post.text?.isNotEmpty ?? false) ||
              (post.imageUrls?.isNotEmpty ?? false)),
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
  final String numberOfReposts;
  final List<UserRecord> tags;
  final String text;
  final String timeAgo;
  final String videoUrl;
  final UserRecord creator;
  final List<UserRecord> mentions;
  final bool hasLiked;
  final bool hasReposts;
  final bool hasComments;
  final bool hasLikes;
  final bool isProjectRepost;
  final bool isProjectQuote;

  @override
  String toString() {
    return 'PostCardState( timeAgo: $timeAgo, numberOfViews: $numberOfReposts, numberOfLikes: $numberOfLikes, numberOfComments: $numberOfComments, text: $text, hasText: $hasText, imageUrls: $imageUrls, hasImage: $hasImage, videoUrl: $videoUrl, hasVideo: $hasVideo, locations: $locations, hasLocation: $hasLocation, tags: $tags, hasTags: $hasTags)';
  }

  PostCardState copyWith({
    String? timeAgo,
    String? numberOfReposts,
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
    bool? hasLiked,
    List<UserRecord>? mentions,
    bool? hasReposts,
    bool? hasComments,
    bool? hasLikes,
    bool? isProjectRepost,
    bool? isProjectQuote,
  }) {
    return PostCardState(
      timeAgo: timeAgo ?? this.timeAgo,
      numberOfReposts: numberOfReposts ?? this.numberOfReposts,
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
      hasLiked: hasLiked ?? this.hasLiked,
      mentions: mentions ?? this.mentions,
      hasReposts: hasReposts ?? this.hasReposts,
      hasComments: hasComments ?? this.hasComments,
      hasLikes: hasLikes ?? this.hasLikes,
      isProjectRepost: isProjectRepost ?? this.isProjectRepost,
      isProjectQuote: isProjectQuote ?? this.isProjectQuote,
    );
  }

  factory PostCardState.initial() {
    return PostCardState(
      timeAgo: '',
      numberOfReposts: '',
      numberOfLikes: '',
      numberOfComments: '',
      text: '',
      hasText: false,
      imageUrls: [],
      hasImage: false,
      videoUrl: '',
      hasVideo: false,
      locations: [],
      hasLocation: false,
      tags: [],
      hasTags: false,
      creator: UserRecord(
        bio: '',
        userInfoId: 1,
        verifiedAccount: false,
        following: [],
        followers: [],
        politicalStatus: PoliticalStatus.none,
      ),
      hasLiked: false,
      mentions: [],
      hasReposts: false,
      hasComments: false,
      hasLikes: false,
    );
  }
}
