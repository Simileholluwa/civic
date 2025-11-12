import 'dart:convert';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class FeedWidgetsState {
  FeedWidgetsState({
    this.creator,
    this.timeAgo = '',
    this.numberOfLikes = '',
    this.numberOfComments = '',
    this.numberOfBookmarks = '',
    this.text = '',
    this.hasText = false,
    this.imageUrls = const <String>[],
    this.hasImage = false,
    this.videoUrl = '',
    this.hasVideo = false,
    this.locations = const <AWSPlaces>[],
    this.hasLocation = false,
    this.tags = const <UserRecord>[],
    this.hasTags = false,
    this.hasLiked = false,
    this.mentions = const <UserRecord>[],
    this.postType = PostType.regular,
    this.reasonNotInterested = '',
    this.hasBookmarked = false,
    this.isOwner = false,
    this.isFollower = false,
    this.isSendingNotInterested = false,
    this.hasVoted = false,
    this.isSendingPoll = false,
    this.numberOfOptionVoters = 0,
    this.numberOfVoters = '',
    this.options = const <String>[],
    this.pollEnded = false,
    this.pollOptions = const <PollOption>[],
    this.quoteCount = '',
    this.articleBanner = '',
    this.articleContent = '',
    this.articleTags = const <String>[],
    this.totalVotes = 0,
    this.isSubscribed = false,
    this.votedOption,
    this.rawContent,
    this.canEdit = false,
  });

  factory FeedWidgetsState.empty() {
    return FeedWidgetsState();
  }

  factory FeedWidgetsState.populate(
    PostWithUserState postWithUserState,
    Ref ref,
  ) {
    final userId = ref.read(localStorageProvider).getInt('userId');
    final post = postWithUserState.post;
    final poll = post.poll;
    return FeedWidgetsState(
      timeAgo: THelperFunctions.humanizeDateTime(
        post.dateCreated ?? DateTime.now(),
      ),
      numberOfLikes: THelperFunctions.humanizeNumber(
        post.likesCount!,
      ),
      numberOfComments: THelperFunctions.humanizeNumber(
        post.commentCount!,
      ),
      numberOfBookmarks: THelperFunctions.humanizeNumber(
        post.bookmarksCount!,
      ),
      text: post.text!,
      hasText: post.text?.isNotEmpty ?? false,
      imageUrls: post.imageUrls ?? [],
      hasImage: post.imageUrls?.isNotEmpty ?? false,
      videoUrl: post.videoUrl ?? '',
      hasVideo: post.videoUrl?.isNotEmpty ?? false,
      locations: post.locations ?? [],
      hasLocation: post.locations?.isNotEmpty ?? false,
      tags: post.taggedUsers ?? [],
      hasTags: post.taggedUsers?.isNotEmpty ?? false,
      creator: post.owner,
      isSubscribed: postWithUserState.isSubscribed!,
      hasLiked: postWithUserState.hasLiked!,
      mentions: [],
      hasBookmarked: postWithUserState.hasBookmarked!,
      isOwner: post.owner!.id == userId,
      postType: post.postType!,
      isFollower:
          userId != post.ownerId && post.owner!.followers!.contains(userId),
      numberOfVoters: NumberFormat('#,##0').format(poll?.votesCount ?? 0),
      numberOfOptionVoters: poll?.options?.map((e) => e.votesCount).length ?? 0,
      options: poll?.options?.map((e) => e.option!).toList() ?? <String>[],
      pollOptions: poll?.options ?? <PollOption>[],
      votedOption: poll?.options?.firstWhere(
        (e) => e.id == postWithUserState.selectedPollOptionId,
        orElse: () => PollOption(
          pollId: 0,
        ),
      ),
      pollEnded: poll?.expiresAt?.isBefore(DateTime.now()) ?? false,
      hasVoted: postWithUserState.selectedPollOptionId != null,
      totalVotes: poll?.votesCount ?? 0,
      articleBanner: post.imageUrls!.isNotEmpty ? post.imageUrls!.first : '',
      articleContent: post.article != null
          ? post.article!.content!.isNotEmpty
              ? Document.fromJson(
                  jsonDecode(
                    post.article!.content!,
                  ) as List,
                ).toPlainText()
              : ''
          : '',
      canEdit: DateTime.now()
                  .difference(
                    post.dateCreated!,
                  )
                  .inMinutes <
              30 &&
          userId == post.ownerId,
      rawContent: post.article != null
          ? post.article!.content!.isNotEmpty
              ? Document.fromJson(
                  jsonDecode(
                    post.article!.content!,
                  ) as List,
                )
              : Document()
          : Document(),
    );
  }

  final UserRecord? creator;
  final bool hasBookmarked;
  final bool hasImage;
  final bool hasLiked;
  final bool hasLocation;
  final bool hasTags;
  final bool hasText;
  final bool hasVideo;
  final bool hasVoted;
  final List<String> imageUrls;
  final bool isFollower;
  final bool isSubscribed;
  final bool isOwner;
  final bool isSendingNotInterested;
  final bool isSendingPoll;
  final List<AWSPlaces> locations;
  final List<UserRecord> mentions;
  final String numberOfBookmarks;
  final String numberOfComments;
  final String numberOfLikes;
  final int numberOfOptionVoters;
  final String numberOfVoters;
  final List<String> options;
  final bool pollEnded;
  final List<PollOption> pollOptions;
  final PostType postType;
  final String quoteCount;
  final String reasonNotInterested;
  final List<UserRecord> tags;
  final String text;
  final String timeAgo;
  final int totalVotes;
  final String videoUrl;
  final PollOption? votedOption;
  final String articleBanner;
  final String articleContent;
  final List<String> articleTags;
  final Document? rawContent;
  final bool canEdit;

  FeedWidgetsState copyWith({
    UserRecord? creator,
    bool? hasBookmarked,
    bool? hasImage,
    bool? hasLiked,
    bool? hasLocation,
    bool? hasTags,
    bool? hasText,
    bool? hasVideo,
    bool? hasVoted,
    List<String>? imageUrls,
    bool? isFollower,
    bool? isOwner,
    bool? isSendingNotInterested,
    bool? isSendingPoll,
    List<AWSPlaces>? locations,
    List<UserRecord>? mentions,
    String? numberOfBookmarks,
    String? numberOfComments,
    String? numberOfLikes,
    int? numberOfOptionVoters,
    String? numberOfVoters,
    List<String>? options,
    bool? pollEnded,
    List<PollOption>? pollOptions,
    PostType? postType,
    String? quoteCount,
    String? reasonNotInterested,
    List<UserRecord>? tags,
    String? text,
    String? timeAgo,
    int? totalVotes,
    String? videoUrl,
    PollOption? votedOption,
    bool? isSubscribed,
  }) {
    return FeedWidgetsState(
      creator: creator ?? this.creator,
      hasBookmarked: hasBookmarked ?? this.hasBookmarked,
      hasImage: hasImage ?? this.hasImage,
      hasLiked: hasLiked ?? this.hasLiked,
      hasLocation: hasLocation ?? this.hasLocation,
      hasTags: hasTags ?? this.hasTags,
      hasText: hasText ?? this.hasText,
      hasVideo: hasVideo ?? this.hasVideo,
      hasVoted: hasVoted ?? this.hasVoted,
      imageUrls: imageUrls ?? this.imageUrls,
      isFollower: isFollower ?? this.isFollower,
      isOwner: isOwner ?? this.isOwner,
      isSendingNotInterested:
          isSendingNotInterested ?? this.isSendingNotInterested,
      isSendingPoll: isSendingPoll ?? this.isSendingPoll,
      locations: locations ?? this.locations,
      mentions: mentions ?? this.mentions,
      numberOfBookmarks: numberOfBookmarks ?? this.numberOfBookmarks,
      numberOfComments: numberOfComments ?? this.numberOfComments,
      numberOfLikes: numberOfLikes ?? this.numberOfLikes,
      numberOfOptionVoters: numberOfOptionVoters ?? this.numberOfOptionVoters,
      numberOfVoters: numberOfVoters ?? this.numberOfVoters,
      options: options ?? this.options,
      pollEnded: pollEnded ?? this.pollEnded,
      pollOptions: pollOptions ?? this.pollOptions,
      postType: postType ?? this.postType,
      quoteCount: quoteCount ?? this.quoteCount,
      reasonNotInterested: reasonNotInterested ?? this.reasonNotInterested,
      isSubscribed: isSubscribed ?? this.isSubscribed,
      tags: tags ?? this.tags,
      text: text ?? this.text,
      timeAgo: timeAgo ?? this.timeAgo,
      totalVotes: totalVotes ?? this.totalVotes,
      videoUrl: videoUrl ?? this.videoUrl,
      votedOption: votedOption ?? this.votedOption,
    );
  }
}
