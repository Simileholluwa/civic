// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:intl/intl.dart';

class PollCardState {
  final UserRecord creator;
  final String timeAgo;
  final String question;
  final bool hasText;
  final bool hasTags;
  final bool hasLocations;
  final List<UserRecord> tags;
  final List<AWSPlaces> locations;
  final bool hasComments;
  final bool hasLikes;
  final bool hasReposts;
  final PollOption votedOption;
  final List<String> options;
  final List<PollOption> pollOptions;
  final String numberOfVoters;
  final int numberOfOptionVoters;
  final bool isOwner;
  final bool isLiked;
  final bool isBookmarked;
  final int quoteCount;
  final int commentCount;
  final String likesCount;
  final String bookmarksCount;
  final String reasonNotInterested;
  final bool isSendingNotInterested;
  final bool isFollower;
  final bool pollEnded;
  final bool hasVoted;
  final bool isSendingPoll;
  final int totalVotes;
  PollCardState({
    required this.creator,
    required this.timeAgo,
    required this.question,
    required this.hasText,
    required this.hasTags,
    required this.hasLocations,
    required this.tags,
    required this.locations,
    required this.hasComments,
    required this.hasLikes,
    required this.hasReposts,
    required this.votedOption,
    required this.options,
    required this.pollOptions,
    required this.numberOfVoters,
    required this.numberOfOptionVoters,
    required this.isOwner,
    required this.isLiked,
    required this.isBookmarked,
    required this.quoteCount,
    required this.commentCount,
    required this.isFollower,
    this.reasonNotInterested = '',
    this.isSendingNotInterested = false,
    required this.likesCount,
    required this.bookmarksCount,
    this.pollEnded = false,
    this.hasVoted = false,
    this.isSendingPoll = false,
    required this.totalVotes,
  });

  factory PollCardState.populate(Poll poll, Ref ref) {
    final userId = ref.read(localStorageProvider).getInt('userId')!;
    return PollCardState(
      creator: poll.owner!,
      timeAgo: THelperFunctions.humanizeDateTime(poll.createdAt!),
      question: poll.question ?? '',
      hasText: poll.question?.isNotEmpty ?? false,
      hasTags: poll.taggedUsers?.isNotEmpty ?? false,
      hasLocations: poll.locations?.isNotEmpty ?? false,
      tags: poll.taggedUsers!,
      locations: poll.locations!,
      hasComments: false,
      hasLikes: false,
      hasReposts: false,
      numberOfVoters: NumberFormat("#,##0").format(
                  poll.votedBy!.length
                ),
      numberOfOptionVoters: poll.options!.map((e) => e.votedBy).length,
      options: poll.options!.map((e) => e.option!).toList(),
      pollOptions: poll.options!,
      votedOption: poll.options!.firstWhere(
        (e) => e.votedBy!.contains(
          userId,
        ),
        orElse: () => PollOption(
          pollId: 0,
        ),
      ),
      isOwner: poll.owner!.id! == userId,
      isLiked: poll.likedBy!.contains(userId),
      isBookmarked: poll.bookmarkedBy!.contains(userId),
      quoteCount: poll.quoteCount!,
      commentCount: poll.commentCount!,
      isFollower: poll.owner!.followers!.contains(userId),
      likesCount: THelperFunctions.humanizeNumber(poll.likedBy!.length),
      bookmarksCount: THelperFunctions.humanizeNumber(poll.bookmarkedBy!.length),
      pollEnded: poll.expiresAt!.isBefore(DateTime.now()),
      hasVoted: poll.votedBy!.contains(userId),
      totalVotes: poll.votedBy!.length,
    );
  }

  PollCardState copyWith({
    UserRecord? creator,
    String? timeAgo,
    String? question,
    bool? hasText,
    bool? hasTags,
    bool? hasLocations,
    List<UserRecord>? tags,
    List<AWSPlaces>? locations,
    bool? hasComments,
    bool? hasLikes,
    bool? hasReposts,
    PollOption? votedOption,
    List<String>? options,
    List<PollOption>? pollOptions,
    String? numberOfVoters,
    int? numberOfOptionVoters,
    bool? isOwner,
    bool? isLiked,
    bool? isBookmarked,
    int? quoteCount,
    int? commentCount,
    String? likesCount,
    String? bookmarksCount,
    String? reasonNotInterested,
    bool? isSendingNotInterested,
    bool? isFollower,
    bool? isSendingPoll,
    int? totalVotes,
  }) {
    return PollCardState(
      creator: creator ?? this.creator,
      timeAgo: timeAgo ?? this.timeAgo,
      question: question ?? this.question,
      hasText: hasText ?? this.hasText,
      hasTags: hasTags ?? this.hasTags,
      hasLocations: hasLocations ?? this.hasLocations,
      tags: tags ?? this.tags,
      locations: locations ?? this.locations,
      hasComments: hasComments ?? this.hasComments,
      hasLikes: hasLikes ?? this.hasLikes,
      hasReposts: hasReposts ?? this.hasReposts,
      votedOption: votedOption ?? this.votedOption,
      options: options ?? this.options,
      pollOptions: pollOptions ?? this.pollOptions,
      numberOfVoters: numberOfVoters ?? this.numberOfVoters,
      numberOfOptionVoters: numberOfOptionVoters ?? this.numberOfOptionVoters,
      isOwner: isOwner ?? this.isOwner,
      isLiked: isLiked ?? this.isLiked,
      isBookmarked: isBookmarked ?? this.isBookmarked,
      quoteCount: quoteCount ?? this.quoteCount,
      commentCount: commentCount ?? this.commentCount,
      likesCount: likesCount ?? this.likesCount,
      bookmarksCount: bookmarksCount ?? this.bookmarksCount,
      reasonNotInterested: reasonNotInterested ?? this.reasonNotInterested,
      isSendingNotInterested: isSendingNotInterested ?? this.isSendingNotInterested,
      isFollower: isFollower ?? this.isFollower,
      isSendingPoll: isSendingPoll ?? this.isSendingPoll,
      totalVotes: totalVotes ?? this.totalVotes,
    );
  }
}
