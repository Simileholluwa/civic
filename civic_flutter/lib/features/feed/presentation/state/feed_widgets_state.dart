import 'package:civic_client/civic_client.dart';

class FeedWidgetsState {
  FeedWidgetsState({
    this.numberOfLikes = 0,
    this.numberOfComments = 0,
    this.numberOfBookmarks = 0,
    this.hasLiked = false,
    this.reasonNotInterested = '',
    this.hasBookmarked = false,
    this.isFollower = false,
    this.isSendingNotInterested = false,
    this.hasVoted = false,
    this.isSendingPoll = false,
    this.optionVoters = const <PollOptionCount>[],
    this.numberOfVoters = 0,
    this.pollEnded = false,
    this.totalVotes = 0,
    this.isSubscribed = false,
    this.votedOption,
    this.impressionCount = 0,
    this.isDeleting = false,
  });

  factory FeedWidgetsState.empty() => FeedWidgetsState();

  factory FeedWidgetsState.populate(
    PostWithUserState postWithUserState,
  ) {
    final post = postWithUserState.post;
    final poll = post.poll;
    return FeedWidgetsState(
      impressionCount: post.impressionsCount ?? 0,
      numberOfLikes: post.likesCount ?? 0,
      numberOfComments: post.commentCount ?? 0,
      numberOfBookmarks: post.bookmarksCount ?? 0,
      isSubscribed: postWithUserState.isSubscribed ?? false,
      hasLiked: postWithUserState.hasLiked ?? false,
      hasBookmarked: postWithUserState.hasBookmarked ?? false,
      numberOfVoters: poll?.votesCount ?? 0,
      isFollower: postWithUserState.isFollower!,
      optionVoters: List<PollOptionCount>.from(
        poll?.options?.map(
              (o) => PollOptionCount(
                optionId: o.id ?? 0,
                votesCount: o.votesCount ?? 0,
              ),
            ) ??
            <PollOptionCount>[],
      ),
      votedOption: poll?.options?.firstWhere(
        (e) => e.id == postWithUserState.selectedPollOptionId,
        orElse: () => PollOption(pollId: 0),
      ),
      pollEnded: poll?.expiresAt?.isBefore(DateTime.now()) ?? false,
      hasVoted: postWithUserState.selectedPollOptionId != null,
      totalVotes: poll?.votesCount ?? 0,
    );
  }

  final bool hasBookmarked;
  final bool hasLiked;
  final bool hasVoted;
  final bool isFollower;
  final bool isSubscribed;
  final bool isSendingNotInterested;
  final bool isSendingPoll;
  final int numberOfBookmarks;
  final int numberOfComments;
  final int numberOfLikes;
  final List<PollOptionCount> optionVoters;
  final int numberOfVoters;
  final bool pollEnded;
  final String reasonNotInterested;
  final int totalVotes;
  final PollOption? votedOption;
  final int impressionCount;
  final bool isDeleting;

  FeedWidgetsState copyWith({
    bool? hasBookmarked,
    bool? hasLiked,
    bool? hasVoted,
    bool? isFollower,
    bool? isOwner,
    bool? isSendingNotInterested,
    bool? isSendingPoll,
    bool? isDeleting,
    int? numberOfBookmarks,
    int? numberOfComments,
    int? numberOfLikes,
    List<PollOptionCount>? optionVoters,
    int? numberOfVoters,
    bool? pollEnded,
    String? reasonNotInterested,
    String? timeAgo,
    int? totalVotes,
    PollOption? votedOption,
    bool? isSubscribed,
    int? impressionCount,
  }) =>
      FeedWidgetsState(
        hasBookmarked: hasBookmarked ?? this.hasBookmarked,
        hasLiked: hasLiked ?? this.hasLiked,
        impressionCount: impressionCount ?? this.impressionCount,
        hasVoted: hasVoted ?? this.hasVoted,
        isFollower: isFollower ?? this.isFollower,
        isSendingNotInterested:
            isSendingNotInterested ?? this.isSendingNotInterested,
        isSendingPoll: isSendingPoll ?? this.isSendingPoll,
        isDeleting: isDeleting ?? this.isDeleting,
        numberOfBookmarks: numberOfBookmarks ?? this.numberOfBookmarks,
        numberOfComments: numberOfComments ?? this.numberOfComments,
        numberOfLikes: numberOfLikes ?? this.numberOfLikes,
        optionVoters: optionVoters ?? this.optionVoters,
        numberOfVoters: numberOfVoters ?? this.numberOfVoters,
        pollEnded: pollEnded ?? this.pollEnded,
        reasonNotInterested: reasonNotInterested ?? this.reasonNotInterested,
        isSubscribed: isSubscribed ?? this.isSubscribed,
        totalVotes: totalVotes ?? this.totalVotes,
        votedOption: votedOption ?? this.votedOption,
      );
}

extension FeedWidgetsStateCounts on FeedWidgetsState {
  FeedWidgetsState applyCounts(PostCounts counts) => copyWith(
        numberOfLikes: counts.likesCount,
        numberOfComments: counts.commentCount,
        numberOfBookmarks: counts.bookmarksCount,
        impressionCount: counts.impressionsCount,
      );
}

extension FeedWidgetsStatePollCounts on FeedWidgetsState {
  FeedWidgetsState applyPollCounts(PollCounts counts) => copyWith(
        totalVotes: counts.votesCount,
        optionVoters: counts.options,
      );
}
