// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';

class PostCardState {
  PostCardState({
    required this.creator,
    required this.timeAgo,
    required this.numberOfReposts,
    required this.numberOfLikes,
    required this.numberOfComments,
    required this.numberOfBookmarks,
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
    required this.postType,
    this.quoteOrRepostUser,
    this.hasReposted = false,
    this.hasCommented = false,
    this.hasBookmarked = false,
    this.isOwner = false,
    this.isFollower = false,
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
        post.likedBy!.length,
      ),
      numberOfComments: THelperFunctions.humanizeNumber(
        post.commentedBy!.length,
      ),
      numberOfReposts: THelperFunctions.humanizeNumber(
        post.quoteCount!,
      ),
      numberOfBookmarks: THelperFunctions.humanizeNumber(
        post.bookmarkedBy!.length,
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
      hasLiked: post.likedBy!.contains(userId),
      mentions: [],
      hasReposted: post.quotedBy!.contains(userId),
      hasCommented: post.commentedBy!.contains(userId),
      hasBookmarked: post.bookmarkedBy!.contains(userId),
      isOwner: post.owner!.id == userId,
      quoteOrRepostUser: post.quotedOrRepostedFromUser,
      postType: post.postType!,
      isFollower:
          userId != post.ownerId && post.owner!.followers!.contains(userId),
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
  final String numberOfBookmarks;
  final List<UserRecord> tags;
  final String text;
  final String timeAgo;
  final String videoUrl;
  final UserRecord? creator;
  final List<UserRecord> mentions;
  final bool hasLiked;
  final bool hasBookmarked;
  final bool hasReposted;
  final bool isOwner;
  final bool isFollower;
  final bool hasCommented;
  final PostType postType;
  final UserRecord? quoteOrRepostUser;

  @override
  String toString() {
    return 'PostCardState( timeAgo: $timeAgo, numberOfViews: $numberOfReposts, numberOfLikes: $numberOfLikes, numberOfComments: $numberOfComments, text: $text, hasText: $hasText, imageUrls: $imageUrls, hasImage: $hasImage, videoUrl: $videoUrl, hasVideo: $hasVideo, locations: $locations, hasLocation: $hasLocation, tags: $tags, hasTags: $hasTags)';
  }

  PostCardState copyWith({
    bool? hasImage,
    bool? hasLocation,
    bool? hasTags,
    bool? hasText,
    bool? hasVideo,
    List<String>? imageUrls,
    List<AWSPlaces>? locations,
    String? numberOfComments,
    String? numberOfLikes,
    String? numberOfReposts,
    String? numberOfBookmarks,
    List<UserRecord>? tags,
    String? text,
    String? timeAgo,
    String? videoUrl,
    UserRecord? creator,
    List<UserRecord>? mentions,
    bool? hasLiked,
    bool? hasBookmarked,
    bool? hasReposted,
    bool? isOwner,
    bool? isFollower,
    bool? hasCommented,
    PostType? postType,
  }) {
    return PostCardState(
      hasImage: hasImage ?? this.hasImage,
      hasLocation: hasLocation ?? this.hasLocation,
      hasTags: hasTags ?? this.hasTags,
      hasText: hasText ?? this.hasText,
      hasVideo: hasVideo ?? this.hasVideo,
      imageUrls: imageUrls ?? this.imageUrls,
      locations: locations ?? this.locations,
      numberOfComments: numberOfComments ?? this.numberOfComments,
      numberOfLikes: numberOfLikes ?? this.numberOfLikes,
      numberOfReposts: numberOfReposts ?? this.numberOfReposts,
      numberOfBookmarks: numberOfBookmarks ?? this.numberOfBookmarks,
      tags: tags ?? this.tags,
      text: text ?? this.text,
      timeAgo: timeAgo ?? this.timeAgo,
      videoUrl: videoUrl ?? this.videoUrl,
      creator: creator ?? this.creator,
      mentions: mentions ?? this.mentions,
      hasLiked: hasLiked ?? this.hasLiked,
      hasBookmarked: hasBookmarked ?? this.hasBookmarked,
      hasReposted: hasReposted ?? this.hasReposted,
      isOwner: isOwner ?? this.isOwner,
      isFollower: isFollower ?? this.isFollower,
      hasCommented: hasCommented ?? this.hasCommented,
      postType: postType ?? this.postType,
    );
  }

  factory PostCardState.empty() {
    return PostCardState(
      timeAgo: '',
      numberOfReposts: '0',
      numberOfLikes: '0',
      numberOfComments: '0',
      numberOfBookmarks: '0',
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
      creator: null,
      hasLiked: false,
      mentions: [],
      postType: PostType.regular,
    );
  }
}
